import 'package:flutter/material.dart';
import 'package:flutter_scaffold/core/enums/view_state.dart';
import 'package:flutter_scaffold/core/get_it.dart';
import 'package:flutter_scaffold/core/services/api/exceptions.dart';
import 'package:logger/logger.dart';

export 'package:flutter_scaffold/core/enums/view_state.dart';

class BaseModel extends ChangeNotifier {
  var _log = getIt<Logger>();
  ViewState _state;

  bool _isDisposed = false;

  ViewState get state => _state;

  String _errorMessage;

  void setState(ViewState newState) {
    _state = newState;

    // Notify listeners will only update listeners of state.
    notifyListeners();
  }

  bool get isBusy => state == ViewState.Busy;

  String get errorMessage => _errorMessage;

  bool get hasError => state == ViewState.Error;

  bool get isSuccess => state == ViewState.Success;

  @override
  void notifyListeners() {
    if (_isDisposed) return;
    super.notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  /// 错误处理
  Future<T> tryRun<T>(Future<T> Function() run) async {
    try {
      setState(ViewState.Busy);
      T result = await run();
      setState(ViewState.Success);
      return result;
    } on FriendlyHttpException catch (e) {
      _log.e(e.readme(), e.message, e.stackTrace);
      setState(ViewState.Error);
      _errorMessage = e.readme();
    } on Error catch (e) {
      _log.w(e.toString(), null, e.stackTrace);
      setState(ViewState.Error);
      _errorMessage = e.toString();
    } catch (e) {
      _log.w(e.message);
      setState(ViewState.Error);
      _errorMessage = e.message;
    }
    return null;
  }
}
