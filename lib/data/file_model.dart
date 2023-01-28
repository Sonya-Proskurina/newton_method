import 'package:hive/hive.dart';
import 'package:idz_mp/data/data_model.dart';
part 'file_model.g.dart';

@HiveType(typeId: 1)
class FileModel {
  @HiveField(0)
  String res;
  @HiveField(1)
  DataModel dataModel;

  FileModel({
    required this.dataModel,
    required this.res,
  });
}
