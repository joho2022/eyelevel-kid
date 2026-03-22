import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/di/service_locator.dart';
import '../../../domain/usecases/app_config/fetch_app_config_usecase.dart';
import 'launch_gate_viewmodel.dart';

LaunchGateViewModel createLaunchGateViewModel() {
  return LaunchGateViewModel(
    fetchAppConfigUseCase: serviceLocator<FetchAppConfigUseCase>(),
    sharedPreferences: serviceLocator<SharedPreferences>(),
  );
}
