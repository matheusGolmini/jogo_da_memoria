import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/constants.dart';
import 'package:jogo_da_memoria/widgets/card_nivel.dart';

class NivelPage extends StatelessWidget {
  final Modo modo;

  const NivelPage({Key? key, required this.modo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nível do jogo'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: const EdgeInsets.all(24),
          children: [
            CardNivel(modo: modo, nivel: 6),
            CardNivel(modo: modo, nivel: 8),
            CardNivel(modo: modo, nivel: 10),
            CardNivel(modo: modo, nivel: 12),
            CardNivel(modo: modo, nivel: 14),
            CardNivel(modo: modo, nivel: 16),
          ],
        ),
      ),
    );
  }
}
