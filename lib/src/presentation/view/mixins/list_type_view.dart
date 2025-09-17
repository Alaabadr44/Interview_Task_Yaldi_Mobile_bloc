import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/src/presentation/view/common/assistance_pagination.dart'
    show ListType;

mixin ListTypeView {
  late ValueNotifier<ListType> listTypeNotifier;

  onInitListTypeView() {
    listTypeNotifier = ValueNotifier<ListType>(ListType.list);
  }

  toggleView() {
    if (listTypeNotifier.value == ListType.grid) {
      listTypeNotifier.value = ListType.list;
    } else {
      listTypeNotifier.value = ListType.grid;
    }
  }

  onDisposeListTypeView() {
    listTypeNotifier.dispose();
  }
}
