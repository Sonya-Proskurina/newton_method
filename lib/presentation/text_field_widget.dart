import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextEditingController textEditingController;
  String hintText;
  bool expanded = false;
  bool? darkColor;
  bool? isNumber = false;
  bool? isEmail = false;

  TextFieldWidget(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      this.isEmail,
      this.isNumber,
      required this.expanded,
      bool? dark})
      : super(key: key) {
    darkColor = dark;
  }

  @override
  Widget build(BuildContext context) {
    isNumber = (isNumber == null) ? false : isNumber;
    isEmail = (isEmail == null) ? false : isEmail;
    return TextFormField(
      keyboardType: (isNumber!)
          ? TextInputType.number
          : (isEmail!)
              ? TextInputType.emailAddress
              : TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      textAlignVertical: TextAlignVertical.top,
      expands: expanded,
      minLines: null,
      maxLines: (expanded) ? null : 1,
      maxLength: (expanded) ? null : 50,
      controller: textEditingController,
      style: Theme.of(context).textTheme.subtitle2,
      decoration: InputDecoration(
        counterText: "",
        isDense: true,
        contentPadding: EdgeInsets.zero,
        labelText: hintText,
        alignLabelWithHint: true,
      ),
    );
  }
}
