import 'package:flutter/material.dart';
import 'package:flutterdon/app/router.dart';

class App extends StatelessWidget {
  App({super.key});

  late final router = buildRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          colorSchemeSeed: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      );
}
