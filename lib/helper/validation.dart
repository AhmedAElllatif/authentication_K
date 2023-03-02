import 'package:get/get_utils/get_utils.dart';
import 'package:poffeh_app/utility/all_app_words.dart';
import 'package:poffeh_app/utility/reg_exp.dart';
import 'arabic_to_english_number.dart';
enum TextFieldvalidatorType {
  Email,
  RegisterEmail,
  Password,
  ConfirmPassword,
  PhoneNumber,
  NormalText,
  Code,
  Number,
  Name,
  DisplayText,
  Optional,
  IdNumberSudia,
  IdNumberNotSudia,
}

validation(
    {required TextFieldvalidatorType type,
      required String value,
      required String firstPAsswordForConfirm}) {
  if (type == TextFieldvalidatorType.PhoneNumber) {
    if (value.isEmpty) {
      return 'Must not be empty';
    } else if (value.length != 10) {
      return 'Must not be less than 10';
    } else if (!regExpPhone.hasMatch(value.arabicNumberToEnglish)) {
      return 'Not Correct';
    }
    return null;
  } else if (type == TextFieldvalidatorType.Email) {
    if (value.isEmpty) {
      return 'Must not be empty';
    } else if (!regExpEmail.hasMatch(value)) {
      return 'Not Correct';
    } else {
      return null;
    }
  } else if (type == TextFieldvalidatorType.RegisterEmail) {
    if (value.isEmpty) {
      return;
    } else if (!regExpEmail.hasMatch(value)) {
      return 'Not Correct';
    } else {
      return null;
    }
  } else if (type == TextFieldvalidatorType.IdNumberSudia) {


    if (value.isEmpty) {
      return 'Must not be empty';
    } else if (!value.startsWith('1')) {
      return 'Not Correct';
    }else if (value.length < 10) {
      return 'Must not be less than 10';
    } else {
      return null;
    }
  }

  else if (type == TextFieldvalidatorType.IdNumberNotSudia) {

    if (value.isEmpty) {
      return 'Must not be empty';
    } else if (!value.startsWith('2')) {
      return 'Not Correct';
    }else if (value.length < 10) {
      return'Must not be less than 10';
    }else   {
      return null;
    }
  }

  else if (type == TextFieldvalidatorType.Password) {
    if (value.isEmpty) {
      return 'Must not be empty';
    } else if (value.length < 6) {
      return 'Must not be less than 6';
    } else if (value.length > 30) {
      return 'Must not be more than 30';
    } else
      return null;
  } else if (type == TextFieldvalidatorType.ConfirmPassword) {
    if (value.isEmpty) {
      return 'Must not be empty';
    } else if (value != firstPAsswordForConfirm) {
      return 'Not Correct';
    } else {
      return null;
    }
  } else if (type == TextFieldvalidatorType.Code) {
    if (value.isEmpty) {
      return 'Must not be empty';
    }
  } else if (type == TextFieldvalidatorType.Optional) {
    return null;
  } else if (type == TextFieldvalidatorType.Number) {
    if (value.isEmpty) {
      return 'Must not be empty';
    }
    if (value.length != 10) {
      return 'Must not be equal than 10';
    }
    if (!regExpNumber.hasMatch(value.trim().replaceAll('‎', ''))) {
      return 'Not Correct';
    }
  } else if (type == TextFieldvalidatorType.DisplayText) {
    if (value.isEmpty) {
      return 'Must not be empty';
    }
    if (value.length<2)
    {
      return 'Must not be less than 2';
    }
  } else if (type == TextFieldvalidatorType.Name) {
    if (value.isEmpty) {
      return 'Must not be empty';
    }
    if (value.length<2)
    {
      return 'Must not be empty';
    }
    if (value.length>20)
    {
      return 'Must not be empty';
    }

    if (!regExpName.hasMatch(value.trim().replaceAll('‎', ''))) {
      return 'Not Correct';
    }

    return null;
  } else {
    if (value.isEmpty) {
      return 'Must not be empty';
    }
    if (value.length < 2) {
      return 'Must not be less than 2';
    }

    return null;
  }
}
