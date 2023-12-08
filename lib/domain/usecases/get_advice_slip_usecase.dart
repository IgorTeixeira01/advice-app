import 'package:advice_app/core/error/failure.dart';
import 'package:advice_app/domain/entities/slip_entity.dart';
import 'package:advice_app/domain/repositories/advice_slip_repository.dart';
import 'package:dartz/dartz.dart';

class GetAdviceSlipUsecase {
  final AdviceSlipRepository adviceSlipRepository;

  GetAdviceSlipUsecase(this.adviceSlipRepository);

  Future<Either<Failure,SlipEntity>> execute(int slipId) {
    return adviceSlipRepository.getSlip(slipId);
  }
}