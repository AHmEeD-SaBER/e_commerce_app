import 'package:e_commerce_app/common/widgets/circle_image_container.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.image,
    this.onPressed,
    this.trailing,
  });
  final String title;
  final String subtitle;
  final String? image;
  final VoidCallback? onPressed;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleImageContainer(
        image: image ?? 'assets/images/User.gif',
      ),
      horizontalTitleGap: 0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: trailing ??
          IconButton(
              onPressed: () {
                onPressed?.call();
              },
              icon: Icon(
                Iconsax.edit,
                color: Colors.white,
              )),
    );
  }
}
