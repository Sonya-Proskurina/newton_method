import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:idz_mp/data/data_model.dart';
import 'package:idz_mp/data/file_model.dart';
import 'package:idz_mp/presentation/main_page.dart';
import 'data/data.dart';

Data dataSing = Data();
late Box dataBox;
late Box fileBox;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());
  Hive.registerAdapter(FileModelAdapter());
  fileBox = await Hive.openBox("file");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  AlertDialog alert = AlertDialog(
    title: const Text("Ошибка"),
    content: const Text("Ошибка ввода!"),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
