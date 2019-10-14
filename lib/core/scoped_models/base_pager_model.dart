import 'package:flutter_scaffold/core/models/common.dart';
import 'package:flutter_scaffold/core/scoped_models/base_model.dart';

abstract class BasePagerModel<T> extends BaseModel {
  int _currentPageNumber = -1;
  bool _hasNextPage = true;

  /// 当前页数
  int get currentPageNumber => _currentPageNumber < 0 ? 0 : _currentPageNumber;

  /// 是否还有下一页
  bool get hasNextPage => _hasNextPage;

  List<T> _data = [];

  List<T> get data => _data;

  /// 刷新，加载第一页数据
  Future<bool> refresh() async {
    try {
      setState(ViewState.Busy);
      _currentPageNumber = 0;
      var pager = await loadDate(_currentPageNumber);
      if (pager.result().isEmpty) {
        setState(ViewState.NoDataAvailable);
      } else {
        _hasNextPage = pager.hasNextPage;
        _data.clear();
        _data.addAll(pager.result());
        setState(ViewState.DataFetched);
      }
    } catch (e) {
      catchError(e);
    }
    return isSuccess;
  }

  /// 加载下一页数据
  Future<bool> loadMore() async {
    try {
      setState(ViewState.Busy);
      var pager = await loadDate(_currentPageNumber + 1);
      if (pager.result().isEmpty) {
        setState(ViewState.NoDataAvailable);
      } else {
        _currentPageNumber++;
        _hasNextPage = pager.hasNextPage;
        _data.addAll(pager.result());
        setState(ViewState.DataFetched);
      }
    } catch (e) {
      catchError(e);
    }
    return isSuccess;
  }

  Future<Pager<T>> loadDate(int pageNumber);
}
