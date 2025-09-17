// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';

// Project imports:
import '../_field_helper/decoration_field.dart';
import '../_field_helper/form_field_dynamic_state_interface.dart';
import 'assistance/select_field_widget.dart';

enum DataSource {
  local,
  remote;
}

class SelectionFormField<MODEL, R> extends FormBuilderFieldDecoration<R> {
  // final Widget Function(MODEL model, bool isSelected) itemBuilder;
  final Function(MODEL selectedModel)? onSelect;
  final Function(String?, FormFieldDynamicStateController<MODEL>)? filterData;
  final MODEL? initValue;
  final ValueNotifier<MODEL?>? changeValue;
  final String endPoint;
  final Map<String, dynamic>? apiQuery;
  final R Function(MODEL) converter;
  final DataSource? dataSource;
  final List<MODEL>? localData;
  final EdgeInsetsGeometry? margin;
  final DecorationField? decorationField;
  final ScrollPhysics? physics;
  final String Function(MODEL)? showText;
  final bool Function(MODEL? selected, MODEL ofIndex, List<MODEL> items)
      compareItem;
  final int Function(List<MODEL> items)? initialSelect;

  final Widget Function(BuildContext context, MODEL item, String showText,
      bool isSelected, Function() onTap, MODEL? selectedItem) itemBuilder;

  /// if Axis is [Axis.horizontal]  secondHeight '''*required'''
  final Axis scrollDirection;
  final double? secondHeight;
  final double? mainHeight;
  final bool Function(MODEL item)? filterListWithGettingListFromZero;
  final Widget? noItemWidget;
  SelectionFormField({
    required this.scrollDirection,
    this.secondHeight,
    this.noItemWidget,
    this.physics,
    this.filterListWithGettingListFromZero,
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
    // required this.itemBuilder,
    required this.endPoint,
    this.onSelect,
    required this.converter,
    this.filterData,
    this.initValue,
    this.localData,
    this.dataSource = DataSource.remote,
    this.margin,
    this.decorationField,
    required this.mainHeight,
    required this.compareItem,
    this.showText,
    this.apiQuery,
    this.initialSelect,
    this.changeValue,
    required this.itemBuilder,
  }) : super(
          initialValue: initValue != null ? converter.call(initValue) : null,
        );

  static Widget _fieldBuilder(field) {
    final state = field as SelectionFormFieldState;
    return state.buildFormField();
  }

  @override
  // ignore: no_logic_in_create_state
  SelectionFormFieldState<MODEL, R> createState() =>
      SelectionFormFieldState<MODEL, R>(
          converter: converter, startValue: initValue);
}

class SelectionFormFieldState<MODEL, R> extends FormFiledDynamicStateInterface<
    SelectionFormField<MODEL, R>, MODEL, R> {
  SelectionFormFieldState(
      {required R Function(MODEL value) super.converter,
      required super.startValue});

  @override
  void initState() {
    super.initState();
    if (widget.changeValue != null) {
      widget.changeValue!.addListener(() {
        actionListener();
      });
    }
  }

  void actionListener() {
    if (widget.changeValue!.value != null &&
        controller.data != widget.changeValue!.value) {
      controller.add(widget.changeValue!.value as MODEL);
    }
  }

  @override
  void dispose() {
    if (widget.changeValue != null) {
      widget.changeValue!.removeListener(() {
        actionListener();
      });
    }
    super.dispose();
  }

  @override
  void reset() {
    dispose();
    initState();
    super.reset();
  }

  @override
  Widget buildFormField() {
    return SelectFieldFieldWidget<MODEL>(
      controller: controller,
      onSelect: widget.onSelect,
      enabled: widget.enabled,
      noItemWidget: widget.noItemWidget,
      filterListWithGettingListFromZero:
          widget.filterListWithGettingListFromZero,
      endPoint: widget.endPoint,
      physics: widget.physics,
      dataSource: widget.dataSource!,
      localData: widget.localData,
      filterData: widget.filterData,
      decoration: decoration,
      decorationField: widget.decorationField,
      marginItem: widget.margin,
      mainHeight: widget.mainHeight,
      secondHeight: widget.secondHeight,
      compareItem: widget.compareItem,
      showText: widget.showText,
      apiQuery: widget.apiQuery,
      initialSelect: widget.initialSelect,
      itemBuilder: widget.itemBuilder,
      scrollDirection: widget.scrollDirection,
    );
  }
}
