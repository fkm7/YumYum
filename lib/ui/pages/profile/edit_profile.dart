import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:delmer/core/stateful_view.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/util/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/ui/custom_components/gradient_button.dart';
import 'package:delmer/ui/custom_icons/edit_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:l/l.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  static const route = '/edit_profile';

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final formKey = GlobalKey<FormState>();
  final firebase = FirebaseDatabase.instance;
  final currentUser = FirebaseAuth.instance.currentUser;
  late final avatarUrl =
      FirebaseStorage.instance.ref('/${currentUser?.uid}/avatar');
  String? url;
  String? fullname, email, phoneNumber, address;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fullname = currentUser?.displayName;
    email = currentUser?.email;
    phoneNumber = currentUser?.phoneNumber;
    firebase.ref('/${currentUser?.uid}/').get().then((snapshot) {
      address = (snapshot.value as Map?)?['address'];
    });
    nameController.text = fullname ?? '';
    emailController.text = email ?? '';
    phoneNumberController.text = phoneNumber ?? '';
    avatarUrl.getDownloadURL().then((value) => setState(() => url = value));
  }

  void saveChanges() {
    final valid = formKey.currentState?.validate() ?? false;
    if (valid) {}
  }

  Future<ImageSource?> showImageSourceDialog() async {
    return await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          'Choose Image source',
          style: AppTextStyle.headerStyle,
        ),
        actions: [
          CupertinoButton(
            onPressed: () => Navigator.pop(context, ImageSource.camera),
            child: const Icon(Icons.camera),
          ),
          CupertinoButton(
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
            child: const Icon(Icons.image),
          ),
        ],
      ),
    );
  }

  Future<String?> changeAvatar() async {
    try {
      final storage = FirebaseStorage.instance;
      final picker = ImagePicker();
      ImageSource? source = await showImageSourceDialog();
      if (source == null) return null;
      final pickedImage = await picker.pickImage(source: source);
      if (pickedImage != null) {
        final pickedFile = File(pickedImage.path);
        final id = FirebaseAuth.instance.currentUser?.uid;
        final storeRef = storage.ref().child('$id/avatar');
        final uploadTask = storeRef.putFile(pickedFile);
        final taskSnapshot = await uploadTask.whenComplete(() => 'Complete');
        final imageUrl = taskSnapshot.ref.getDownloadURL();
        return imageUrl;
      }
      return null;
    } catch (error, stack) {
      l.e(error, stack);
      return null;
    }
  }

  getAvatar() => url != null
      ? CachedNetworkImageProvider(url!)
      : const AssetImage(AppAssets.avatar);

  @override
  Widget build(BuildContext context) => _EditProfilePageView(this);
}

class _EditProfilePageView extends StatefulView<EditProfilePage, _EditProfilePageState> {
  const _EditProfilePageView(super.state);

  @override
  Widget build(BuildContext context) {
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
      body: Form(
        key: state.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8.0),
            SizedBox(
              height: 200.h,
              width: 220.w,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 72.0,
                    backgroundColor: AppColors.fillColor,
                    backgroundImage: state.getAvatar(),
                  ),
                  Positioned(
                    right: 1.0,
                    bottom: 1.0,
                    child: MaterialButton(
                      minWidth: 0,
                      onPressed: state.changeAvatar,
                      color: AppColors.grey,
                      shape: const CircleBorder(
                        side: BorderSide(
                          color: Colors.white,
                          width: 3.0,
                        ),
                      ),
                      child: const Icon(
                        EditIcon.edit,
                        size: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextFormField(
                validator: FormValidators.nameValidator,
                controller: state.nameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: AppText.name.toUpperCase(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 18.0,
                horizontal: 24.0,
              ),
              child: TextFormField(
                validator: FormValidators.emailValidator,
                controller: state.emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: AppText.email.toUpperCase(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextFormField(
                validator: FormValidators.phoneValidator,
                controller: state.phoneNumberController,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  if (value.length >= 13) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: AppText.phoneNumber.toUpperCase(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Autocomplete<String>(
                initialValue: TextEditingValue(text: state.address ?? ''),
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return ['Asdsd', 'asdsfds', 'asdsdfgd'];
                },
                displayStringForOption: (option) =>
                    RawAutocomplete.defaultStringForOption(option),
                optionsViewBuilder: (context, onSelected, options) =>
                    ListView(children: options.map((e) => Text(e)).toList()),
                onSelected: (option) => Container(),
                fieldViewBuilder: (
                  context,
                  textEditingController,
                  focusNode,
                  onFieldSubmitted,
                ) =>
                    TextFormField(
                  // initialValue: state.address,
                  scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  controller: textEditingController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: AppText.location.toUpperCase(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GradientButton(
                height: AppDimens.kButtonHeight,
                width: 1.sw,
                onPressed: state.saveChanges,
                child: Text(
                  AppText.saveChanges.toUpperCase(),
                  style: AppTextStyle.buttonStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
