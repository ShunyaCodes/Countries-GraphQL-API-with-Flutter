import 'package:flutter/material.dart';
import 'package:countries/server/graphQL_config.dart';
import 'package:countries/pages/home_screen.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initHiveForFlutter();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    //GraphQLConfig init
    ValueNotifier<GraphQLClient> client = GraphQLConfig.graphInit();
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Countries Data',
        home: HomeScreen(),
      ),
    );
  }
}
