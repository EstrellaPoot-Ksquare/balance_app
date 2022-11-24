import 'package:balance_app/constants/constants.dart';
import 'package:flutter/material.dart';

class Validator {
  static bool isValidForm(GlobalKey<FormState> formKey) {
    return formKey.currentState?.validate() ?? false;
  }

  static String? validateStringNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return AppString.requiredField;
    }
    return null;
  }

  static String? validateStringNotEmptyAndNumber(String? value) {
    if (value == null || value.isEmpty) {
      return AppString.requiredField;
    } else {
      if (double.tryParse(value) == null) {
        return AppString.numberRequired;
      }
    }
    return null;
  }
}
