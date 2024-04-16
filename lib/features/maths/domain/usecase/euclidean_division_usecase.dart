import 'package:flutter_clean_stuff/features/maths/domain/entity/division_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/repository.dart';

abstract interface class IEuclideanDivisionUseCase {
  const IEuclideanDivisionUseCase();

  TaskEither<DivisionError, DivisionEntity> call(int dividend, int divisor);
}

@Injectable(as: IEuclideanDivisionUseCase)
final class EuclideanDivisionUseCase implements IEuclideanDivisionUseCase {
  const EuclideanDivisionUseCase(this._mathsRepository);

  final IMathsRepository _mathsRepository;

  @override
  TaskEither<DivisionError, DivisionEntity> call(int dividend, int divisor) =>
      TaskEither.tryCatch(
        () async {
          if (divisor == 0) {
            throw DivisionError.divisorIsZero;
          } else if (dividend < 0 && divisor < 0) {
            throw DivisionError.bothAreNegative;
          } else if (divisor < 0) {
            throw DivisionError.divisorIsNegative;
          } else if (dividend < 0) {
            throw DivisionError.dividendIsNegative;
          }

          int remainder = dividend;
          int quotient = 0;

          while (remainder >= divisor) {
            remainder = _mathsRepository.subtract(remainder, divisor);
            quotient = _mathsRepository.add(quotient, 1);
          }

          return DivisionEntity(
            remainder: remainder,
            quotient: quotient,
          );
        },
        (error, stackTrace) {
          return error is DivisionError ? error : DivisionError.unknown;
        },
      );
}
