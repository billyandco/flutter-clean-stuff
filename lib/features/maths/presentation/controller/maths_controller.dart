import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';

class DivisionState {
  const DivisionState({
    this.dividend,
    this.divisor,
    this.remainder,
    this.quotient,
    this.error,
  });

  final int? dividend;
  final int? divisor;
  final int? remainder;
  final int? quotient;

  final Object? error;

  DivisionState copyWith({
    int? dividend,
    int? divisor,
    int? remainder,
    int? quotient,
    Object? error,
  }) {
    return DivisionState(
      dividend: dividend ?? this.dividend,
      divisor: divisor ?? this.divisor,
      remainder: remainder ?? this.remainder,
      quotient: quotient ?? this.quotient,
      error: error ?? this.error,
    );
  }
}

@injectable
final class MathsController extends Cubit<DivisionState> {
  MathsController({
    required IEuclideanDivisionUseCase euclideanDivisionUseCase,
  })  : _euclideanDivisionUseCase = euclideanDivisionUseCase,
        super(const DivisionState());

  final IEuclideanDivisionUseCase _euclideanDivisionUseCase;

  void update({
    int? dividend,
    int? divisor,
  }) {
    emit(
      state.copyWith(
        dividend: dividend,
        divisor: divisor,
      ),
    );
    _divide();
  }

  void _divide() async {
    final DivisionState(:dividend, :divisor) = state;
    if (dividend == null || divisor == null) {
      return;
    }

    final result = await _euclideanDivisionUseCase(dividend, divisor)
        .match(
          (l) => state.copyWith(error: l),
          (r) => state.copyWith(
            remainder: r.remainder,
            quotient: r.quotient,
          ),
        )
        .run();

    emit(result);
  }
}
