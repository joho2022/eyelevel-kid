import 'package:eyelevel_kid/ui/core/routes/app_router.dart';
import 'package:eyelevel_kid/ui/core/widgets/app_background.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  dotenv.load(fileName: ".env");
  MobileAds.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
    );
  }
}