// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/api/api_client/api_client.dart' as _i970;
import '../../features/home/api/datasources/home_local_datasource_impl.dart'
    as _i218;
import '../../features/home/api/datasources/home_remote_datasource_impl.dart'
    as _i218;
import '../../features/home/data/datasources/home_local_datasource_contract.dart'
    as _i1034;
import '../../features/home/data/datasources/home_remote_datasource_contact.dart'
    as _i688;
import '../../features/home/data/repo/home_repo_impl.dart' as _i1024;
import '../../features/home/domain/repos/home_repo_contract.dart' as _i699;
import '../../features/home/domain/usecases/get_products_usecase.dart' as _i677;
import '../../features/home/presentaion/view_model/view_model.dart' as _i809;
import '../dio_module/dio_module.dart' as _i773;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i970.HomeApiClient>(() => _i970.HomeApiClient(gh<_i361.Dio>()));
    gh.factory<_i1034.HomeLocalDataSourceContract>(
      () => _i218.HomeLocalDatasourceImpl(),
    );
    gh.factory<_i688.HomeRemoteDataSourceContract>(
      () => _i218.HomeRemoteDatasourceImpl(gh<_i970.HomeApiClient>()),
    );
    gh.factory<_i699.HomeRepoContract>(
      () => _i1024.HomeRepoImpl(
        gh<_i688.HomeRemoteDataSourceContract>(),
        gh<_i1034.HomeLocalDataSourceContract>(),
      ),
    );
    gh.factory<_i677.GetProductsUseCase>(
      () => _i677.GetProductsUseCase(gh<_i699.HomeRepoContract>()),
    );
    gh.factory<_i809.HomeViewModel>(
      () => _i809.HomeViewModel(gh<_i677.GetProductsUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i773.DioModule {}
