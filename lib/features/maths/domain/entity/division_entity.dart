import 'package:equatable/equatable.dart';

class DivisionEntity extends Equatable {
  const DivisionEntity({
    required this.remainder,
    required this.quotient,
  });

  final int remainder;
  final int quotient;

  DivisionEntity copyWith({
    int? remainder,
    int? quotient,
  }) {
    return DivisionEntity(
      remainder: remainder ?? this.remainder,
      quotient: quotient ?? this.quotient,
    );
  }

  @override
  List<Object?> get props => [remainder, quotient];
}

enum DivisionError {
  divisorIsZero,
  dividendIsNegative,
  divisorIsNegative,
  bothAreNegative,
  unknown;
}
