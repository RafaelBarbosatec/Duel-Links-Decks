import 'package:flutter/material.dart';

class TopDecksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: Text("TopDecksPage",style: TextStyle(color: Colors.white),)
        ),
      ),
    );
  }
}
