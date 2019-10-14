import 'package:json_annotation/json_annotation.dart';

/// 分页基类
abstract class Pager<T> {
  @JsonKey(name: "pageNum", defaultValue: 0)
  int pageNum;
  @JsonKey(name: "pageSize", defaultValue: 0)
  int pageSize;
  @JsonKey(name: "total", defaultValue: 0)
  int total;
  @JsonKey(name: "pages", defaultValue: 0)
  int pages;

  Pager(this.pageNum, this.pageSize, this.total, this.pages);

  bool get hasNextPage => pageNum < pages;

  List<T> result();

  @override
  String toString() {
    return 'Pager{pageNum: $pageNum, pageSize: $pageSize, total: $total, pages: $pages}';
  }
}