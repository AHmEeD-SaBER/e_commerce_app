import 'package:e_commerce_app/common/widgets/circle_container.dart';
import 'package:e_commerce_app/common/widgets/custom_clip_path.dart';
import 'package:flutter/material.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomClipPath(
      child: Container(
        color: const Color.fromARGB(255, 0, 172, 140),
        padding: EdgeInsets.all(0),
        child: SizedBox(
          // height: 350,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -200,
                child: CircleContainer(
                  heigt: 400,
                  width: 400,
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.dark
                      ? const Color.fromARGB(50, 140, 140, 140).withOpacity(0.3)
                      : const Color.fromARGB(62, 255, 255, 255),
                  padding: 0,
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: CircleContainer(
                  heigt: 400,
                  width: 400,
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.dark
                      ? const Color.fromARGB(50, 140, 140, 140).withOpacity(0.3)
                      : const Color.fromARGB(62, 255, 255, 255),
                  padding: 0,
                ),
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}
