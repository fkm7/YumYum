import 'dart:math';

import 'package:delmer/layout/custom_components/credit_card.dart';
import 'package:delmer/layout/custom_components/gradient_button.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditCard extends StatefulWidget {
  const EditCard({Key? key}) : super(key: key);

  @override
  State<EditCard> createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  String expiryDate = '';

  String ownerName = '';

  String cardNumber = '';

  final cardColor =
      creditCardColors[Random(DateTime.now().second).nextInt(creditCardColors.length)];

  final _formKey = GlobalKey<FormState>();

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
            expiryDate: expiryDate,
            color: cardColor,
            cardNumber: cardNumber,
            ownerName: ownerName,
          ),
          const SizedBox(
            height: 24.0,
          ),
          Form(
            key: _formKey,
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
                      labelText: 'Name',
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
                    inputFormatters: [],
                    validator: (value) {
                      if (value != null) {
                        var tempHolder = value.replaceAll(' ', '');
                        if (tempHolder.length < 16) return AppText.cardValidationText;
                        return null;
                      }
                      return AppText.cardValidationText;
                    },
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
                          validator: (value) {},
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
                          validator: (value) {
                            if ((value?.length ?? 0) < 3) return AppText.cvvTooShortText;
                          },
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
                if (_formKey.currentState!.validate()) {}
              },
            ),
          ),
        ],
      ),
    );
  }
}
