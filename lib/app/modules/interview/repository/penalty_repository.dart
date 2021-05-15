import 'package:azulejo/app/modules/interview/model/penalty_model.dart';
import 'package:azulejo/app/modules/interview/model/type_penalty_enum.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'penalty_repository.g.dart';

@Injectable()
class PenaltyRepository {
  List<Penalty> list() {
    return [
      Penalty(title: 'Cruzou os braços', type: TypePenalty.LOW),
      Penalty(title: 'Bocejou', type: TypePenalty.LOW),
      Penalty(title: 'Não se vestiu adequadamente', type: TypePenalty.LOW),
    ];
  }
}
