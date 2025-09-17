// Flutter imports:

import 'package:flutter_application_bloc/src/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/utils/api_info.dart';
import '../../../../../view_model/blocs/data_bloc/api_data_bloc.dart';
import '../../../../../view_model/blocs/data_bloc/api_data_event.dart';
import '../../../../../view_model/blocs/data_bloc/api_data_state.dart';
import '../../../../general/app_indicator.dart';
import '../../../text_widget.dart';
import '../../../ticker_widget.dart';
import '../../_field_helper/decoration_field.dart';
import '../../_field_helper/form_field_border.dart';
import '../../_field_helper/form_field_dynamic_state_interface.dart';
import '../select_form_field.dart';

// ignore: must_be_immutable
class SelectFieldFieldWidget<MODEL> extends StatefulWidget {
  final String endPoint;
  final Map<String, dynamic>? apiQuery;
  final ScrollPhysics? physics;
  final String Function(MODEL)? showText;
  final bool Function(MODEL? selected, MODEL ofIndex, List<MODEL> items)
  compareItem;
  final FormFieldDynamicStateController<MODEL> controller;
  final Function(MODEL)? onSelect;
  final Function(String?, FormFieldDynamicStateController<MODEL>)? filterData;
  final bool? enabled;
  final DataSource dataSource;
  final List<MODEL>? localData;
  final InputDecoration decoration;
  final DecorationField? decorationField;
  final EdgeInsetsGeometry? marginItem;
  final int Function(List<MODEL> items)? initialSelect;
  final ValueNotifier<MODEL?>? changeValue;
  final Widget Function(
    BuildContext context,
    MODEL item,
    String showText,
    bool selected,
    Function() onTap,
    MODEL? selectedItem,
  )
  itemBuilder;
  final Axis scrollDirection;
  final double? mainHeight;
  final double? secondHeight;

  final bool Function(MODEL item)? filterListWithGettingListFromZero;
  final Widget? noItemWidget;
  const SelectFieldFieldWidget({
    super.key,
    this.noItemWidget,
    required this.itemBuilder,
    required this.compareItem,
    this.showText,
    required this.controller,
    required this.decoration,
    this.onSelect,
    this.localData,
    this.enabled = true,
    required this.endPoint,
    required this.dataSource,
    this.filterData,
    this.decorationField,
    this.marginItem,
    required this.mainHeight,
    this.apiQuery,
    this.filterListWithGettingListFromZero,
    this.initialSelect,
    this.changeValue,
    this.physics,
    required this.scrollDirection,
    this.secondHeight,
  });

  @override
  State<SelectFieldFieldWidget<MODEL>> createState() =>
      _SelectFieldFieldWidgetState<MODEL>();
}

