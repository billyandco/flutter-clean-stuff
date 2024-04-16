import 'package:injectable/injectable.dart';

import '../../domain/repository/repository.dart';
import '../datasource/datasource.dart';

@Injectable(as: IMathsRepository)
final class DartMathsRepository implements IMathsRepository {
  const DartMathsRepository(this._dartOperationDataSource);

  final IDartOperationDataSource _dartOperationDataSource;

  @override
  int add(int a, int b) => _dartOperationDataSource.add(a, b).result;

  @override
  int subtract(int a, int b) => _dartOperationDataSource.subtract(a, b).result;
}
