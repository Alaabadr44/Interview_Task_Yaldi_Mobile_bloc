import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../core/utils/api_info.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../../../view_model/blocs/data_bloc/api_data_bloc.dart';
import '../../../../../view_model/blocs/data_bloc/api_data_event.dart';
import '../../../../../view_model/blocs/data_bloc/api_data_state.dart';
import '../../../../general/app_indicator.dart';
import '../../../text_widget.dart';
import '../../_field_helper/decoration_field.dart';
import '../../_field_helper/form_field_dynamic_state_interface.dart';
import '../search_form_field.dart';

class OverlayFieldWidget<MODEL> extends StatelessWidget {
  final CustomPopupMenuController popupController;
  final TextEditingController textController;
  final String name;
  final ApiDataBloc<MODEL>? bloc;
  final DataSource dataSource;
  final List<MODEL>? localData;
  final DecorationField? decorationField;
  final String endPoint;
  final Widget Function(MODEL) itemBuilder;
  final FormFieldDynamicStateController<MODEL> controller;
  final String Function(MODEL)? selectedItem;
  final Function(MODEL selectedModel) onTapItem;
  final double? gapBetween;
  final bool enabled;
  final VoidCallback? onTap;
  final bool enableTextField;
  final InputDecoration? inputDecoration;
  final TextStyle? textStyle;
  final double? customItemHight;
  final double? customHight;
  final double? customWidth;
  final bool Function(MODEL item, dynamic initSelectionValue)? initialSelectBy;
  final dynamic initSelectionValue;

  const OverlayFieldWidget({
    super.key,
    this.customItemHight,
    this.customHight,
    this.customWidth,
    this.textStyle,
    required this.popupController,
    required this.enableTextField,
    required this.textController,
    this.bloc,
    this.inputDecoration,
    required this.endPoint,
    required this.itemBuilder,
    required this.controller,
    required this.name,
    this.selectedItem,
    required this.onTapItem,
    this.gapBetween,
    this.decorationField,
    required this.enabled,
    this.onTap,
    required this.dataSource,
    this.localData,
    this.initialSelectBy,
    this.initSelectionValue,
  });

  void _autoSelectInitialItem(List<MODEL> items, BuildContext context) {
    if (initialSelectBy != null &&
        initSelectionValue != null &&
        controller.data == null &&
        items.isNotEmpty) {
      // Find the item that matches the initial selection criteria
      final matchingItem = items.firstWhereOrNull<MODEL>(
        (item) => initialSelectBy!(item, initSelectionValue),
      );

      // If a m atching item is found, select it
      if (matchingItem != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Check if the context is still mounted before executing
          if (context.mounted) {
            textController.text = selectedItem?.call(matchingItem) ?? '';
            onTapItem.call(matchingItem);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      controller: popupController,
      menuBuilder: () {
        return SizedBox(
          height: customHight ?? (customItemHight != null ? null : 250),
          width: customWidth ?? double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kRadiusSmall),
            child: Card(
              elevation: 0,
              child: dataSource == DataSource.remote
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          BlocBuilder<ApiDataBloc<MODEL>, ApiDataState<MODEL>>(
                        bloc: bloc,
                        builder: (context, state) {
                          return state.maybeMap(
                            successList: (value) {
                              List<MODEL> items = value.data ?? [];
                              controller.setAllData(items);

                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                // Auto-select item if initialSelectBy is provided
                                _autoSelectInitialItem(items, context);
                              });

                              return ListenableBuilder(
                                listenable: controller,
                                builder: (BuildContext context, Widget? child) {
                                  items = controller.filterData ??
                                      controller.allData ??
                                      [];
                                  return SizedBox(
                                    height: customItemHight != null
                                        ? (items.length * customItemHight!)
                                            .toDouble()
                                        : null,
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount: items.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          visualDensity:
                                              const VisualDensity(vertical: -3),
                                          onTap: () {
                                            onSelect(items, index);
                                          },
                                          title: itemBuilder.call(items[index]),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            error: (value) => Center(
                                child: TextWidget(
                                    text: value.error?.message ?? '')),
                            orElse: () => const AppIndicator(),
                          );
                        },
                      ),
                    )
                  : Builder(
                      builder: (context) {
                        List<MODEL> dataList = localData ?? [];
                        List<MODEL> items = dataList;
                        controller.setAllData(items);
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          // executes after build
                          // Auto-select item if initialSelectBy is provided
                          _autoSelectInitialItem(items, context);
                        });
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            items = controller.filterData ??
                                controller.allData ??
                                [];
                            return ListenableBuilder(
                              listenable: controller,
                              builder: (context, _) {
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  visualDensity:
                                      const VisualDensity(vertical: -3),
                                  onTap: () {
                                    onSelect(items, index);
                                  },
                                  title: itemBuilder.call(items[index]),
                                );

                                // if (!mounted) {
                                //   if (widget.controller.filterData.isNotNull) {
                                //     dataList = widget.controller.filterData!;
                                //   } else {
                                //     dataList = widget.controller.allData!;
                                //   }
                                // }
                                /* 
                              bool isSelected = widget.compareItem.call(
                                  widget.controller.data,
                                  dataList[index],
                                  dataList);
              
                              onTap() {
                                widget.onSelect?.call(dataList[index]);
                                widget.controller.add(dataList[index]);
                              }
              
                              return widget.itemBuilder.call(
                                context,
                                dataList[index],
                                (widget.showText?.call(dataList[index])) ??
                                    "",
                                isSelected,
                                onTap,
                                widget.controller.data,
                              );
                               */
                              },
                            );
                          },
                          itemCount: (!(controller.filterData.isNotNull)
                                  ? controller.allData
                                  : controller.filterData as List<MODEL>)
                              ?.length,
                          // itemCount: dataList.length,
                        );
                      },
                    ),
            ),
          ),
        );
      },
      showArrow: false,
      verticalMargin: gapBetween ?? 0,
      position: PreferredPosition.bottom,
      pressType: PressType.singleClick,
      child: GestureDetector(
        onTap: () {
          if (enabled) {
            _onTap();
          }
          onTap?.call();
        },
        child: SizedBox(
          height: 30,
          child: FormBuilderTextField(
            name: "S-$name",
            controller: textController,
            enabled: enableTextField,
            style: textStyle ?? context.bodyL,
            onTap: enableTextField
                ? () {
                    _onTap();
                  }
                : null,
            decoration: _inputDecoration(inputDecoration),
          ),
        ),
      ),
    );
  }

  void onSelect(List<dynamic> items, int index) {
    textController.text = selectedItem?.call(items[index]) ?? '';
    onTapItem.call(items[index]);
    if (popupController.menuIsShowing) {
      popupController.hideMenu();
    }
  }

  InputDecoration _inputDecoration(InputDecoration? decoration) {
    return decoration ??
        InputDecoration(
          hintText: decorationField?.hintText,
          hintStyle: decorationField?.hintStyle,
          border: InputBorder.none,
        );
  }

  void _onTap() {
    if (!enableTextField) {
      FocusManager.instance.primaryFocus?.unfocus();
    }

    bloc?.add(ApiIndexData(
        queryParams: ApiInfo(endpoint: endPoint), listWithoutPagination: true));
    controller.data != null ? controller.delete() : null;
    textController.text.isNotEmpty ? textController.clear() : null;
    popupController.showMenu();
  }
}
