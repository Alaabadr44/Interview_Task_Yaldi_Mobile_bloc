// Flutter imports:
import 'dart:math';

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
import '../../../custom_expansion_tile.dart';
import '../../../text_widget.dart';
import '../../_field_helper/decoration_field.dart';
import '../../_field_helper/form_field_border.dart';
import '../../_field_helper/form_field_dynamic_list_state_interface.dart';
import '../multi_select_form_field.dart';

class MultiSelectFieldWidget<MODEL> extends StatefulWidget {
  final Widget Function(MODEL model) itemBuilder;
  final FormFieldDynamicListStateController<MODEL> controller;
  final Function(MODEL selectItem)? selectItem;
  final List<MODEL>? initValue;
  final String endPoint;
  final DataSource? dataSource;
  final List<MODEL>? localData;
  final EdgeInsetsGeometry? margin;
  final bool? enabled;
  final bool isExpanded;
  final InputDecoration decoration;
  final DecorationField? decorationField;
  final Map<String, dynamic>? queries;
  final Color? arrowColor;
  final EdgeInsetsGeometry? headerPadding;
  final double? itemHeight;
  final double? expectedHeight;
  final Widget? gap;
  const MultiSelectFieldWidget({
    super.key,
    required this.itemBuilder,
    this.selectItem,
    this.expectedHeight,
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
    this.arrowColor,
    this.gap,
    this.headerPadding,
    this.itemHeight,
    this.isExpanded = false,
  });

  @override
  State<MultiSelectFieldWidget<MODEL>> createState() => _MultiSelectFieldWidgetState<MODEL>();
}

class _MultiSelectFieldWidgetState<MODEL> extends State<MultiSelectFieldWidget<MODEL>> {
  ApiDataBloc<MODEL>? bloc;
  ValueNotifier<List<bool>>? checkNotifier;
  late bool isSuccessData;

  @override
  void initState() {
    super.initState();
    if (widget.dataSource == DataSource.remote) {
      bloc = ApiDataBloc<MODEL>();
      getData();
      isSuccessData = true;
    }
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

  @override
  void dispose() {
    bloc?.close();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant MultiSelectFieldWidget<MODEL> oldWidget) {
    if (!(widget.controller.data.isNotNull) && checkNotifier != null && (checkNotifier!.value.isNotNull)) {
      checkNotifier?.value = List.filled(checkNotifier!.value.length, false);
    }

    if (widget.queries?.values.first != oldWidget.queries?.values.first) {
      getData();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    DecorationField decorationField = widget.decorationField ?? DecorationField();
    return Padding(
      padding: EdgeInsets.zero,
      child: InputDecorator(
        decoration: FormFieldBorders.border(
          decoration: widget.decoration,
          enabled: widget.enabled,
          decorationField: decorationField.copyWith(
            labelLock: FloatingLabelBehavior.never,
            contentPadding: decorationField.contentPadding ??
                EdgeInsetsDirectional.symmetric(vertical: context.sizeSide.smallSide * 0.01),
            constraints: decorationField.constraints ?? const BoxConstraints(),
          ),
          context: context,
        ),
        child: CustomExpansionTile(
          borderColor: Colors.transparent,
          headerPadding: widget.headerPadding,
          initiallyExpanded: widget.isExpanded,
          title: TextWidget(
            text: widget.decorationField?.hintText ?? '',
            style: widget.decorationField?.hintStyle,
          ),
          iconColor: widget.arrowColor ?? Colors.white,
          crossAxisAlignment: CrossAxisAlignment.start,
          onExpansionChanged: (isOpen) {
            if (isOpen && !isSuccessData) {
              getData();
              isSuccessData = true;
            }
          },
          children: [
            BlocBuilder<ApiDataBloc<MODEL>, ApiDataState<MODEL>>(
              bloc: bloc,
              builder: (context, state) {
                return state.maybeMap(
                  loading: (value) {
                    return const Center(child: AppIndicator());
                  },
                  error: (value) {
                    isSuccessData = false;
                    return TextWidget(text: value.error?.message ?? '');
                  },
                  successList: (value) {
                    final data = value.data ?? [];
                    if (checkNotifier == null) {
                      checkNotifier = ValueNotifier(List.filled(data.length, false));
                      widget.initValue?.forEach((element) {
                        if (data.contains(element)) {
                          int index = data.indexOf(element);
                          // if (widget.selectItem != null) {
                          //   widget.selectItem!.call(element);
                          // }
                          changeCheck(index);
                        }
                      });
                    }
                    double sizeBoxHeight = ((widget.itemHeight ?? kButtonHeight) * data.length).toDouble();
                    return SizedBox(
                      height: widget.expectedHeight == null ? sizeBoxHeight : min(widget.expectedHeight!, sizeBoxHeight),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => widget.gap ?? 12.ph,
                        itemCount: data.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () => onClickItem(index, data[index]),
                          child: ValueListenableBuilder(
                            valueListenable: checkNotifier!,
                            builder: (context, value, _) {
                              return SizedBox(
                                height: widget.itemHeight ?? kButtonHeight,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      value: checkNotifier?.value[index],
                                      activeColor: AppColors.secondaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      side: const BorderSide(color: AppColors.secondaryColor, width: 2),
                                      visualDensity: const VisualDensity(horizontal: -4),
                                      onChanged: (value) {
                                        if (value != null) {
                                          onClickItem(index, data[index]);
                                        }
                                      },
                                    ),
                                    Expanded(
                                      child: widget.itemBuilder.call(data[index]),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                  orElse: () {
                    isSuccessData = false;
                    return const SizedBox.shrink();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void onClickItem(int index, MODEL model) {
    if (widget.selectItem != null) {
      widget.selectItem?.call(model);
    }
    changeCheck(index);
    saveUnSaveChecked(checkNotifier!.value[index], model);
  }

  void changeCheck(int index) {
    final dataList = checkNotifier!.value;
    dataList[index] = !dataList[index];
    checkNotifier!.value = List.from(dataList);
  }

  void saveUnSaveChecked(bool isChecked, MODEL model) {
    if (isChecked) {
      widget.controller.add(model);
    } else {
      widget.controller.delete(model);
    }
  }
}
