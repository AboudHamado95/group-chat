import 'package:flutter/material.dart';

extension Dimensions on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;

  //
  double get pageView => screenHeight / 2.64;
  double get pageViewContainer => screenHeight / 3.84;
  double get pageViewTextContainer => screenHeight / 6.03;

  //Dynamic height padding and margin
  double get height10 => screenHeight / 84.4;
  double get height15 => screenHeight / 56.27;
  double get height20 => screenHeight / 42.2;
  double get height30 => screenHeight / 28.13;
  double get height45 => screenHeight / 18.76;

  //Dynamic width padding and margin
  double get width10 => screenHeight / 84.4;
  double get width15 => screenHeight / 56.27;
  double get width20 => screenHeight / 42.2;
  double get width30 => screenHeight / 28.13;

  //Font size
  double get font16 => screenHeight / 52.75;
  double get font20 => screenHeight / 42.2;
  double get font26 => screenHeight / 32.46;

  //Radius
  double get radius15 => screenHeight / 56.24;
  double get radius20 => screenHeight / 42.2;
  double get radius30 => screenHeight / 28.3;

  //Icon size
  double get iconsSize16 => screenHeight / 52.57;
  double get iconsSize20 => screenHeight / 42.57;
  double get iconsSize24 => screenHeight / 35.17;

  //List view size
  double get listViewImgSize => screenWidth / 3.25;
  double get listViewTextContSize => screenWidth / 3.9;

  //Popular food
  double get popularFoodImgSize => screenHeight / 2.41;

  //Bottom height
  double get bottomHeightBar => screenHeight / 7.03;

  //Splash screen dimensions
  double get splashImg => screenHeight / 3.38;
}
