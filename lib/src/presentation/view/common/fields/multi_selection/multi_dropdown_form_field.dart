// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';

// Project imports:
import '../../../../../core/utils/extension.dart';
import '../_field_helper/decoration_field.dart';
import '../_field_helper/form_field_dynamic_list_state_interface.dart';
import 'assistance/multi_dropdown_field_widget_simple.dart';
import 'multi_select_form_field.dart';

class MultiDropdownFormField<MODEL, R>
    extends FormBuilderFieldDecoration<List<R>> {
  final Widget Function(MODEL model) itemBuilder;
  final String Function(MODEL model) itemLabelExtractor;
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
  final double? dropdownHeight;
  final Map<String, dynamic>? queries;
  final Widget? gap;
  final int? maxSelections;
  final bool searchEnabled;
  final String? searchHintText;
  final bool Function(MODEL model1, MODEL model2)? compareItem;

  MultiDropdownFormField({
    super.key,
required this.compareItem,
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
    required this.itemLabelExtractor,
    required this.endPoint,
    required this.converter,
    this.initValue,
    this.localData,
    this.dropdownHeight,
    this.queries,
    this.dataSource = DataSource.remote,
    this.margin,
    this.decorationField,
    this.selectItem,
    this.arrowColor,
    this.headerPadding,
    this.itemHeight,
    this.gap,
    this.maxSelections,
    this.searchEnabled = false,
    this.searchHintText,
  }) : super(
          initialValue: initValue.isNotNull
              ? initValue!.fold(
                  [],
                  (previousValue, element) =>
                      previousValue?..add(converter.call(element)))
              : null,
        );

  static Widget _fieldBuilder(field) {
    final state = field as MultiDropdownFormFieldState;
    return state.buildFormField();
  }

  @override
  // ignore: no_logic_in_create_state
  MultiDropdownFormFieldState<MODEL, R> createState() =>
      MultiDropdownFormFieldState<MODEL, R>(
          converter: converter, startValue: initValue);
}

class MultiDropdownFormFieldState<MODEL, R>
    extends FormFiledDynamicListStateInterface<MultiDropdownFormField<MODEL, R>,
        MODEL, R> {
  MultiDropdownFormFieldState(
      {required super.converter, required super.startValue});

  @override
  Widget buildFormField() {
    return SimpleMultiDropdownFieldWidget(
      decoration: decoration,
      decorationField: widget.decorationField,
      controller: controller,
      compareItem: widget.compareItem,
      endPoint: widget.endPoint,
      itemBuilder: widget.itemBuilder,
      itemLabelExtractor: widget.itemLabelExtractor,
      initValue: startValue,
      dataSource: widget.dataSource,
      localData: widget.localData,
      margin: widget.margin,
      enabled: widget.enabled,
      selectItem: widget.selectItem,
      queries: widget.queries,
      maxSelections: widget.maxSelections,
      searchEnabled: widget.searchEnabled,
      searchHintText: widget.searchHintText,
      dropdownHeight: widget.dropdownHeight,
    );
  }
}
