import 'package:delmer/res/assets.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/layout/custom_components/gradient_button.dart';
import 'package:delmer/layout/custom_icons/edit_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  static const route = '/edit_profile';

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppText.editProfile,
          style: AppTextStyle.titleStyle0.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 8.0,
        ),
        height: mediaQuery.size.height,
        width: mediaQuery.size.width,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200.h,
                width: 220.w,
                child: Stack(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 72.0,
                    ),
                    Positioned(
                      right: 1.0,
                      bottom: 1.0,
                      child: MaterialButton(
                        minWidth: 0,
                        onPressed: () {},
                        color: AppColors.grey,
                        child: const Icon(
                          EditIcon.edit,
                          size: 14.0,
                          color: Colors.white,
                        ),
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.white,
                            width: 3.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: AppText.name.toUpperCase(),
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: AppText.email.toUpperCase(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: AppText.phoneNumber.toUpperCase(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: AppText.location.toUpperCase(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              GradientButton(
                height: AppDimens.kButtonHeight,
                width: mediaQuery.size.width,
                child: Text(
                  AppText.saveChanges.toUpperCase(),
                  style: AppTextStyle.buttonStyle,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
