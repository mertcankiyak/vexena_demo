import 'package:vexana/src/network_manager.dart';
import 'package:vexana/vexana.dart';
import 'package:vexena_demo/core/network/NetWorkManager.dart';
import 'package:vexena_demo/model/foundation_model.dart';
import 'package:vexena_demo/service/IFoundation_service.dart';

class FoundationService extends IFoundationService {
  DemoNetworkManager demoNetworkManager = DemoNetworkManager();

  @override
  Future<List<Foundation>?> fetchData() async {
    final response = await demoNetworkManager.networkManager!
        .send<Foundation, List<Foundation>>("/comments",
            parseModel: Foundation(), method: RequestType.GET);

    return response.data;
  }
}
