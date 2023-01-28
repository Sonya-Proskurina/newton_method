import 'package:flutter/material.dart';
import 'package:idz_mp/presentation/text_field_widget.dart';

class FormulaItemWidget extends StatelessWidget {
  final TextEditingController formulaController;
  final TextEditingController pointController;

  const FormulaItemWidget({
    Key? key,
    required this.formulaController,
    required this.pointController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: TextFieldWidget(
                textEditingController: formulaController,
                hintText: "введите уравнение",
                expanded: true)),
        const SizedBox(width: 8),
        const VerticalDivider(),
        const SizedBox(width: 8),
        SizedBox(
            width:  MediaQuery.of(context).size.width/5,
            child: TextFieldWidget(
                textEditingController: pointController,
                hintText: "значение",
                isNumber: true,
                expanded: true)),
      ],
    );
  }
}
