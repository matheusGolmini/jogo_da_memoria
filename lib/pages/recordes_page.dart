import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jogo_da_memoria/constants.dart';
import 'package:jogo_da_memoria/repositories/recordes_repository.dart';
import 'package:jogo_da_memoria/thema.dart';
import 'package:provider/provider.dart';

class RecordesPage extends StatelessWidget {
  final Modo modo;
  // final List<String> recs = ['Modo', 'Nível 8', 'Nível 10', 'Nível 11'];

  const RecordesPage({Key? key, required this.modo}) : super(key: key);

  String getModo() {
    return modo == Modo.normal ? 'Normal' : 'Round 6';
  }

  List<Widget> getRecordesList(Map recordes) {
    final List<Widget> widgets = [];

    recordes.forEach((nivel, score) {
      widgets.add(Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: ListTile(
          title: Text(
            'Nível $nivel',
            style: const TextStyle(fontSize: 20),
          ),
          trailing: Text(
            score.toString(),
            style: const TextStyle(fontSize: 20),
          ),
          tileColor: Colors.grey[900],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ));
    });

    if (widgets.isEmpty) {
      widgets.add(
        const Center(
          child: Text('Ainda não possui recordes!'),
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<RecordesRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recordes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Observer(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 36, bottom: 24),
                child: Center(
                  child: Text(
                    'Modo ${getModo()}',
                    style: const TextStyle(
                      fontSize: 28,
                      color: Round6Theme.color,
                    ),
                  ),
                ),
              ),
              ...getRecordesList(
                modo == Modo.normal
                    ? repository.recordesNormal
                    : repository.recordesRound6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
