import 'package:e_commerce_app/bottom_nav_bar.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/sucsess.dart';
import 'package:e_commerce_app/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/cupon_container.dart';
import 'package:e_commerce_app/common/widgets/section_heading.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text('Order Summary',
            style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, indx) => CartItem(
                  showRemoveAddButtons: false,
                ),
                separatorBuilder: (_, __) => SizedBox(
                  height: 26,
                ),
                itemCount: 2,
              ),
              SizedBox(
                height: 20,
              ),
              CuponContainer(),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: DeviceUtility.isDarkMood(context)
                      ? Colors.black
                      : Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: DeviceUtility.isDarkMood(context)
                          ? Colors.white
                          : Colors.black),
                ),
                child: Column(
                  children: [
                    BillingAmountSection(),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    BillingPaymentSection(),
                    SizedBox(
                      height: 20,
                    ),
                    BillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => SucsessScreen(
                  title: 'Payment Successful',
                  description: 'Your order has been placed successfully',
                  btnTxt: 'Continue Shopping',
                  onPressed: () {
                    Get.offAll(() => BottomNavBar());
                  },
                ));
          },
          child: Text(
            'Checkout \$560.99',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18,
                color: DeviceUtility.isDarkMood(context)
                    ? Colors.black
                    : Colors.white),
          ),
        ),
      ),
    );
  }
}

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: 'Billing Address',
          showActionBtn: true,
          blacBackGround: true,
          onPressed: () {},
          buttonTitle: 'Change',
        ),
        Text(
          'John Doe',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          minTileHeight: 30,
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          leading: Icon(Icons.phone, color: Colors.grey),
          title: Text('+1 123 456 7890'),
        ),
        ListTile(
          minTileHeight: 30,
          leading: Icon(Icons.location_on, color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          title: Text('123, Main Street, New York, USA'),
        ),
      ],
    );
  }
}
