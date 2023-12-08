import 'dart:io';

import 'package:advice_app/core/error/exception.dart';
import 'package:advice_app/core/error/failure.dart';
import 'package:advice_app/data/data_sources/remote_data_source.dart';
import 'package:advice_app/domain/entities/slip_entity.dart';
import 'package:advice_app/domain/repositories/advice_slip_repository.dart';
import 'package:dartz/dartz.dart';

class AdviceSlipRepositoryImpl extends AdviceSlipRepository {
  final AdviceSlipRemoteDataSource adviceSlipRemoteDataSource;
  AdviceSlipRepositoryImpl({required this.adviceSlipRemoteDataSource});

  @override
  Future<Either<Failure, SlipEntity>> getSlip(int slipId) async {
    try{
      final result = await adviceSlipRemoteDataSource.getSlip(slipId);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Ocorreu um erro'));
    } on SocketException {
      return const Left(ConnectionFailure('Falha ao conectar com a internet'));
    }
  }
}