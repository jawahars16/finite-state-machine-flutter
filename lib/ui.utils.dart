import 'package:flutter/material.dart';

class TextStyles {
  static displayLarge() {
    return TextStyle(fontSize: 75);
  }
}

class ActionButton extends FlatButton {
  ActionButton(text, action) : super(child: Text(text), onPressed: action);
}

class ShadowContainer extends Container {
  ShadowContainer(child)
      : super(
            child: child,
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow
                    offset: Offset(
                      1.0, // horizontal, move right 10
                      1.0, // vertical, move down 10
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(5)));
}
