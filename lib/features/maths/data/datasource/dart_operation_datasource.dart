import 'package:injectable/injectable.dart';

import '../data.dart';

abstract interface class IDartOperationDataSource {
  const IDartOperationDataSource();

  OperationModel add(int a, int b);
  OperationModel subtract(int a, int b);
}

@Injectable(as: IDartOperationDataSource)
final class DartOperationDataSource implements IDartOperationDataSource {
  const DartOperationDataSource();

  @override
  OperationModel add(int a, int b) => OperationModel(result: a + b);

  @override
  OperationModel subtract(int a, int b) => OperationModel(result: a - b);
}
