import 'package:flutter_scaffold/core/scoped_models/base_model.dart';

abstract class BaseListModel<T> extends BaseModel {
  List<T> _data = [];

  List<T> get data => _data;

  /// 获取数据
  Future<bool> getData() async {
    try {
      setState(ViewState.Busy);
      var result = await loadDate();
      if (result.isEmpty) {
        setState(ViewState.NoDataAvailable);
      } else {
        _data.clear();
        _data.addAll(result);
        setState(ViewState.DataFetched);
      }
    } catch (e) {
      catchError(e);
    }
    return isSuccess;
  }

  Future<List<T>> loadDate();
}
