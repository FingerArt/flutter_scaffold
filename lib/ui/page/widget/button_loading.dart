import 'package:flutter/material.dart';
import 'package:flutter_scaffold/ui/page/widget/button_progress_indicator.dart';

class ButtonLoading extends StatefulWidget {
  final bool isLoading;
  final String label;
  final Function onTap;

  const ButtonLoading(this.label, {Key key, this.isLoading = false, this.onTap}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ButtonLoadingState();
}

class _ButtonLoadingState extends State<ButtonLoading> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.all(Radius.circular(2)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).accentColor),
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Offstage(
              offstage: !widget.isLoading,
              child: ButtonProgressIndicator(color: Theme.of(context).accentColor),
            ),
            Text(widget.label),
          ],
        ),
      ),
    );
  }
}
