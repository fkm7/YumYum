import 'package:delmer/core/stateful_view.dart';
import 'package:delmer/model/payment.dart';
import 'package:delmer/ui/custom_components/gradient_button.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoosePaymentMethodDialog extends StatefulWidget {
  const ChoosePaymentMethodDialog({
    Key? key,
    required this.paymentDetails,
  }) : super(key: key);

  final List<Payment> paymentDetails;

  @override
  State<ChoosePaymentMethodDialog> createState() => _ChoosePaymentMethodDialogState();
}

class _ChoosePaymentMethodDialogState extends State<ChoosePaymentMethodDialog> {
  var groupValue = '';
  var value = '';

  void paymentMethodSelected(Object? value) {}

  void addNewPaymentMethod() {}

  @override
  Widget build(BuildContext context) => _ChoosePaymentMethodDialogView(this);
}

class _ChoosePaymentMethodDialogView
    extends StatefulView<ChoosePaymentMethodDialog, _ChoosePaymentMethodDialogState> {
  const _ChoosePaymentMethodDialogView(super.state);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .6.sh,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 24.0,
              bottom: 12.0,
            ),
            child: Text(
              AppText.choosePaymentMethod,
              style: AppTextStyle.titleStyle2.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.paymentDetails.length,
              itemBuilder: (context, index) => Column(
                children: [
                  RadioListTile<Object>(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                    ),
                    title: Text(
                      '4512 ******** 2344',
                      style: AppTextStyle.subTitleStyle2,
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: state.value,
                    groupValue: state.groupValue,
                    onChanged: state.paymentMethodSelected,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                    ),
                    decoration: DottedDecoration(
                      dash: const [2, 5],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 24.0,
              bottom: 32.0,
            ),
            child: GradientButton(
              onPressed: state.addNewPaymentMethod,
              child: Text(
                AppText.addNewPaymentMethod,
                style: AppTextStyle.buttonStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
