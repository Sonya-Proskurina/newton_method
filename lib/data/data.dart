import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:idz_mp/data/data_model.dart';
import 'package:idz_mp/data/file_model.dart';
import 'package:idz_mp/main.dart';

class Data {
  DataModel dataModel = DataModel(
    accuracy: 0.01,
    listF: [],
    listX0: [],
    maYa: [],
    mod: 'AP',
    n: 0,
  );

  Future<String> getRes() async {
    try {
      BaseOptions options = BaseOptions(baseUrl: "http://10.0.2.2:5000");
      var dio = Dio(options);
      final responseP = await dio.post('/testP', data: dataModel.getMap());

      return responseP.data[0]['rs'].toString();
    } catch (e) {
      return e.toString();
    }
  }

  Future<List<FileModel>> getFilesList() async {
    int n = fileBox.length;
    List<FileModel> list = [];
    for (int i = 0; i < n; i++) {
      list.add(fileBox.getAt(i));
    }
    return list;
  }

  Future addFile(FileModel fileModel) async {
    fileBox.add(fileModel);
  }

}
