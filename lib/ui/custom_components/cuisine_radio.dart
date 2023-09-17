import 'package:delmer/core/stateful_view.dart';
import 'package:flutter/material.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/ui/custom_icons/check_icon.dart';

class CuisineRadio<T> extends StatefulWidget {
  const CuisineRadio({
    super.key,
    required this.cusineName,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.toggleable = false,
  });

  final String cusineName;
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final bool toggleable;

  bool get _selected => value == groupValue;

  @override
  State<CuisineRadio<T>> createState() => _CuisineRadioState<T>();
}

class _CuisineRadioState<T> extends State<CuisineRadio<T>>
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
  void didUpdateWidget(CuisineRadio<T> oldWidget) {
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
  Widget build(BuildContext context) => _CuisineChoiceView(this);
}

class _CuisineChoiceView
    extends StatefulView<CuisineRadio, _CuisineRadioState> {
  const _CuisineChoiceView(super.state);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: state._handleTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            widget._selected
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
