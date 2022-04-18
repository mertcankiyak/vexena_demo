import 'package:vexana/vexana.dart';

class DemoNetworkManager {
  NetworkManager? networkManager;

  static late final DemoNetworkManager _networkDemoManager =
      DemoNetworkManager._init();

  factory DemoNetworkManager() {
    return _networkDemoManager;
  }

  DemoNetworkManager._init() {
    networkManager = NetworkManager(
        errorModel: null,
        options: BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));
  }
}
