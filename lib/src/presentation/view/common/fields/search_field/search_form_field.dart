// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';

// Project imports:
import '../_field_helper/decoration_field.dart';
import '../_field_helper/form_field_dynamic_state_interface.dart';
import 'assistance/search_field_widget.dart';

enum DataSource {
  local,
  remote;
}

class SearchFormField<MODEL, R> extends FormBuilderFieldDecoration<R> {
  final Widget Function(MODEL model) itemBuilder;
  final String Function(MODEL selectedModel) selectedItem;
  final Function(String?, FormFieldDynamicStateController<MODEL>)? filterData;
  final MODEL? initValue;
  final String endPoint;
  final R Function(MODEL) converter;
  final DataSource? dataSource;
  final List<MODEL>? localData;
  final EdgeInsetsGeometry? margin;
  final double? gapBetween;
  final DecorationField? decorationField;
  final Color? overlayColor;
  final bool Function(MODEL item, dynamic initSelectionValue)? initialSelectBy;
  final dynamic initSelectionValue;

  SearchFormField({
    super.key,
    required super.name,
    super.builder = _fieldBuilder,
    super.validator,
    super.autovalidateMode = AutovalidateMode.onUserInteraction,
    super.onChanged,
    super.onReset,
    super.onSaved,
    super.enabled = true,
    super.focusNode,
    super.valueTransformer,
    required this.itemBuilder,
    required this.endPoint,
    required this.selectedItem,
    required this.converter,
    this.filterData,
    this.initValue,
    this.localData,
    this.dataSource = DataSource.remote,
    this.margin,
    this.gapBetween,
    this.decorationField,
    this.overlayColor,
    this.initialSelectBy,
    this.initSelectionValue,
  }) : super(
          initialValue: initValue != null ? converter.call(initValue) : null,
        );

  static Widget _fieldBuilder(field) {
    final state = field as SearchFormFieldState;
    return state.buildFormField();
  }

  @override
  // ignore: no_logic_in_create_state
  SearchFormFieldState<MODEL, R> createState() =>
      SearchFormFieldState<MODEL, R>(
          converter: converter, startValue: initValue);
}

class SearchFormFieldState<MODEL, R> extends FormFiledDynamicStateInterface<
    SearchFormField<MODEL, R>, MODEL, R> {
  SearchFormFieldState(
      {required R Function(MODEL value) converter, required MODEL? startValue})
      : super(converter: converter, startValue: startValue);

  @override
  Widget buildFormField() {
    return SearchFieldFieldWidget<MODEL>(
      controller: controller,
      itemBuilder: widget.itemBuilder,
      selectedItem: widget.selectedItem,
      enabled: widget.enabled,
      onTapItem: controller.add,
      endPoint: widget.endPoint,
      dataSource: widget.dataSource!,
      localData: widget.localData,
      filterData: widget.filterData,
      decoration: decoration,
      decorationField: widget.decorationField,
      marginItem: widget.margin,
      gapBetween: widget.gapBetween,
      overlayColor: widget.overlayColor,
      name: widget.name,
      initialSelectBy: widget.initialSelectBy,
      initSelectionValue: widget.initSelectionValue,
    );
  }
}
