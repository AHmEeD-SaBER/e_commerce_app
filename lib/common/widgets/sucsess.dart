import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SucsessScreen extends StatelessWidget {
  const SucsessScreen({
    super.key,
    required this.title,
    required this.description,
    this.onPressed,
    this.btnTxt,
  });
  final String title;
  final String description;
  final VoidCallback? onPressed;
  final String? btnTxt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 20, vertical: DeviceUtility.getAppBarHeight()),
          child: Column(
            children: [
              Lottie.asset('assets/images/verfication_success.json',
                  repeat: false, height: 300),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                description,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    onPressed!();
                  },
                  child: Text(
                    btnTxt ?? 'Continue',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Colors.black
                            : Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
