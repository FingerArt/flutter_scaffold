import 'package:flutter/material.dart';

/// 简单的刷新指示器
///
/// 首次调用 [onRefresh]
class SimpleRefreshIndicator extends StatefulWidget {
  final bool initRefresh;
  final Widget child;
  final double displacement;
  final RefreshCallback onRefresh;
  final Color color;
  final Color backgroundColor;
  final ScrollNotificationPredicate notificationPredicate;
  final String semanticsLabel;
  final String semanticsValue;

  SimpleRefreshIndicator({
    Key key,
    @required this.child,
    this.displacement = 40.0,
    @required this.onRefresh,
    this.initRefresh = true,
    this.color,
    this.backgroundColor,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.semanticsLabel,
    this.semanticsValue,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => SimpleRefreshIndicatorState();
}

class SimpleRefreshIndicatorState extends State<SimpleRefreshIndicator> {
  GlobalKey<RefreshIndicatorState> _keyRefresh = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((d) => _init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _keyRefresh,
      child: widget.child,
      onRefresh: widget.onRefresh,
      displacement: widget.displacement,
      color: widget.color,
      backgroundColor: widget.backgroundColor,
      notificationPredicate: widget.notificationPredicate,
      semanticsLabel: widget.semanticsLabel,
      semanticsValue: widget.semanticsValue,
    );
  }

  _init() {
    if (widget.initRefresh && widget.onRefresh != null) {
      _keyRefresh.currentState.show();
    }
  }
}
