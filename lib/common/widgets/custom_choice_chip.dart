import 'package:e_commerce_app/common/widgets/circle_container.dart';
import 'package:e_commerce_app/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip(
      {super.key, required this.label, required this.selected, this.onTap});
  final String label;
  final bool selected;
  final Function(bool)? onTap;
  @override
  Widget build(BuildContext context) {
    return Helper.getColorFromText(label) != null
        ? Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: ChoiceChip(
              label: Text(''),
              selected: selected,
              onSelected: onTap,
              labelStyle: TextStyle(color: selected ? Colors.white : null),
              avatar: CircleContainer(
                width: 50,
                heigt: 50,
                color: Helper.getColorFromText(label)!,
                padding: 5,
              ),
              shape: CircleBorder(),
              labelPadding: EdgeInsets.all(0),
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.all(0),
              selectedColor: Colors.green,
            ),
          )
        : Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: ChoiceChip(
              label: Text(label),
              selected: selected,
              onSelected: onTap,
            ),
          );
  }
}
