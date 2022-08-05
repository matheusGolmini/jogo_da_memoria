import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/constants.dart';
import 'package:jogo_da_memoria/pages/nivel_page.dart';
import 'package:jogo_da_memoria/thema.dart';
import 'package:jogo_da_memoria/widgets/recordes.dart';

import '../widgets/logo.dart';
import '../widgets/start_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            StartButton(
              title: 'Modo Normal',
              color: Colors.white,
              action: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const NivelPage(modo: Modo.normal),
                ),
              ),
            ),
            StartButton(
              title: 'Modo Round 6',
              color: Round6Theme.color,
              action: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const NivelPage(modo: Modo.round6),
                ),
              ),
            ),
            const SizedBox(height: 60),
            const Recorde(),
          ],
        ),
      ),
    );
  }
}
