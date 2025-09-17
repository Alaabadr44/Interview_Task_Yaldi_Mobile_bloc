// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/utils/api_info.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../../../view_model/blocs/data_bloc/api_data_bloc.dart';
import '../../../../../view_model/blocs/data_bloc/api_data_event.dart';
import '../../../../../view_model/blocs/data_bloc/api_data_state.dart';
import '../../../../general/app_indicator.dart';
import '../../../text_widget.dart';
import '../../_field_helper/decoration_field.dart';
import '../../_field_helper/form_field_border.dart';
import '../../_field_helper/form_field_dynamic_list_state_interface.dart';
import '../multi_select_form_field.dart';

class SimpleMultiDropdownFieldWidget<MODEL> extends StatefulWidget {
  final Widget Function(MODEL model) itemBuilder;
  final String Function(MODEL model) itemLabelExtractor;
  final FormFieldDynamicListStateController<MODEL> controller;
  final Function(MODEL selectItem)? selectItem;
  final List<MODEL>? initValue;
  final String endPoint;
  final DataSource? dataSource;
  final List<MODEL>? localData;
  final EdgeInsetsGeometry? margin;
  final bool? enabled;
  final InputDecoration decoration;
  final DecorationField? decorationField;
  final Map<String, dynamic>? queries;
  final int? maxSelections;
  final bool searchEnabled;
  final String? searchHintText;
  final double? dropdownHeight;
  final bool Function(MODEL model1, MODEL model2)? compareItem;

  const SimpleMultiDropdownFieldWidget({
    super.key,
    required this.itemBuilder,
    required this.itemLabelExtractor,
    this.selectItem,
    this.initValue,
    required this.endPoint,
    this.dataSource,
    this.queries,
    this.localData,
    this.margin,
    this.decorationField,
    required this.decoration,
    this.enabled,
    required this.controller,
    this.maxSelections,
    this.searchEnabled = false,
    this.searchHintText,
    this.dropdownHeight,
    this.compareItem,
  });

  @override
  State<SimpleMultiDropdownFieldWidget<MODEL>> createState() =>
      _SimpleMultiDropdownFieldWidgetState<MODEL>();
}

