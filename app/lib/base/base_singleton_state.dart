import 'package:flutter/material.dart';

abstract class BaseSingletonState {
  void dispose() {}
}

abstract class CacheManagerSingleton<T> {
  List<T>? get dataList;

  void setDataList(List<T>? list);

  void _disposeDataList() {
    setDataList(null);
  }

  @protected
  bool get callDispose => true;

  /// You can add your own logic here, but note that this will internally
  /// dispose the data list
  void disposeSingleton() {
    if (callDispose == true) {
      _disposeDataList();
    }
  }
}
