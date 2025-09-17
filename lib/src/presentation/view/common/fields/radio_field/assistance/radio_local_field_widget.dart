// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../text_widget.dart';
import '../../../ticker_widget.dart';
import '../../_field_helper/decoration_field.dart';
import '../../_field_helper/form_field_border.dart';
import '../../_field_helper/form_field_dynamic_state_interface.dart';

class RadioLocalFieldWidget<MODEL> extends StatefulWidget {
  final String Function(MODEL)? showText;
  final bool Function(MODEL? selected, MODEL ofIndex, List<MODEL> items)
      compareItem;
  final FormFieldDynamicStateController<MODEL> controller;
  final Function(MODEL)? onSelect;
  final Function(String?, FormFieldDynamicStateController<MODEL>)? filterData;
  final bool? enabled;
  // final DataSource dataSource;
  final List<MODEL>? localData;
  final InputDecoration decoration;
  final DecorationField? decorationField;
  final EdgeInsetsGeometry? marginItem;
  final double height;
  final int Function(List<MODEL> items)? initialSelect;
  final ValueNotifier<MODEL?>? changeValue;

  const RadioLocalFieldWidget({
    super.key,
    required this.compareItem,
    this.showText,
    required this.controller,
    required this.decoration,
    this.onSelect,
    this.localData,
    this.enabled = true,
    this.filterData,
    this.decorationField,
    this.marginItem,
    required this.height,
    this.initialSelect,
    this.changeValue,
  });

  @override
  State<RadioLocalFieldWidget<MODEL>> createState() =>
      _RadioFieldWidgetState<MODEL>();
}

class _RadioFieldWidgetState<MODEL>
    extends State<RadioLocalFieldWidget<MODEL>> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
              vertical: context.sizeSide.smallSide * 0.005),
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
            Column(
              children: List.generate(
                  widget.localData!.length,
                  (index) => ListenableBuilder(
                        listenable: widget.controller,
                        builder: (context, _) {
                          return InkWell(
                            onTap: () {
                              final value = widget.localData![index];
                              if (value != null) {
                                widget.controller.add(value);
                                if (widget.onSelect != null) {
                                  widget.onSelect!.call(value);
                                }
                              }
                            },
                            child: Row(
                              children: [
                                Radio<MODEL>.adaptive(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    fillColor: WidgetStatePropertyAll(
                                        context.scheme.secondary),
                                    value: widget.localData![index],
                                    groupValue: widget.controller.data,
                                    onChanged: (value) {
                                      if (value != null) {
                                        widget.controller.add(value);
                                        if (widget.onSelect != null) {
                                          widget.onSelect!.call(value);
                                        }
                                      }
                                    }),
                                Flexible(
                                  child: TickerWidget(
                                    child: TextWidget(
                                      padding: EdgeInsets.zero,
                                      text: widget.showText?.call(
                                              widget.localData![index]) ??
                                          '',
                                      style: decorationField.style ??
                                          context.bodyM!.copyWith(
                                              color:
                                                  AppColors.reverseBaseColor),
                                      maxLine: 1,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )),
            )
          ],
        ),
      ),
    );
  }
}
