import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';
import 'package:vexena_demo/core/network/NetWorkManager.dart';
import 'package:vexena_demo/model/foundation_model.dart';
import 'package:vexena_demo/extensions/size_extensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Vexena Demo Project"),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Foundation>?>? snapshot) {
          if (snapshot != null && snapshot.hasData) {
            return ListView.builder(
                itemCount: 15,
                itemBuilder: ((context, index) {
                  return listItemWidget(
                      id: snapshot.data?[index].id,
                      name: snapshot.data?[index].name,
                      body: snapshot.data?[index].body);
                }));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Card listItemWidget({int? id, String? name, String? body}) {
    return Card(
      child: ListTile(
        title: Row(
          children: [
            Text(
              id.toString(),
              maxLines: 2,
            ),
            SizedBox(
              width: context.getWidth * 0.05,
            ),
            Expanded(
              child: Text(
                name ?? "",
                maxLines: 2,
              ),
            ),
          ],
        ),
        subtitle: Text(body ?? ""),
      ),
    );
  }
}

Future<List<Foundation>?> fetchData() async {
  DemoNetworkManager foundationService = DemoNetworkManager();

  final response = await foundationService.networkManager
      ?.send<Foundation, List<Foundation>>("/comments",
          parseModel: Foundation(), method: RequestType.GET);

  return response?.data;
}
