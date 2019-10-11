import 'dart:io';

import 'package:dio/dio.dart';

/// 更友好的Http异常
class FriendlyHttpException extends DioError {
  String message;

  FriendlyHttpException({
    request,
    response,
    this.message,
    type = DioErrorType.DEFAULT,
    error,
    stackTrace,
  }) : super(request: request, response: response, message: message, type: type, error: error, stackTrace: stackTrace);

  FriendlyHttpException.wrap(Exception exception)
      : super(
          request: exception is DioError ? exception.request : null,
          response: exception is DioError ? exception.response : null,
          message: exception is DioError ? exception.message : null,
          type: exception is DioError ? exception.type : null,
          error: exception is DioError ? exception.error : exception,
          stackTrace: exception is DioError ? exception.stackTrace : StackTrace.fromString(exception.toString()),
        );

  String readme({String defaultMessage, String assistMessage}) {
    switch (type) {
      case DioErrorType.CONNECT_TIMEOUT:
        return defaultMessage ?? (assistMessage == null ? "连接服务器超时" : "$assistMessage，连接超时");
      case DioErrorType.SEND_TIMEOUT:
        return defaultMessage ?? (assistMessage == null ? "发送数据到服务器超时" : "$assistMessage，发送数据超时");
      case DioErrorType.RECEIVE_TIMEOUT:
        return defaultMessage ?? (assistMessage == null ? "接收服务器数据超时" : "$assistMessage，接收数据超时");
      case DioErrorType.RESPONSE:
        return defaultMessage ?? _parseError();
      case DioErrorType.CANCEL:
        return defaultMessage ?? "已取消请求";
      default:
        var defaultMsg = "服务器繁忙，请稍后再试[1000]";
        if (error is SocketException) {
          defaultMsg = "无法连接到服务器";
        }
        defaultMsg = (defaultMessage ?? this.message ?? defaultMsg) + "${response?.statusCode}";
        return assistMessage == null ? defaultMsg : "$assistMessage，$defaultMsg";
    }
  }

  /// 解析获取错误信息
  String _parseError() {
    const ds = "服务器繁忙，请稍后再试[1001]";
//    try {
//      return ModelContainer.fromJson(response?.data)?.msg ?? ds;
//    } on Exception {} on Error {}
    return ds;
  }
}
