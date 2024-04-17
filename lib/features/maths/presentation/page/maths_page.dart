import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/injection/depedencies.dart';
import '../presentation.dart';

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
              child: Container(
                padding: const EdgeInsets.all(8),
                width: 300,
                height: 300,
                child: BlocBuilder<MathsController, DivisionState>(
                  buildWhen: (previous, current) =>
                      (previous.remainder, previous.quotient) !=
                      (current.remainder, current.quotient),
                  builder: (context, state) {
                    return EuclideanDivisionCard(
                      remainder: state.remainder,
                      quotient: state.quotient,
                      onDividendChanged: (dividend) => context
                          .read<MathsController>()
                          .update(dividend: dividend),
                      onDivisorChanged: (divisor) => context
                          .read<MathsController>()
                          .update(divisor: divisor),
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
