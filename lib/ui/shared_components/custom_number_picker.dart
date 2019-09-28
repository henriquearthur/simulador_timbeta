import 'package:flutter/material.dart';

class CustomNumberPicker extends StatefulWidget {
  final int min;
  final int max;
  final Function onChange;

  const CustomNumberPicker(
      {Key key, this.min = 0, this.max = 10, this.onChange})
      : super(key: key);
  @override
  _CustomNumberPickerState createState() => _CustomNumberPickerState();
}

class _CustomNumberPickerState extends State<CustomNumberPicker> {
  int _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            iconSize: 16,
            icon: Icon(
              Icons.remove,
            ),
            onPressed: () {
              if (_currentValue > widget.min) setState(() => _currentValue--);
              widget.onChange(_currentValue);
            },
          ),
          Text(
            "$_currentValue",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: _currentValue > 0
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
            ),
          ),
          IconButton(
            iconSize: 16,
            icon: Icon(
              Icons.add,
            ),
            onPressed: () {
              if (_currentValue < widget.max) setState(() => _currentValue++);
              widget.onChange(_currentValue);
            },
          ),
        ],
      ),
    );
  }
}
