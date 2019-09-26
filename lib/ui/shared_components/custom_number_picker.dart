import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

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
      child: Theme(
        data: ThemeData(
          textTheme: TextTheme(
            body1: Theme.of(context).textTheme.body1.copyWith(fontSize: 14.0),
            headline:
                Theme.of(context).textTheme.headline.copyWith(fontSize: 16.0),
          ),
        ),
        child: NumberPicker.integer(
          initialValue: _currentValue,
          minValue: widget.min,
          maxValue: widget.max,
          onChanged: (newValue) {
            widget.onChange(newValue);
            setState(() => _currentValue = newValue);
          },
        ),
      ),
    );
  }
}
