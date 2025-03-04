import 'package:e_commerce_app/data/repos/authentication/auth_repo.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/utils/bindings/bindings.dart';
import 'package:e_commerce_app/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  try {
    // Ensure Flutter is initialized
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    // Preserve splash screen
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    // Initialize local storage
    await GetStorage.init();

    // Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Initialize authentication repository
    Get.put(AuthRepo());

    runApp(const MainApp());
  } catch (e) {
    // Handle initialization errors appropriately
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Remove splash screen once the app is built
    FlutterNativeSplash.remove();

    return GetMaterialApp(
      initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      defaultTransition: Transition.fadeIn,
      home: const OnboardingScreen(),
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: child!,
        );
      },
    );
  }
}
