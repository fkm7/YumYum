import 'package:delmer/core/stateful_view.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/ui/custom_icons/check_icon.dart';

class SortByRadio<T> extends StatefulWidget {
  const SortByRadio({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.toggleable = false,
  }) : super(key: key);

  final String title;
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final bool toggleable;

  bool get _selected => value == groupValue;

  @override
  State<SortByRadio<T>> createState() => _SortByRadioState<T>();
}

class _SortByRadioState<T> extends State<SortByRadio<T>>
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
  void didUpdateWidget(SortByRadio<T> oldWidget) {
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
  Widget build(BuildContext context) => _SortByItemView(this);
}

class _SortByItemView extends StatefulView<SortByRadio, _SortByRadioState> {
  const _SortByItemView(super.state);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: state._handleTap,
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
            if (widget._selected)
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
