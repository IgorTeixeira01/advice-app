import 'package:advice_app/data/data_sources/remote_data_source.dart';
import 'package:advice_app/data/repositories/advice_slip_repository_impl.dart';
import 'package:advice_app/domain/repositories/advice_slip_repository.dart';
import 'package:advice_app/domain/usecases/get_advice_slip_usecase.dart';
import 'package:advice_app/presentation/bloc/advice_slip_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(
    () => AdviceSlipBloc(
      locator(),
    ),
  );

  locator.registerLazySingleton(
    () => GetAdviceSlipUsecase(
      locator(),
    ),
  );

  locator.registerLazySingleton<AdviceSlipRepository>(
    () => AdviceSlipRepositoryImpl(
      adviceSlipRemoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<AdviceSlipRemoteDataSource>(
    () => AdviceSlipRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  locator.registerLazySingleton(
    () => http.Client(),
  );
}
