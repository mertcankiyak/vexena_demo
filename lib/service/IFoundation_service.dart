import 'package:vexana/vexana.dart';
import 'package:vexena_demo/model/foundation_model.dart';

abstract class IFoundationService {
  Future<List<Foundation>?> fetchData();
}
