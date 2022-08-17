import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jogo_da_memoria/controllers/game_controller.dart';
import 'package:jogo_da_memoria/pages/home_page.dart';
import 'package:jogo_da_memoria/repositories/recordes_repository.dart';
import 'package:jogo_da_memoria/thema.dart';
import 'package:provider/provider.dart';
//AppCenter
import 'package:appcenter/appcenter.dart';
import 'package:appcenter_analytics/appcenter_analytics.dart';
import 'package:appcenter_crashes/appcenter_crashes.dart';
import 'package:flutter/foundation.dart';

void main() async {
  await Hive.initFlutter();
  final ios = defaultTargetPlatform == TargetPlatform.iOS;
  var app_secret = ios
      ? "123cfac9-123b-123a-123f-123273416a48"
      : "00f371a4-3e86-44b5-a4aa-6aeeaba7bade";

  await AppCenter.start(
      app_secret, [AppCenterAnalytics.id, AppCenterCrashes.id]);

  runApp(
    MultiProvider(
      providers: [
        Provider<RecordesRepository>(create: (_) => RecordesRepository()),
        ProxyProvider<RecordesRepository, GameController>(
          update: (_, repo, __) => GameController(recordesRepository: repo),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Round 6 Memory',
      debugShowCheckedModeBanner: false,
      theme: Round6Theme.theme,
      home: const HomePage(),
    );
  }
}
