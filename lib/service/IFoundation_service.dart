import 'package:vexana/vexana.dart';
import 'package:vexena_demo/model/foundation_model.dart';

abstract class IFoundationService {
  late final NetworkManager networkManager;

  IFoundationService({required this.networkManager});

  Future<List<Foundation>?> fetchData();
}
