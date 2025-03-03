import 'package:e_commerce_app/common/widgets/curved_image_container.dart';
import 'package:e_commerce_app/common/widgets/section_heading.dart';
import 'package:flutter/material.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeading(
          title: 'Payment Method',
          blacBackGround: true,
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            CurvedImageContainer(
              height: 35,
              width: 60,
              imageUrl: 'assets/images/payment_methods/visa.png',
            ),
            SizedBox(
              width: 10,
            ),
            Text('Visa **** **** **** 1234',
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}
