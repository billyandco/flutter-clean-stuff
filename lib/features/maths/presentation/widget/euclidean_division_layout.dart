import 'package:flutter/material.dart';

class EuclideanDivisionCard extends StatelessWidget {
  const EuclideanDivisionCard({
    super.key,
    required this.dividend,
    required this.divisor,
    required this.remainder,
    required this.quotient,
  });

  final Widget dividend;
  final Widget divisor;
  final Widget quotient;
  final Widget remainder;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text('Dividend'),
                  ),
                  const SizedBox(height: 8),
                  dividend,
                  const Spacer(),
                  remainder,
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text('Remainder'),
                  ),
                ],
              ),
            ),
            const VerticalDivider(width: 0),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text('Divisor'),
                  ),
                  const SizedBox(height: 8),
                  divisor,
                  const Spacer(),
                  const Divider(),
                  const Spacer(),
                  quotient,
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text('Quotient'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
