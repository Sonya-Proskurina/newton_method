import 'package:flutter/material.dart';
import 'package:idz_mp/main.dart';
import 'package:idz_mp/presentation/data_widget.dart';
import 'package:idz_mp/core/switch_widget.dart';
import 'package:idz_mp/presentation/text_field_widget.dart';

class InputWidget extends StatefulWidget {
  InputWidget({Key? key}) : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool isAP = true;
  TextEditingController toController = TextEditingController();
  TextEditingController countUController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldWidget(
                    textEditingController: toController,
                    hintText: "Введите точность вычислений",
                    isNumber: true,
                    expanded: false),
                TextFieldWidget(
                    textEditingController: countUController,
                    hintText: "Введите количество уравнений",
                    isNumber: true,
                    expanded: false),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text("Режим апроксимации"),
                    const Spacer(),
                    SwitchWidget(
                        value: isAP,
                        toggle: (val) {
                          setState(() {
                            isAP = val;
                          });
                        }),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      onPressed: () {
                        try {
                          double accuracy = double.parse(toController.text);
                          int n = int.parse(countUController.text);
                          dataSing.dataModel.accuracy = accuracy;
                          dataSing.dataModel.n = n;
                          dataSing.dataModel.mod = (isAP) ? "AP" : "AN";
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DataWidget()));
                        } catch (e) {
                          showAlertDialog(context);
                          print("Ошибка ввода!");
                        }
                      },
                      child: const Text("Далее")),
                )
              ],
            ),
          ),
        ));
  }
}
