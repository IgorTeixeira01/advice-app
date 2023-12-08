import 'package:advice_app/domain/entities/advice_slip_entity.dart';
import 'package:advice_app/domain/entities/slip_entity.dart';

const String slipConst = 'slip';

class AdviceSlipModel extends AdviceSlipEntity {
  const AdviceSlipModel({
    required SlipEntity slip,
  }) : super(slip: slip);

  factory AdviceSlipModel.fromJson(Map<String, dynamic> json) =>
      AdviceSlipModel(
        slip: json[slipConst],
      );

  AdviceSlipEntity toEntity() => AdviceSlipEntity(
        slip: slip,
      );
}
