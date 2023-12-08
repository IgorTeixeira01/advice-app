import 'package:advice_app/core/error/failure.dart';
import 'package:advice_app/domain/entities/slip_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AdviceSlipRepository {

  Future<Either<Failure,SlipEntity>> getSlip (int slipId);
}