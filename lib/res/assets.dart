import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  static void preLoad(BuildContext context) {
    precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, AppAssets.bag),
        context,);
    precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, AppAssets.wave),
        context,);
    precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, AppAssets.burger),
        context,);
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder, AppAssets.keyAssets,),
        context,);
    precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, AppAssets.google),
        context,);
    precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, AppAssets.failed),
        context,);
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder, AppAssets.twitter,),
        context,);
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder, AppAssets.success,),
        context,);
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder, AppAssets.facebook,),
        context,);
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder, AppAssets.dumpling,),
        context,);
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder, AppAssets.clipboard,),
        context,);
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder, AppAssets.waveLarge,),
        context,);
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder, AppAssets.horizontalWave,),
        context,);
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder, AppAssets.creditCard,),
        context,);
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder, AppAssets.splashWave,),
        context,);
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder, AppAssets.firstIntro,),
        context,);
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder, AppAssets.thirdIntro,),
        context,);
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder, AppAssets.secondIntro,),
        context,);
    precacheImage(const AssetImage(logo), context);
    precacheImage(const AssetImage(offer), context);
    precacheImage(const AssetImage(avatar), context);
    precacheImage(const AssetImage(paypal), context);
  }

  static const String bag = 'assets/images/bag.svg';
  static const String wave = 'assets/images/wave.svg';
  static const String burger = 'assets/icons/burger.svg';
  static const String keyAssets = 'assets/images/key.svg';
  static const String google = 'assets/images/google.svg';
  static const String failed = 'assets/images/failed.svg';
  static const String twitter = 'assets/images/twitter.svg';
  static const String success = 'assets/images/success.svg';
  static const String facebook = 'assets/images/facebook.svg';
  static const String dumpling = 'assets/images/dumpling.svg';
  static const String clipboard = 'assets/images/clipboard.svg';
  static const String waveLarge = 'assets/images/wave_large.svg';
  static const String horizontalWave = 'assets/images/waves.svg';
  static const String creditCard = 'assets/images/credit-card.svg';
  static const String splashWave = 'assets/images/splash_wave.svg';
  static const String firstIntro = 'assets/images/first_intro.svg';
  static const String thirdIntro = 'assets/images/third_intro.svg';
  static const String secondIntro = 'assets/images/second_intro.svg';

  static const String logo = 'assets/images/logo.png';
  static const String offer = 'assets/images/offer.png';
  static const String avatar = 'assets/images/user.png';
  static const String paypal = 'assets/images/paypal.png';
}
