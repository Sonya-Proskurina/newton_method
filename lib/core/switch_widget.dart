import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SwitchWidget extends StatefulWidget {
  bool value;
  void Function(bool) toggle;
  SwitchWidget({Key? key, required this.value, required this.toggle}) : super(key: key);
  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      height: 24.0,
      width: 44.0,
      padding: 4.0,
      toggleSize: 20.0,
      borderRadius: 999,
      activeColor: Theme.of(context).primaryColor,
      value: widget.value,
      onToggle: widget.toggle,
    );
  }
}
