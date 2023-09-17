import 'dart:math';

import 'package:delmer/core/stateful_view.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/util/card_formatter.dart';
import 'package:delmer/util/validators.dart';
import 'package:flutter/material.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/ui/cards/credit_card.dart';
import 'package:delmer/ui/custom_components/gradient_button.dart';
import 'package:flutter/services.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({Key? key}) : super(key: key);

  static const route = '/add_new_card';

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  String expiryDate = '';
  String ownerName = '';
  String cardNumber = '';
  final cardColor =
      creditCardColors[Random(DateTime.now().second).nextInt(creditCardColors.length)];
  final _formKey = GlobalKey<FormState>();

  void onSave() {
    if (_formKey.currentState!.validate()) {}
  }

  void scanCardNumber() {}

  @override
  Widget build(BuildContext context) => _AddNewCardPageView(this);
}

class _AddNewCardPageView extends StatefulView<AddNewCardPage, _AddNewCardPageState> {
  const _AddNewCardPageView(super.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppText.addNewCard,
          style: AppTextStyle.appBarTextStyle,
        ),
      ),
      body: Column(
        children: [
          CreditCard(
            expiryDate: state.expiryDate,
            color: state.cardColor,
            cardNumber: state.cardNumber,
            ownerName: state.ownerName,
          ),
          const SizedBox(
            height: 24.0,
          ),
          Form(
            key: state._formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    keyboardType: TextInputType.name,
                    validator: (value) => CardValidators.nameValidator(value),
                    decoration: InputDecoration(
                      labelText: AppText.name,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(19),
                      CardFormatter(separator: ' '),
                    ],
                    validator: CardValidators.cardNumberValidator,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: state.scanCardNumber,
                        icon: const Icon(Icons.camera),
                      ),
                      counter: const SizedBox.shrink(),
                      labelText: AppText.cardNumber.toUpperCase(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 160.0,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 5,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CardExpiryDateFormatter(),
                          ],
                          validator: CardValidators.monthAndYearValidator,
                          decoration: InputDecoration(
                            counter: const SizedBox.shrink(),
                            labelText: AppText.cardDateFormat,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160.0,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          validator: CardValidators.cvvValidator,
                          decoration: InputDecoration(
                            counter: const SizedBox.shrink(),
                            labelText: AppText.cvv,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: GradientButton(
              height: AppDimens.kButtonHeight,
              width: double.infinity,
              onPressed: state.onSave,
              child: Text(
                AppText.save.toUpperCase(),
                style: AppTextStyle.buttonStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
