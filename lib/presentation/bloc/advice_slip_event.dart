import 'package:equatable/equatable.dart';

abstract class AdviceSlipEvent extends Equatable {
  const AdviceSlipEvent();

  @override
  List<Object?> get props => [];
}

class OnAdviceChanged extends AdviceSlipEvent {
  final int slipId;

  const OnAdviceChanged(this.slipId);

  @override
  List<Object?> get props => [slipId];
}