import 'dart:io';

import 'package:flutter/material.dart';
import 'package:idz_mp/data/data_model.dart';
import 'package:idz_mp/main.dart';
import 'package:idz_mp/presentation/main_page.dart';
import 'package:idz_mp/presentation/matrix_widget.dart';
import 'package:idz_mp/presentation/formula_item_widget.dart';
import 'package:idz_mp/presentation/result_widget.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> funConList = [];
    List<TextEditingController> pointConList = [];

    int n = dataSing.dataModel.n;
    for (int i = 0; i < n; i++) {
      funConList.add(TextEditingController());
      pointConList.add(TextEditingController());
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Введите уравнения и начальные значения"),
              const SizedBox(height: 8),
              const Text(
                  "Пример ввода уравлений:\n\n4.5*X[0]^2+X[1]\n\n2.5*X[0]-X[0]^3"),
              const SizedBox(height: 8),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 100,
                      child: FormulaItemWidget(
                        formulaController: funConList[index],
                        pointController: pointConList[index],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container();
                  },
                  itemCount: n),
              TextButton(
                  onPressed: () async {
                    List<double> listPoint = [];
                    List<String> listFor = [];
                    bool notEmpty = true;
                    for (int i = 0; i < n; i++) {
                      if (funConList[i].text.isEmpty ||
                          pointConList[i].text.isEmpty) {
                        notEmpty = false;
                        break;
                      }
                      listFor.add(funConList[i].text);
                      try {
                        listPoint.add(double.parse(pointConList[i].text));
                      } catch (e) {
                        showAlertDialog(context);
                        print("Ошибка ввода");
                      }
                    }
                    if (notEmpty) {
                      dataSing.dataModel.listF.clear();
                      dataSing.dataModel.listX0.clear();
                      dataSing.dataModel.listF.addAll(listFor);
                      dataSing.dataModel.listX0.addAll(listPoint);

                      if (dataSing.dataModel.mod != 'AN') {
                        String res = await dataSing.getRes();
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultWidget(
                                      res: res,
                                      dataModel: dataSing.dataModel,
                                    )));

                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MatrixWidget()));
                      }
                    } else {
                      print("Все поля должны быть заполнены");
                    }
                  },
                  child: Text(
                      dataSing.dataModel.mod == 'AN' ? "Далее" : "Решение")),
            ],
          ),
        ),
      ),
    );
  }
}
