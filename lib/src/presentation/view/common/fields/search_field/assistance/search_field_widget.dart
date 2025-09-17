// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';

// Project imports:
import '../../../../../../core/utils/extension.dart';
import '../../../../../view_model/blocs/data_bloc/api_data_bloc.dart';
import '../../_field_helper/decoration_field.dart';
import '../../_field_helper/form_field_border.dart';
import '../../_field_helper/form_field_dynamic_state_interface.dart';
import '../search_form_field.dart';
import 'overlay_field_widget.dart';

// ignore: must_be_immutable
class SearchFieldFieldWidget<MODEL> extends StatefulWidget {
  final String endPoint;
  final String name;
  final Widget Function(MODEL) itemBuilder;
  final FormFieldDynamicStateController<MODEL> controller;
  final String Function(MODEL)? selectedItem;
  final Function(MODEL selectedModel) onTapItem;
  final Function(String?, FormFieldDynamicStateController<MODEL>)? filterData;
  final bool? enabled;
  final DataSource dataSource;
  final List<MODEL>? localData;
  final InputDecoration decoration;
  final DecorationField? decorationField;
  final EdgeInsetsGeometry? marginItem;
  final double? gapBetween;
  final Color? overlayColor;
  final bool Function(MODEL item, dynamic initSelectionValue)? initialSelectBy;
  final dynamic initSelectionValue;
  final MODEL? initValue;
  const SearchFieldFieldWidget({
    super.key,
    required this.itemBuilder,
    required this.name,
    required this.controller,
    required this.decoration,
    this.selectedItem,
    this.localData,
    this.enabled = true,
    this.initValue,
    required this.onTapItem,
    required this.endPoint,
    required this.dataSource,
    this.filterData,
    this.decorationField,
    this.marginItem,
    this.gapBetween,
    this.overlayColor,
    this.initialSelectBy,
    this.initSelectionValue,
  });

  @override
  State<SearchFieldFieldWidget<MODEL>> createState() =>
      _SearchFieldFieldWidgetState<MODEL>();
}

class _SearchFieldFieldWidgetState<MODEL>
    extends State<SearchFieldFieldWidget<MODEL>> {
  ApiDataBloc<MODEL>? bloc;
  late final CustomPopupMenuController popupController;
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    popupController = CustomPopupMenuController();
    textController = TextEditingController();
    if (widget.dataSource == DataSource.remote) {
      bloc = ApiDataBloc<MODEL>();
    }

    if (widget.controller.data != null) {
      textController.text =
          widget.selectedItem?.call(widget.controller.data as MODEL) ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    DecorationField decorationField =
        widget.decorationField ?? DecorationField();
    return Padding(
      padding: widget.marginItem ?? EdgeInsets.zero,
      child: InputDecorator(
        decoration: FormFieldBorders.border(
          decoration: widget.decoration,
          enabled: widget.enabled,
          decorationField: decorationField.copyWith(
            labelLock: FloatingLabelBehavior.never,
            contentPadding: decorationField.contentPadding ??
                EdgeInsetsDirectional.symmetric(
                    vertical: context.sizeSide.smallSide * 0.01),
            constraints: decorationField.constraints ?? const BoxConstraints(),
          ),
          context: context,
        ),
        child: OverlayFieldWidget<MODEL>(
          popupController: popupController,
          dataSource: widget.dataSource,
          localData: widget.localData,
          textController: textController,
          controller: widget.controller,
          itemBuilder: widget.itemBuilder,
          onTapItem: widget.onTapItem,
          selectedItem: widget.selectedItem,
          bloc: bloc,

          endPoint: widget.endPoint,
          gapBetween: widget.gapBetween,
          decorationField: widget.decorationField,
          // overlayColor: widget.overlayColor,
          enabled: widget.enabled ?? true,
          enableTextField: false,
          name: widget.name,
          initialSelectBy: widget.initialSelectBy,
          initSelectionValue: widget.initSelectionValue,
        ),
      ),
    );
  }
}
