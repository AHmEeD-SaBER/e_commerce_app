import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/screens/addresses/add_new-address.dart';
import 'package:e_commerce_app/features/personalization/screens/addresses/widgets/address_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});
  final addresses = [
    AddressCard(
        title: 'Home',
        phoneNumber: '+91 9876543210',
        address: '123, Main Street, Bangalore, Karnataka, India',
        isSelected: true),
    AddressCard(
        title: 'Work',
        phoneNumber: '+91 9876543210',
        address: '123, Main Street, Bangalore, Karnataka, India',
        isSelected: true),
    AddressCard(
        title: 'Other',
        phoneNumber: '+91 9876543210',
        address: '123, Main Street, Bangalore, Karnataka, India',
        isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          'Your Addresses',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return addresses[index];
          },
          itemCount: 3,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddNewAddress());
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
