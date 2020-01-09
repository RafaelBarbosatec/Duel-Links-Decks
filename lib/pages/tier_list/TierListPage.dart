import 'package:flutter/material.dart';

class TierListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(10.0)
          ),
          padding: EdgeInsets.all(30.0),
            child: Text("TierListPage")
        ),
      ),
    );
  }
}
