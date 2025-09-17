import 'package:flutter/material.dart';

mixin CheckList<T> {
  late ValueNotifier<List<T>> markList;

  onInitCheckList() {
    markList = ValueNotifier(<T>[]);
  }

  onDisposeCheckList() {
    markList.dispose();
  }

  addToList(T item, {bool Function(T item)? compareItem}) {
    var newList = markList.value;

    if (compareItem != null) {
      if (!newList.any(compareItem)) {
        newList.add(item);
      }
    } else {
      newList.add(item);
    }
    markList.value = List.from(newList);
  }

  removeFromList(T item, {bool Function(T item)? compareItem}) {
    var newList = markList.value;

    if (compareItem != null) {
      if (newList.any(compareItem)) {
        newList.removeWhere(compareItem);
      }
    } else {
      newList.remove(item);
    }
    markList.value = List.from(newList);
  }

  toggleCheck(bool? checkState, T item, {bool Function(T item)? compareItem}) {
    if (checkState != null) {
      if (checkState) {
        addToList(item, compareItem: compareItem);
      } else {
        removeFromList(item, compareItem: compareItem);
      }
    }
  }

  bool isSelected(T item, {bool Function(T item)? compareItem}) {
    if (compareItem != null) {
      return markList.value.any(compareItem);
    } else {
      return markList.value.contains(item);
    }
  }

  clearList() {
    markList.value = List.from([]);
  }
}
