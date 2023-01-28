import 'package:flutter/material.dart';
import 'package:idz_mp/main.dart';
import 'package:idz_mp/presentation/result_widget.dart';
import '../data/file_model.dart';

class FileSaveWidget extends StatefulWidget {
  const FileSaveWidget({Key? key}) : super(key: key);

  @override
  State<FileSaveWidget> createState() => _FileSaveWidgetState();
}

class _FileSaveWidgetState extends State<FileSaveWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FileModel>>(
        future: dataSing.getFilesList(),
        builder: (context, snap) {
          if (snap.data != null&&snap.data!.isNotEmpty) {
            print(snap.data![0].dataModel.listF);
            print(snap.data![snap.data!.length-1].dataModel.listF);
            return Scaffold(
              body: Container(
                padding: const EdgeInsets.all(24),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 100,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultWidget(
                                            res: snap.data![index].res,
                                            noSave: true,
                                            dataModel:
                                                snap.data![index].dataModel,
                                          )));
                            },
                            child: Text("Отчет $index")),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: snap.data!.length),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
