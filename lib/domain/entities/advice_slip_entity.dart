import 'package:advice_app/domain/entities/slip_entity.dart';
import 'package:equatable/equatable.dart';

class AdviceSlipEntity extends Equatable{
  final SlipEntity slip;

  const AdviceSlipEntity({
    required this.slip
  });

  @override
  List<Object?> get props => [slip];
}