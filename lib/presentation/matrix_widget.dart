import 'package:flutter/material.dart';
import 'package:idz_mp/presentation/result_widget.dart';
import 'package:idz_mp/presentation/text_field_widget.dart';
import '../main.dart';

class MatrixWidget extends StatefulWidget {
  final n = dataSing.dataModel.n;
  final List<List<TextEditingController>> matrixConList = [];

  MatrixWidget({Key? key}) : super(key: key);

  @override
  State<MatrixWidget> createState() => _MatrixWidgetState();
}

class _MatrixWidgetState extends State<MatrixWidget> {
  @override
  void initState() {
    int n = widget.n;
    for (int i = 0; i < n; i++) {
      widget.matrixConList.add([]);
      for (int j = 0; j < n; j++) {
        widget.matrixConList[i].add(TextEditingController());
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Введите матрицу Якоби"),
            const SizedBox(height: 8),
            Expanded(
                child: GridView.count(
              crossAxisCount: widget.n,
              children: List.generate(widget.n * widget.n, (index) {
                int i = index ~/ widget.n;
                int j = index - (index ~/ widget.n) * widget.n;
                return Container(
                  margin: const EdgeInsets.all(8),
                  //     width: MediaQuery.of(context).size.width/dataSing.dataModel.n-20,
                  // height: 64,
                  child: TextFieldWidget(
                      textEditingController: widget.matrixConList[i][j],
                      hintText: "",
                      expanded: false),
                );
              }),
            )),
            TextButton(
                onPressed: () async {
                  List<List<String>> list = [];
                  try {
                    for (int i = 0; i < widget.n; i++) {
                      list.add([]);
                      for (int j = 0; j < widget.n; j++) {
                        if (widget.matrixConList[i][j].text.isEmpty) {
                          throw "Ошибка ввода";
                        }
                        list[i].add(widget.matrixConList[i][j].text);
                      }
                    }
                    dataSing.dataModel.maYa = list;
                    String res = await dataSing.getRes();
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,MaterialPageRoute(
                        builder: (context) => ResultWidget(
                              res: res,
                              dataModel: dataSing.dataModel,
                            )));
                  } catch (e) {
                    showAlertDialog(context);
                    print(e.toString());
                  }
                },
                child: const Text("Решение")),
          ],
        ),
      ),
    );
  }
}
