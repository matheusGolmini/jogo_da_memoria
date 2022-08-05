import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/constants.dart';
import 'package:jogo_da_memoria/widgets/card_game.dart';

class GamePage extends StatelessWidget {
  final Modo modo;
  final int nivel;

  const GamePage({
    Key? key,
    required this.modo,
    required this.nivel,
  }) : super(key: key);

  getAxiosCount() {
    if (nivel < 10) {
      return 2;
    } else if (nivel == 10 || nivel == 12 || nivel == 18) {
      return 3;
    } else {
      return 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(modo == Modo.round6
                    ? Icons.my_location
                    : Icons.do_not_touch_rounded),
                const SizedBox(width: 10),
                const Text('18', style: TextStyle(fontSize: 25)),
              ],
            ),
            Image.asset('images/host.png', width: 38, height: 60),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Sair',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
      
      // body: const FeedbackGame(resultado: Resultado.aprovado),

      body: Center(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: getAxiosCount(),
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          padding: const EdgeInsets.all(24),
          children: List.generate(
            nivel,
            (index) => CardGame(
              modo: modo,
              opcao: Random().nextInt(14),
            ),
          ),
        ),
      ),
    );
  }
}
