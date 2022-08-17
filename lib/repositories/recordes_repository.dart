import 'package:hive/hive.dart';
import 'package:jogo_da_memoria/constants.dart';
import 'package:jogo_da_memoria/models/game_play.dart';
import 'package:mobx/mobx.dart';
import 'dart:developer';

part 'recordes_repository.g.dart';

class RecordesRepository = RecordesRepositoryBase with _$RecordesRepository;

abstract class RecordesRepositoryBase with Store {
  late final Box _recodes;
  late final GamePlay gamePlay;

  @observable
  Map recordesRound6 = {};

  @observable
  Map recordesNormal = {};

  RecordesRepositoryBase() {
    _initRepository();
  }

  _initRepository() async {
    await _initDatabase();
    await loadRecordes();
  }

  _initDatabase() async {
    _recodes = await Hive.openBox('gameRecordes');
  }

  @action
  loadRecordes() {
    recordesNormal = _recodes.get(Modo.normal.toString()) ?? {};
    recordesRound6 = _recodes.get(Modo.round6.toString()) ?? {};
  }

  updateRecordes(GamePlay gamePlay, int score) {
    final key = gamePlay.modo.toString();

    if (gamePlay.modo == Modo.normal &&
        (recordesNormal[gamePlay.nivel] == null ||
            score < recordesNormal[gamePlay.nivel])) {
      recordesNormal[gamePlay.nivel] = score;
      _ordernar(recordesNormal);
      _recodes.put(key, recordesNormal);
    } else if (gamePlay.modo == Modo.round6 &&
        (recordesRound6[gamePlay.nivel] == null ||
            score > recordesRound6[gamePlay.nivel])) {
      recordesNormal[gamePlay.nivel] = score;
      _ordernar(recordesNormal);
      _recodes.put(key, recordesNormal);
    }
  }

  _ordernar(Map recordes) {
    if (recordes.length > 1) {
      recordesNormal['normal'] = (recordes.keys.toList()..sort()) as Map;
      log('data: $recordes');
    }
  }
}
