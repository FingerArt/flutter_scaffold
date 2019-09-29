import 'package:flutter/material.dart';
import 'package:flutter_scaffold/core/enums/view_state.dart';
export 'package:flutter_scaffold/core/enums/view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state;

  bool _isDisposed = false;

  ViewState get state => _state;

  void setState(ViewState newState) {
    _state = newState;

    if (_isDisposed) return;
    // Notify listeners will only update listeners of state.
    notifyListeners();
  }

  bool get isBusy => state == ViewState.Busy;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
