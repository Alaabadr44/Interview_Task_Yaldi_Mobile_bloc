// Flutter imports:
// Package imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/utils/api_info.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../../../view_model/blocs/data_bloc/api_data_bloc.dart';
import '../../../../../view_model/blocs/data_bloc/api_data_event.dart';
import '../../../../../view_model/blocs/data_bloc/api_data_state.dart';
import '../../../../general/app_indicator.dart';
import '../../../custom_error_widget.dart';
import '../../../text_widget.dart';
import '../../../ticker_widget.dart';
import '../../_field_helper/decoration_field.dart';
import '../../_field_helper/form_field_border.dart';
import '../../_field_helper/form_field_dynamic_state_interface.dart';
import '../radio_form_field.dart';

class RadioFieldWidget<MODEL> extends StatefulWidget {
  final String endPoint;
  final Map<String, dynamic>? apiQuery;
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
  final double height;
  final int Function(List<MODEL> items)? initialSelect;
  final ValueNotifier<MODEL?>? changeValue;

  const RadioFieldWidget({
    super.key,
    // required this.itemBuilder,
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
    required this.height,
    this.apiQuery,
    this.initialSelect,
    this.changeValue,
  });

  @override
  State<RadioFieldWidget<MODEL>> createState() =>
      _RadioFieldWidgetState<MODEL>();
}

class _RadioFieldWidgetState<MODEL> extends State<RadioFieldWidget<MODEL>> {
  ApiDataBloc<MODEL>? bloc;

  // late final ValueNotifier<MODEL?> selectedNotifier;

  @override
  void initState() {
    super.initState();
    // selectedNotifier = ValueNotifier<MODEL?>(widget.controller.data);
    if (widget.dataSource == DataSource.remote) {
      bloc = ApiDataBloc<MODEL>()
        ..add(ApiIndexData(
            queryParams:
                ApiInfo(endpoint: widget.endPoint, queries: widget.apiQuery),
            listWithoutPagination: true));
    }

    // if (widget.controller.data != null) {
    //   widget.selectedItem?.call(widget.controller.data as MODEL);
    // }
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
              vertical: context.sizeSide.smallSide * 0.01),
          constraints: const BoxConstraints(),
        ),
        context: context,
      ),
      child: Padding(
        padding: widget.marginItem ?? EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.decorationField?.hintText != null)
              TextWidget(
                text: widget.decorationField?.hintText ?? '',
                style: widget.decorationField?.hintStyle ??
                    context.bodyL?.copyWith(color: AppColors.baseColor),
              ),
            (context.sizeSide.smallSide * .02).ph,
            BlocBuilder<ApiDataBloc<MODEL>, ApiDataState<MODEL>>(
              bloc: bloc,
              builder: (context, state) {
                return state.maybeMap(
                  successList: (value) {
                    List<MODEL> dataList = value.data ?? [];
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
                    return Column(
                      children: List.generate(
                          dataList.length,
                          (index) => ListenableBuilder(
                                listenable: widget.controller,
                                builder: (context, _) {
                                  return Row(
                                    children: [
                                      Radio<MODEL>.adaptive(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          fillColor: WidgetStatePropertyAll(
                                              context.scheme.secondary),
                                          value: dataList[index],
                                          groupValue: widget.controller.data,
                                          onChanged: (value) {
                                            if (value != null) {
                                              widget.controller.add(value);
                                              if (widget.onSelect != null) {
                                                widget.onSelect!.call(value);
                                              }
                                            }
                                          }),
                                      TickerWidget(
                                        child: TextWidget(
                                          padding: EdgeInsets.zero,
                                          text: widget.showText
                                                  ?.call(value.data![index]) ??
                                              '',
                                          style: decorationField.style ??
                                              context.bodyM!.copyWith(
                                                  color: AppColors
                                                      .reverseBaseColor),
                                          maxLine: 1,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              )),
                    );
                  },
                  loading: (value) => const AppIndicator(),
                  error: (value) => CustomErrorWidget(
                    message: value.error?.message ?? '',
                    textColor: AppColors.warningColor,
                    onTab: () => bloc!.refresh(),
                    showImage: false,
                    btnTitle: context.localText.button_retry_title,
                  ),
                  orElse: () => const Center(child: AppIndicator()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
