import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idz_mp/data/data_model.dart';
import 'package:idz_mp/data/file_model.dart';
import 'package:idz_mp/presentation/main_page.dart';
import '../main.dart';

class ResultWidget extends StatelessWidget {
  String res;
  final DataModel dataModel;
  final bool? noSave;

  ResultWidget({
    Key? key,
    required this.res,
    this.noSave,
    required this.dataModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fun = "";
    Clipboard.setData(ClipboardData(text: res)).then((_){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Copied to your clipboard !')));
    });
    for (var element in dataModel.listF) {
      fun += element;
      fun += "\n";
    }

    if (noSave == null) {
      String newRes = "Количество уравнений: ${dataModel.n}\n";
      newRes += "Уравнения:\n$fun";
      newRes += "Начальные точки: ${dataModel.listX0}\n";
      newRes += "Режим: ${dataModel.mod}\n";
      newRes += "Точность: ${dataModel.accuracy}\n";
      newRes += "Решение:\n";
      newRes += res;
      res = newRes;
    }
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: noSave == null,
                child: TextButton(
                    onPressed: () async {
                      dataSing.addFile(FileModel(
                        dataModel: dataModel,
                        res: res,
                      ));
                    },
                    child: const Text("Сохранить отчет")),
              ),
              Visibility(
                visible: noSave == null,
                child: TextButton(
                    onPressed: () async {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const MainPage()),
                          (Route<dynamic> route) => false);
                    },
                    child: const Text("Выход")),
              ),
              SelectableText(res),
            ],
          ),
        ),
      ),
    );
  }
}
