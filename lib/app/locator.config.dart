// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i5;

import '../services/api.dart' as _i3;
import '../services/authentication_service.dart' as _i4;
import '../services/third_party_services_module.dart' as _i7;
import '../services/user_service.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.Api>(() => _i3.Api());
  gh.lazySingleton<_i4.AuthenticationService>(
      () => _i4.AuthenticationService());
  gh.lazySingleton<_i5.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<_i5.NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<_i6.UserService>(() => _i6.UserService());
  return get;
}

class _$ThirdPartyServicesModule extends _i7.ThirdPartyServicesModule {
  @override
  _i5.DialogService get dialogService => _i5.DialogService();
  @override
  _i5.NavigationService get navigationService => _i5.NavigationService();
}
