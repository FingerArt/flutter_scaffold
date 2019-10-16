import 'package:flutter/material.dart';
import 'package:flutter_scaffold/core/get_it.dart';
import 'package:flutter_scaffold/core/scoped_models/base_model.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;
  final Widget child;

  BaseView({this.builder, this.onModelReady, this.child});

  @override
  State<StatefulWidget> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T _model = getIt<T>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.onModelReady != null) {
        widget.onModelReady(_model);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => _model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}

class BaseView2<F extends BaseModel, S extends BaseModel> extends StatefulWidget {
  final Widget child;
  final Widget Function(BuildContext context, F value1, S value2, Widget child) builder;

  BaseView2({this.child, this.builder});

  @override
  State<StatefulWidget> createState() => _BaseView2State<F, S>();
}

class _BaseView2State<F extends BaseModel, S extends BaseModel> extends State<BaseView2<F, S>> {
  F _first = getIt<F>();
  S _second = getIt<S>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider(builder: (context) => _first),
        ChangeNotifierProvider(builder: (context) => _second)
      ],
      child: Consumer2<F, S>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
