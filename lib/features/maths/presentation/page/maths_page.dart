import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_stuff/common/injection/depedencies.dart';
import 'package:flutter_clean_stuff/features/maths/presentation/presentation.dart';

class MathsPage extends StatelessWidget {
  const MathsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Euclidean Division'),
      ),
      body: BlocProvider(
        create: (context) => getIt<MathsController>(),
        child: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Container(
                padding: const EdgeInsets.all(8),
                width: 300,
                height: 300,
                child: Builder(
                  builder: (context) {
                    return EuclideanDivisionCard(
                      dividend: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          onChanged: (value) => context
                              .read<MathsController>()
                              .update(dividend: int.tryParse(value)),
                        ),
                      ),
                      divisor: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          onChanged: (value) => context
                              .read<MathsController>()
                              .update(divisor: int.tryParse(value)),
                        ),
                      ),
                      remainder: Builder(
                        builder: (context) {
                          final remainder = context.select(
                            (MathsController c) => c.state.remainder,
                          );

                          if (remainder == null) {
                            return const Text('');
                          }

                          return Text(
                            remainder.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 32,
                            ),
                          );
                        },
                      ),
                      quotient: Builder(
                        builder: (context) {
                          final quotient = context.select(
                            (MathsController c) => c.state.quotient,
                          );

                          if (quotient == null) {
                            return const Text('');
                          }

                          return Text(
                            quotient.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 32,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
