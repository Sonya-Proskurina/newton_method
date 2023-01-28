import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 0)
class DataModel {
  @HiveField(0)
  List<double> listX0;
  @HiveField(1)
  List<String> listF;
  @HiveField(2)
  List<List<String>> maYa;
  @HiveField(3)
  int n;
  @HiveField(4)
  double accuracy;
  @HiveField(5)
  String mod;

  DataModel({
    required this.accuracy,
    required this.listF,
    required this.listX0,
    required this.maYa,
    required this.mod,
    required this.n,
  });

  Map<String, dynamic> getMap() {
    return {
      "list_x0": listX0,
      "list_f": listF,
      "maYa": maYa,
      "n": n,
      "accuracy": accuracy,
      "mod": mod,
    };
  }
// "list_x0": [2, 1],
// "list_f": ['X[0]^2+X[1]^2-2', 'sin(X[0])+X[1]-1'],
// "maYa": [
// ['2*X[0]', '2*X[1]'],
// ['cos(X[0])', '1']
// ],
// "n": 2,
// "accuracy": 0.001,
// "mod": "AP"
}