class _SelectFieldFieldWidgetState<MODEL>
    extends State<SelectFieldFieldWidget<MODEL>> {
  ApiDataBloc<MODEL>? bloc;

  @override
  void initState() {
    super.initState();
    if (widget.dataSource == DataSource.remote) {
      bloc =
          ApiDataBloc<MODEL>()..add(
            ApiIndexData(
              queryParams: ApiInfo(
                endpoint: widget.endPoint,
                queries: widget.apiQuery,
              ),
              listWithoutPagination: true,
            ),
          );
    }
  }

  @override
  void didUpdateWidget(covariant SelectFieldFieldWidget<MODEL> oldWidget) {
    // AppLogger.logInfo(" SelectFieldFieldWidget - didUpdateWidget");

    // if (widget.filterData != null && widget.filterData != oldWidget.filterData) {
    //   widget.filterData?.call("", widget.controller);
    // }

    if (widget.dataSource == DataSource.remote &&
        widget.apiQuery != oldWidget.apiQuery) {
      bloc?.add(
        ApiIndexData(
          queryParams: ApiInfo(
            endpoint: widget.endPoint,
            queries: widget.apiQuery,
          ),
          listWithoutPagination: true,
        ),
      );
    }
    /* 
    if (widget.dataSource == DataSource.local && widget.localData != oldWidget.localData) {
      if (!mounted) {
        setState(() {});
      }
    } */

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DecorationField decorationField =
        widget.decorationField ?? DecorationField();
    return InputDecorator(
      decoration: FormFieldBorders.border(
        decoration: widget.decoration,
        enabled: widget.enabled,
        decorationField: decorationField.copyWith(
          labelLock: FloatingLabelBehavior.never,
          contentPadding: EdgeInsetsDirectional.symmetric(
            vertical: context.sizeSide.smallSide * 0.01,
          ),
          constraints: const BoxConstraints(),
        ),
        context: context,
      ),
      child: Padding(
        padding: widget.marginItem ?? EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.decorationField?.hintText != null) ...[
              TextWidget(
                text: widget.decorationField?.hintText ?? 'hint text',
                style:
                    widget.decorationField?.hintStyle ??
                    context.bodyL?.copyWith(color: AppColors.reverseBaseColor),
              ),
              (context.sizeSide.smallSide * .04).ph,
            ],
            if (widget.dataSource == DataSource.remote) ...[
              BlocBuilder<ApiDataBloc<MODEL>, ApiDataState<MODEL>>(
                bloc: bloc,
                builder: (context, state) {
                  return state.maybeMap(
                    idle: (value) => const SizedBox.shrink(),
                    loading: (value) => const Center(child: AppIndicator()),
                    successList: (value) {
                      List<MODEL> dataList = value.data ?? [];
                      // WidgetsBinding.instance.addPostFrameCallback((_) {
                      //   if (!widget.controller.allData.isNotNull) {
                      //     widget.controller.setAllData(dataList);
                      //   }
                      // });

                      if ((widget.initialSelect != null) &&
                          dataList.isNotNull &&
                          widget.controller.data == null) {
                        WidgetsBinding.instance.addPostFrameCallback((
                          timeStamp,
                        ) {
                          int index = widget.initialSelect!.call(dataList);
                          if (widget.changeValue != null) {
                            widget.changeValue!.value = dataList[index];
                          }
                          widget.onSelect?.call(dataList[index]);
                          widget.controller.add(dataList[index]);
                        });
                      }

                      return SizedBox(
                        height:
                            widget.scrollDirection == Axis.vertical
                                ? widget.mainHeight
                                : widget.secondHeight,
                        width:
                            widget.scrollDirection == Axis.horizontal
                                ? widget.mainHeight
                                : widget.secondHeight,
                        child:
                            !(dataList.isNotNull)
                                ? widget.noItemWidget ??
                                    const Center(
                                      child: TextWidget(text: "no Item"),
                                    )
                                : ListView.builder(
                                  physics: widget.physics,
                                  scrollDirection: widget.scrollDirection,
                                  itemBuilder: (context, index) {
                                    return ListenableBuilder(
                                      listenable: widget.controller,
                                      builder: (context, _) {
                                        // if (!mounted) {
                                        //   if (widget.controller.filterData.isNotNull) {
                                        //     dataList = widget.controller.filterData!;
                                        //   } else {
                                        //     dataList = widget.controller.allData!;
                                        //   }
                                        // }

                                        bool isSelected = widget.compareItem
                                            .call(
                                              widget.controller.data,
                                              dataList[index],
                                              dataList,
                                            );

                                        onTap() {
                                          widget.onSelect?.call(
                                            dataList[index],
                                          );
                                          widget.controller.add(
                                            dataList[index],
                                          );
                                        }

                                        return widget.itemBuilder.call(
                                          context,
                                          dataList[index],
                                          (widget.showText?.call(
                                                dataList[index],
                                              )) ??
                                              "",
                                          isSelected,
                                          onTap,
                                          widget.controller.data,
                                        );
                                      },
                                    );
                                  },
                                  // itemCount: (!(widget.controller.filterData.isNotNull)
                                  //         ? widget.controller.allData
                                  //         : widget.controller.filterData as List<MODEL>)
                                  //     ?.length,
                                  itemCount: dataList.length,
                                ),

                        //  : Center()
                      );
                    },
                    error:
                        (value) => Flexible(
                          child: TickerWidget(
                            child: TextWidget(text: value.error?.message ?? ''),
                          ),
                        ),
                    orElse: () => const Center(child: AppIndicator()),
                  );
                },
              ),
            ] else ...[
              Builder(
                builder: (context) {
                  List<MODEL> dataList = widget.localData ?? [];
                  if (widget.initialSelect != null &&
                      dataList.isNotNull &&
                      widget.controller.data == null) {
                    // selectedNotifier.value = dataList[widget.selectIndexDefault!];
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      int index = widget.initialSelect!.call(dataList);
                      if (widget.changeValue != null) {
                        widget.changeValue!.value = dataList[index];
                      }
                      widget.controller.add(dataList[index]);
                    });
                  }
                  return SizedBox(
                    height:
                        widget.scrollDirection == Axis.vertical
                            ? widget.mainHeight
                            : widget.secondHeight,
                    width:
                        widget.scrollDirection == Axis.horizontal
                            ? widget.mainHeight
                            : widget.secondHeight,
                    child:
                        !(dataList.isNotNull)
                            ? widget.noItemWidget ??
                                const Center(child: TextWidget(text: "no Item"))
                            : ListView.builder(
                              physics: widget.physics,
                              scrollDirection: widget.scrollDirection,
                              itemBuilder: (context, index) {
                                return ListenableBuilder(
                                  listenable: widget.controller,
                                  builder: (context, _) {
                                    // if (!mounted) {
                                    //   if (widget.controller.filterData.isNotNull) {
                                    //     dataList = widget.controller.filterData!;
                                    //   } else {
                                    //     dataList = widget.controller.allData!;
                                    //   }
                                    // }

                                    bool isSelected = widget.compareItem.call(
                                      widget.controller.data,
                                      dataList[index],
                                      dataList,
                                    );

                                    onTap() {
                                      widget.onSelect?.call(dataList[index]);
                                      widget.controller.add(dataList[index]);
                                    }

                                    return widget.itemBuilder.call(
                                      context,
                                      dataList[index],
                                      (widget.showText?.call(
                                            dataList[index],
                                          )) ??
                                          "",
                                      isSelected,
                                      onTap,
                                      widget.controller.data,
                                    );
                                  },
                                );
                              },
                              // itemCount: (!(widget.controller.filterData.isNotNull)
                              //         ? widget.controller.allData
                              //         : widget.controller.filterData as List<MODEL>)
                              //     ?.length,
                              itemCount: dataList.length,
                            ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
