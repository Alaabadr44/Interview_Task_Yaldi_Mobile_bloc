// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';

// Project imports:
import '../../../../../core/utils/extension.dart';
import '../_field_helper/decoration_field.dart';
import '../_field_helper/form_field_dynamic_list_state_interface.dart';
import 'assistance/multi_select_field_widget.dart';

enum DataSource {
  local,
  remote;
}

class MultiSelectFormField<MODEL, R> extends FormBuilderFieldDecoration<List<R>> {
  final Widget Function(MODEL model) itemBuilder;
  final Function(MODEL selectItem)? selectItem;
  final List<MODEL>? initValue;
  final String endPoint;
  final R Function(MODEL model) converter;
  final DataSource? dataSource;
  final List<MODEL>? localData;
  final EdgeInsetsGeometry? margin;
  final DecorationField? decorationField;

  final Color? arrowColor;
  final EdgeInsetsGeometry? headerPadding;
  final double? itemHeight;
  final double? expectedHeight;
  final Map<String, dynamic>? queries;
  final Widget? gap;
  final bool isExpanded;
  
  MultiSelectFormField({
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
    required this.converter,
    this.initValue,
    this.localData,
    this.expectedHeight,
    this.queries,
    this.dataSource = DataSource.remote,
    this.margin,
    this.decorationField,
    this.selectItem,
    this.arrowColor,
    this.headerPadding,
    this.itemHeight,
    this.gap,
    this.isExpanded = false,
  }) : super(
          initialValue: initValue.isNotNull
              ? initValue!.fold([], (previousValue, element) => previousValue?..add(converter.call(element)))
              : null,
        );

  static Widget _fieldBuilder(field) {
    final state = field as MultiSelectFormFieldState;
    return state.buildFormField();
  }

  @override
  // ignore: no_logic_in_create_state
  MultiSelectFormFieldState<MODEL, R> createState() =>
      MultiSelectFormFieldState<MODEL, R>(converter: converter, startValue: initValue);
}

class MultiSelectFormFieldState<MODEL, R>
    extends FormFiledDynamicListStateInterface<MultiSelectFormField<MODEL, R>, MODEL, R> {
  MultiSelectFormFieldState({required super.converter, required super.startValue});

  @override
  Widget buildFormField() {
    return MultiSelectFieldWidget(
      decoration: decoration,
      decorationField: widget.decorationField,
      controller: controller,
      endPoint: widget.endPoint,
      itemBuilder: widget.itemBuilder,
      initValue: startValue,
      dataSource: widget.dataSource,
      localData: widget.localData,
      margin: widget.margin,
      enabled: widget.enabled,
      selectItem: widget.selectItem,
      arrowColor: widget.arrowColor,
      headerPadding: widget.headerPadding,
      queries: widget.queries,
      gap: widget.gap,
      itemHeight: widget.itemHeight,
      isExpanded: widget.isExpanded,
      expectedHeight: widget.expectedHeight,
    );
  }
}
