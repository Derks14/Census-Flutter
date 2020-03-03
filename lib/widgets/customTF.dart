import 'package:flutter/material.dart';

class CustomTF extends StatelessWidget{
  final String _label;
  final Icon _icon;

  CustomTF(this._icon, this._label);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 40.0,
      width: double.infinity,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: _icon,
            hintText: _label,
            hintStyle: TextStyle(
                fontSize: 25.0
            )
        ),

      ),
    );
  }

}