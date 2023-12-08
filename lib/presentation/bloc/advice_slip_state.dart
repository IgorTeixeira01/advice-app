import 'package:advice_app/domain/entities/slip_entity.dart';
import 'package:equatable/equatable.dart';

abstract class AdviceSlipState extends Equatable {
  const AdviceSlipState();

  @override
  List<Object?> get props => [];
}

class AdviceSlipEmpty extends AdviceSlipState {}

class AdviceSlipLoading extends AdviceSlipState {}

class AdviceSlipLoaded extends AdviceSlipState {
  final SlipEntity result;

  const AdviceSlipLoaded(this.result);

  @override
  List<Object?> get props => [result];
}

class AdviceSlipLoadedFailure extends AdviceSlipState {
  final String message;

  const AdviceSlipLoadedFailure(this.message);

  @override
  List<Object?> get props => [message];
}
