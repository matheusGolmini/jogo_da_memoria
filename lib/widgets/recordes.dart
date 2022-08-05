import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/constants.dart';
import 'package:jogo_da_memoria/pages/recordes_page.dart';
import 'package:jogo_da_memoria/thema.dart';

class Recorde extends StatefulWidget {
  const Recorde({Key? key}) : super(key: key);

  @override
  State<Recorde> createState() => _RecordeState();
}

class _RecordeState extends State<Recorde> {
  showRecords(Modo modo) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => RecordesPage(modo: modo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Recordes',
                style: TextStyle(
                  color: Round6Theme.color,
                  fontSize: 22,
                ),
              ),
            ),
            ListTile(
              title: const Text('Modo Normal'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showRecords(Modo.normal),
            ),
            ListTile(
              title: const Text('Modo Round 6'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showRecords(Modo.round6),
            ),
          ],
        ),
      ),
    );
  }
}
