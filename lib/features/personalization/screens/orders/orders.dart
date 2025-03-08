import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/circular_icon.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: SizedBox(
            width: DeviceUtility.getScreenWidth(context) * 0.9,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, indx) => OrderItem(),
                separatorBuilder: (_, __) => SizedBox(
                      height: 26,
                    ),
                itemCount: 3),
          ),
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DeviceUtility.isDarkMood(context)
            ? CustomColors.black
            : CustomColors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              InfoRow(
                icon: Iconsax.box,
                info: 'Processing',
                value: '03 Nov 2025',
                titleStyle: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: CustomColors.primaryColor),
              ),
              Spacer(),
              CircularIcon(icon: Iconsax.arrow_right, onPressed: () {})
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: InfoRow(
                    icon: Iconsax.ticket,
                    info: 'Order',
                    value: '[#16453]',
                    titleStyle: Theme.of(context).textTheme.labelMedium!),
              ),
              Expanded(
                flex: 2,
                child: InfoRow(
                    icon: Iconsax.calendar,
                    info: 'Shipping Date',
                    value: '07 Nov 2025',
                    titleStyle: Theme.of(context).textTheme.labelMedium!),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.info,
    required this.value,
    required this.titleStyle,
    required this.icon,
  });

  final String info;
  final String value;
  final TextStyle titleStyle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              info,
              style: titleStyle,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
      ],
    );
  }
}
