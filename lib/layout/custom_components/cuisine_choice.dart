import 'package:flutter/material.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/layout/custom_icons/check_icon.dart';

class CuisineChoice extends StatefulWidget {
  const CuisineChoice({
    Key? key,
    required this.cusineName,
    required this.onSelected,
  }) : super(key: key);

  final String cusineName;
  final ValueChanged<bool> onSelected;

  @override
  State<CuisineChoice> createState() => _CuisineChoiceState();
}

class _CuisineChoiceState extends State<CuisineChoice> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            selected
                ? Container(
                    height: 24.0,
                    width: 24.0,
                    padding: const EdgeInsets.only(
                      left: 6.0,
                      top: 8.0,
                      right: 8.0,
                      bottom: 8.0,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.red,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      CheckIcon.check,
                      size: 8.0,
                      color: Colors.white,
                    ),
                  )
                : Container(
                    height: 24.0,
                    width: 24.0,
                    decoration: const BoxDecoration(
                      color: AppColors.fillColor,
                      shape: BoxShape.circle,
                    ),
                  ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              widget.cusineName,
              style: AppTextStyle.subTitleStyle1.copyWith(
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
