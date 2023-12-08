import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advice_app/domain/usecases/get_advice_slip_usecase.dart';
import 'package:advice_app/presentation/bloc/advice_slip_event.dart';
import 'package:advice_app/presentation/bloc/advice_slip_state.dart';

class AdviceSlipBloc extends Bloc<AdviceSlipEvent, AdviceSlipState> {
  final GetAdviceSlipUsecase _getAdviceSlipUsecase;
  AdviceSlipBloc(this._getAdviceSlipUsecase) : super(AdviceSlipEmpty()) {
    on<OnAdviceChanged>(
      (event, emit) async {
        emit(AdviceSlipLoading());
        final result = await _getAdviceSlipUsecase.execute(event.slipId);
        result.fold(
          (failure) {
            emit(AdviceSlipLoadedFailure(failure.message));
          },
          (data) {
            emit(AdviceSlipLoaded(data));
          },
        );
      },
    );
  }
}
