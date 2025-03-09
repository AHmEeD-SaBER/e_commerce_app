import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/controllers/update_name_controller.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateName extends StatelessWidget {
  const UpdateName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UpdateNameController());
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text('Update Your Name'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: userController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Please use your rael name lorem ipsum dolor sit amet lorem ipsum dolor sit amet',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      TextFormField(
                        controller: userController.firstName,
                        validator: (value) =>
                            Validator.validateEmptyField('First name', value),
                        decoration: InputDecoration(
                          label: Text('First Name'),
                          hintText: 'First Name',
                          prefixIcon: Icon(Icons
                              .person), // Use icons if available, fallback to person icon
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: userController.lastName,
                        validator: (value) =>
                            Validator.validateEmptyField('Last Name', value),
                        decoration: InputDecoration(
                          label: Text('Last Name'),
                          hintText: 'last Name',
                          prefixIcon: Icon(Icons
                              .person), // Use icons if available, fallback to person icon
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        userController.updateName();
                      },
                      child: Text(
                        'Save',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: DeviceUtility.isDarkMood(context)
                                ? Colors.black
                                : Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
