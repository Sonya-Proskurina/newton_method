import 'package:flutter/material.dart';
import 'package:idz_mp/presentation/file_widget.dart';
import 'package:idz_mp/presentation/matrix_widget.dart';
import 'package:idz_mp/presentation/input_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ИДЗ"),
          bottom: const TabBar(
            tabs: [
              Text('Вычисления'),
              Text(
                'Отчеты',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [InputWidget(), FileSaveWidget()],
          ),
        ),
      ),
    );
  }
}
