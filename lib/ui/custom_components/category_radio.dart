import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:flutter/material.dart';

class CategoryRadio<T> extends StatefulWidget {
  const CategoryRadio({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.toggleable = false,
  });

  final String title;

  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final bool toggleable;

  bool get _selected => value == groupValue;

  @override
  State<CategoryRadio<T>> createState() => _CategoryRadioState<T>();
}

class _CategoryRadioState<T> extends State<CategoryRadio<T>>
    with TickerProviderStateMixin, ToggleableStateMixin {
  void _handleChanged(bool? selected) {
    if (selected == null) {
      widget.onChanged!(null);
      return;
    }
    if (selected) {
      widget.onChanged!(widget.value);
    }
  }

  @override
  void didUpdateWidget(CategoryRadio<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget._selected != oldWidget._selected) {
      // animateToValue();
    }
  }

  @override
  ValueChanged<bool?>? get onChanged =>
      widget.onChanged != null ? _handleChanged : null;

  @override
  bool get tristate => widget.toggleable;

  @override
  bool? get value => widget._selected;

  void _handleTap() {
    switch (value) {
      case false:
        onChanged!(true);
        break;
      case true:
        onChanged!(tristate ? null : false);
        break;
      case null:
        onChanged!(false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.0),
      onTap: _handleTap,
      child: Container(
        width: 100.0,
        height: 35.0,
        decoration: BoxDecoration(
          color: widget._selected ? null : AppColors.fillColor,
          borderRadius: BorderRadius.circular(30.0),
          gradient: widget._selected
              ? const LinearGradient(
                  colors: [
                    AppColors.greenLight,
                    AppColors.green,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
        ),
        child: Center(
          child: Text(
            widget.title,
            style: AppTextStyle.subTitleStyle0.copyWith(
              color: widget._selected ? Colors.white : AppColors.grey100,
            ),
          ),
        ),
      ),
    );
  }
}
