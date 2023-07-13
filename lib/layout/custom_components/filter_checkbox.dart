import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/layout/custom_icons/check_icon.dart';

class FilterCategoryCheckBox extends StatefulWidget {
  const FilterCategoryCheckBox({
    Key? key,
    required this.title,
    required this.selected,
  }) : super(key: key);

  final String title;
  final ValueChanged<bool> selected;

  @override
  State<FilterCategoryCheckBox> createState() => _FilterCategoryCheckBoxState();
}

class _FilterCategoryCheckBoxState extends State<FilterCategoryCheckBox> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        decoration: DottedDecoration(
          dash: const [2, 4],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: AppTextStyle.subTitleStyle1.copyWith(
                color: AppColors.grey,
              ),
            ),
            if (selected)
              const Icon(
                CheckIcon.check,
                size: 16.0,
                color: AppColors.green,
              ),
          ],
        ),
      ),
    );
  }
}
