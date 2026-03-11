import 'package:eyelevel_kid/ui/core/routes/app_router.dart';
import 'package:eyelevel_kid/ui/core/widgets/app_background.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'core/auth/app_auth_viewmodel.dart';
import 'core/di/service_locator.dart';
import 'data/sources/local/token_local_datasource.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  setupDependencies();

  // MARK: - 토큰 초기화
  // if (kDebugMode) {
  //   await serviceLocator<TokenLocalDataSource>().clear();
  // }

  MobileAds.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppAuthViewModel _authViewModel;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    _authViewModel = serviceLocator<AppAuthViewModel>();
    _router = createAppRouter(_authViewModel);

    _authViewModel.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _authViewModel,
      child: AppBackground(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
        ),
      ),
    );
  }
}
