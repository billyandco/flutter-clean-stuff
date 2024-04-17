import 'package:flutter/material.dart';

class EuclideanDivisionCard extends StatelessWidget {
  const EuclideanDivisionCard({
    super.key,
    this.remainder,
    this.quotient,
    this.onDividendChanged,
    this.onDivisorChanged,
  });

  final int? remainder;
  final int? quotient;
  final void Function(int?)? onDividendChanged;
  final void Function(int?)? onDivisorChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text('Dividend'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) =>
                        onDividendChanged?.call(int.tryParse(value)),
                  ),
                  const Spacer(),
                  Text(
                    remainder?.toString() ?? '',
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Remainder'),
                ],
              ),
            ),
          ),
          const VerticalDivider(width: 0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Divisor'),
                      const SizedBox(height: 8),
                      TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        onChanged: (value) =>
                            onDivisorChanged?.call(int.tryParse(value)),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        quotient?.toString() ?? '',
                        style: const TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text('Quotient'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
