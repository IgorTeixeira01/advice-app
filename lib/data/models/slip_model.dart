import 'package:advice_app/domain/entities/slip_entity.dart';

const String idConst = 'id';
const String adviceConst = 'advice';
const String slipConst = 'slip';

class SlipModel extends SlipEntity {
  const SlipModel({
    required int id,
    required String advice,
  }) : super(
          id: id,
          advice: advice,
        );

  factory SlipModel.fromJson(Map<String, dynamic> json) => SlipModel(
        id: json[slipConst][idConst],
        advice: json[slipConst][adviceConst],
      );

  SlipEntity toEntity() => SlipEntity(
        id: id,
        advice: advice,
      );
}
