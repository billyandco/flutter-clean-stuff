// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/maths/data/datasource/dart_operation_datasource.dart'
    as _i3;
import '../../features/maths/data/datasource/datasource.dart' as _i6;
import '../../features/maths/data/repository/maths_repository.dart' as _i5;
import '../../features/maths/domain/domain.dart' as _i9;
import '../../features/maths/domain/repository/repository.dart' as _i4;
import '../../features/maths/domain/usecase/euclidean_division_usecase.dart'
    as _i7;
import '../../features/maths/presentation/controller/maths_controller.dart'
    as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.IDartOperationDataSource>(
        () => const _i3.DartOperationDataSource());
    gh.factory<_i4.IMathsRepository>(
        () => _i5.DartMathsRepository(gh<_i6.IDartOperationDataSource>()));
    gh.factory<_i7.IEuclideanDivisionUseCase>(
        () => _i7.EuclideanDivisionUseCase(gh<_i4.IMathsRepository>()));
    gh.factory<_i8.MathsController>(() => _i8.MathsController(
        euclideanDivisionUseCase: gh<_i9.IEuclideanDivisionUseCase>()));
    return this;
  }
}
