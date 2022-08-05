import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/controllers/game_controller.dart';
import 'package:jogo_da_memoria/pages/home_page.dart';
import 'package:jogo_da_memoria/thema.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<GameController>(
          create: (_) => GameController(),
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
