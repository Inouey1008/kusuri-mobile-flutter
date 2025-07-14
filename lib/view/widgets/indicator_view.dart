import 'package:flutter/material.dart';

class IndicatorView extends StatelessWidget {
  const IndicatorView({
    Key? key,
    this.loading = false,
  }) : super(key: key);

  final bool loading;
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: loading,
      child: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
