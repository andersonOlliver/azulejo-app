import 'package:azulejo/app/core/database/box_name.dart';
import 'package:azulejo/app/modules/interview/model/type_penalty_enum.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

import 'package:azulejo/app/modules/interview/model/penalty_model.dart';

part 'penalty_repository.g.dart';

@Injectable()
class PenaltyRepository implements Disposable {
  Box<Penalty>? _box;
  PenaltyRepository() {
    Hive.openBox<Penalty>(PENALTY_NAME).then((box) => this._box = box);
  }

  Future<Box<Penalty>> getBox() async {
    await open();
    return this._box!;
  }

  open() async {
    if (_box == null) {
      this._box = await Hive.openBox<Penalty>(PENALTY_NAME);
    }
  }

  Future<Penalty?> get(String key) async {
    await open();
    return _box!.get(key);
  }

  Future<List<Penalty>> list() async {
    await open();
    return _box!.values.toList();
  }

  Future<List<Penalty>> listBy(TypePenalty type) async {
    await open();
    return _box!.values.where((element) => element.type == type).toList();
  }

  Future<Penalty> update(Penalty penalty) async {
    await open();
    var registered =
        _box!.values.where((element) => element.id == penalty.id).first;
    await _box!.put(registered.key, penalty);
    return registered.copyWithPenalty(penalty);
  }

  @override
  void dispose() {
    _box?.close();
  }

  Future<void> delete(Penalty penalty) async {
    await open();
    _box!.delete(penalty.key);
  }
}
