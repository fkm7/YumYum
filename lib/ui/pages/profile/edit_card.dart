import 'dart:math';

import 'package:delmer/core/stateful_view.dart';
import 'package:delmer/ui/cards/credit_card.dart';
import 'package:delmer/ui/custom_components/gradient_button.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/util/validators.dart';
import 'package:flutter/material.dart';

class EditCardPage extends StatefulWidget {
  const EditCardPage({Key? key}) : super(key: key);

  static const route = '/edit_card';

  @override
  State<EditCardPage> createState() => _EditCardPageState();
}

class _EditCardPageState extends State<EditCardPage> {
  String expiryDate = '';
  String ownerName = '';
  String cardNumber = '';
  final cardColor =
      creditCardColors[Random(DateTime.now().second).nextInt(creditCardColors.length)];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => _EditCardPageView(this);
}

class _EditCardPageView extends StatefulView<EditCardPage, _EditCardPageState> {
  const _EditCardPageView(super.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppText.editCard,
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
                    validator: (value) {
                      if (value != null) {
                        if (value.isEmpty) return AppText.nameValidationText;
                        return null;
                      }
                      return AppText.nameValidationText;
                    },
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
                    inputFormatters: const [],
                    validator: CardValidators.cardNumberValidator,
                    decoration: InputDecoration(
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
                          maxLength: 5,
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
                          maxLength: 3,
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
              child: Text(
                AppText.save.toUpperCase(),
                style: AppTextStyle.buttonStyle,
              ),
              onPressed: () {
                if (state._formKey.currentState!.validate()) {}
              },
            ),
          ),
        ],
      ),
    );
  }
}
