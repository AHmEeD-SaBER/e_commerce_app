import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class EmaiVerificationScreen extends StatelessWidget {
  const EmaiVerificationScreen(
      {super.key,
      this.title,
      required this.description,
      required this.btnTxt,
      required this.subtitle,
      required this.image,
      required this.onPressed});
  final String? title;
  final String description;
  final String btnTxt;
  final String subtitle;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {
                Get.offAll(() => LoginScreen());
              },
              icon: Icon(Icons.close),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 20, vertical: DeviceUtility.getAppBarHeight()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(image),
              SizedBox(height: 20),
              if (title != null)
                Text(
                  title!,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              SizedBox(height: 20),
              Text(subtitle),
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
                    onPressed();
                  },
                  child: Text(
                    btnTxt,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Colors.black
                            : Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend Email',
                    style: Theme.of(context).textTheme.bodyMedium,
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
