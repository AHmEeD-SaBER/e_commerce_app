import 'package:e_commerce_app/common/widgets/circle_container.dart';
import 'package:e_commerce_app/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip(
      {super.key,
      required this.label,
      required this.selected,
      this.onTap,
      this.isEnabled = true});

  final String label;
  final bool selected;
  final Function(bool)? onTap;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Helper.getColorFromText(label) != null
        ? Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: ChoiceChip(
              label: Text(''),
              selected: selected,
              onSelected: isEnabled ? onTap : null,
              labelStyle: TextStyle(
                  color: selected ? const Color.fromARGB(255, 0, 0, 0) : null),
              avatar: CircleContainer(
                width: 50,
                heigt: 50,
                color: isEnabled
                    ? Helper.getColorFromText(label)!
                    : Helper.getColorFromText(label)!.withOpacity(0.3),
                padding: 5,
              ),
              shape: CircleBorder(),
              labelPadding: EdgeInsets.all(0),
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.all(0),
              selectedColor: Colors.green,
              disabledColor: Colors.grey.withOpacity(0.1),
            ),
          )
        : Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: ChoiceChip(
              label: Text(label,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: selected
                            ? Colors.black
                            : isEnabled
                                ? null
                                : Colors.grey,
                      )),
              selected: selected,
              onSelected: isEnabled ? onTap : null,
              disabledColor: Colors.grey.withOpacity(0.1),
            ),
          );
  }
}