class _SimpleMultiDropdownFieldWidgetState<MODEL>
    extends State<SimpleMultiDropdownFieldWidget<MODEL>> {
  ApiDataBloc<MODEL>? bloc;
  late bool isSuccessData;
  List<MODEL> _allData = [];
  List<MODEL> _filteredData = [];
  final TextEditingController _searchController = TextEditingController();
  bool _hasSetupInitialSelection = false;

  @override
  void initState() {
    super.initState();
    if (widget.dataSource == DataSource.remote) {
      bloc = ApiDataBloc<MODEL>();
      getData();
      isSuccessData = true;
    } else if (widget.dataSource == DataSource.local &&
        widget.localData != null) {
      _allData = widget.localData!;
      _filteredData = _allData;
      _setupInitialSelection();
      _hasSetupInitialSelection = true;
    }

    _searchController.addListener(_onSearchChanged);
  }

  void getData() {
    bloc?.add(ApiIndexData(
      queryParams: ApiInfo(
        endpoint: widget.endPoint,
        queries: widget.queries,
      ),
      listWithoutPagination: true,
    ));
  }

  void _setupInitialSelection() {
    if (widget.initValue != null && widget.initValue!.isNotEmpty) {
      for (final item in widget.initValue!) {
        if (_isItemInData(item, _allData)) {
          widget.controller.add(item);
        }
      }
    }
  }

  bool _isItemSelected(MODEL item) {
    if (widget.compareItem != null) {
      return widget.controller.data
          .any((selectedItem) => widget.compareItem!(item, selectedItem));
    }
    return widget.controller.data.contains(item);
  }

  bool _isItemInData(MODEL item, List<MODEL> dataList) {
    if (widget.compareItem != null) {
      return dataList.any((dataItem) => widget.compareItem!(item, dataItem));
    }
    return dataList.contains(item);
  }

  MODEL? _findSelectedItem(MODEL item) {
    if (widget.compareItem != null) {
      for (final selectedItem in widget.controller.data) {
        if (widget.compareItem!(item, selectedItem)) {
          return selectedItem;
        }
      }
      return null;
    }
    return widget.controller.data.contains(item) ? item : null;
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredData = _allData;
      } else {
        _filteredData = _allData.where((item) {
          final label = widget.itemLabelExtractor(item).toLowerCase();
          return label.contains(query);
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    bloc?.close();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label if provided
          if (widget.decoration.labelText != null) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextWidget(
                text: widget.decoration.labelText!,
                style: widget.decoration.labelStyle ??
                    context.titleS?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimaryColor,
                    ),
              ),
            ),
          ],
          if (widget.dataSource == DataSource.remote)
            // Multi Dropdown Widget with InputDecorator
            BlocBuilder<ApiDataBloc<MODEL>, ApiDataState<MODEL>>(
              bloc: bloc,
              builder: (context, state) {
                return state.maybeMap(
                  loading: (value) {
                    return _buildInputDecorator(
                      context,
                      child: const SizedBox(
                        height: 56,
                        child: Center(child: AppIndicator()),
                      ),
                    );
                  },
                  error: (value) {
                    isSuccessData = false;
                    return _buildInputDecorator(
                      context,
                      child: SizedBox(
                        height: 56,
                        child: Center(
                          child: TextWidget(
                            text: value.error?.message ?? 'Error loading data',
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    );
                  },
                  successList: (value) {
                    final data = value.data ?? [];
                    _allData = data;
                    _filteredData = data;

                    if (!_hasSetupInitialSelection &&
                        widget.initValue != null &&
                        widget.initValue!.isNotEmpty) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _setupInitialSelection();
                        _hasSetupInitialSelection = true;
                      });
                    }

                    return _buildInputDecorator(context,
                        child: _buildDropdownField());
                  },
                  orElse: () {
                    if (widget.dataSource == DataSource.local &&
                        widget.localData != null) {
                      return _buildInputDecorator(context,
                          child: _buildDropdownField());
                    }
                    isSuccessData = false;
                    return const SizedBox.shrink();
                  },
                );
              },
            )
          else if (widget.dataSource == DataSource.local &&
              widget.localData != null)
            _buildInputDecorator(
              context,
              child: _buildDropdownField(),
            )
          else
            const SizedBox.shrink()
        ],
      ),
    );
  }

  Widget _buildInputDecorator(BuildContext context, {required Widget child}) {
    DecorationField decorationField =
        widget.decorationField ?? DecorationField();

    return InputDecorator(
      decoration: FormFieldBorders.border(
        decoration: widget.decoration,
        enabled: widget.enabled,
        decorationField: decorationField.copyWith(
          labelLock: FloatingLabelBehavior.never,
          contentPadding: decorationField.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          constraints: decorationField.constraints ?? const BoxConstraints(),
        ),
        context: context,
      ),
      child: child,
    );
  }

  Widget _buildDropdownField() {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, child) {
        return Column(
          children: [
            // Selected Items Section
            if (widget.controller.data.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.controller.data.map((item) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.primaryColor.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextWidget(
                            text: widget.itemLabelExtractor(item),
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () => widget.controller.delete(item),
                            child: const Icon(
                              Icons.close,
                              size: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

            // Dropdown Button
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grey100,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<MODEL>(
                  isExpanded: true,
                  hint: TextWidget(
                    text: widget.decoration.hintText ?? 'Select items',
                    style: const TextStyle(
                      color: AppColors.grey500,
                      fontSize: 14,
                    ),
                  ),
                  value: null,
                  items: _filteredData.map((MODEL item) {
                    final isSelected = _isItemSelected(item);
                    return DropdownMenuItem<MODEL>(
                      value: item,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextWidget(
                                text: widget.itemLabelExtractor(item),
                                style: TextStyle(
                                  color: isSelected
                                      ? AppColors.grey500
                                      : Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            if (isSelected)
                              const Icon(
                                Icons.check_circle,
                                color: AppColors.primaryColor,
                                size: 20,
                              ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (MODEL? newValue) {
                    if (newValue != null) {
                      final selectedItem = _findSelectedItem(newValue);
                      if (selectedItem != null) {
                        // Remove item if already selected
                        widget.controller.delete(selectedItem);
                      } else {
                        // Check max selections before adding
                        if (widget.maxSelections != null &&
                            widget.maxSelections! > 0 &&
                            widget.controller.data.length >=
                                widget.maxSelections!) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: TextWidget(
                                  text:
                                      'Maximum ${widget.maxSelections} selections allowed'),
                              backgroundColor: Colors.orange,
                            ),
                          );
                          return;
                        }
                        // Add item
                        widget.controller.add(newValue);
                        widget.selectItem?.call(newValue);
                      }
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
