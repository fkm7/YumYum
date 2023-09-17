import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CardFormatter extends TextInputFormatter {
  CardFormatter({required this.separator});

  final String separator;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue,) {
    var oldS = oldValue.text;
    var newS = newValue.text;
    var endsWithSeparator = false;

    // if you add text
    if (newS.length > oldS.length) {
      for (var char in separator.characters) {
        if (newS.substring(0, newS.length - 1).endsWith(char)) {
          endsWithSeparator = true;
        }
      }
      if (kDebugMode) {
        print(
            'Ends with separator: $endsWithSeparator, so we will add it with next digit.',);
      }

      var clean = newS.replaceAll(separator, '');
      if (kDebugMode) {
        print('CLEAN add: $clean');
      }
      if (!endsWithSeparator && clean.length > 1 && clean.length % 4 == 1) {
        return newValue.copyWith(
          text: newS.substring(0, newS.length - 1) + separator + newS.characters.last,
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + separator.length,
          ),
        );
      }
    }

    // if you delete text
    if (newS.length < oldS.length) {
      for (var char in separator.characters) {
        if (oldS.substring(0, oldS.length - 1).endsWith(char)) {
          endsWithSeparator = true;
        }
      }
      if (kDebugMode) {
        print('Ends with separator: $endsWithSeparator, so we removed it');
      }

      var clean = oldS.substring(0, oldS.length - 1).replaceAll(separator, '');
      if (kDebugMode) {
        print('CLEAN remove: $clean');
      }
      if (endsWithSeparator && clean.isNotEmpty && clean.length % 4 == 0) {
        return newValue.copyWith(
          text: newS.substring(0, newS.length - separator.length),
          selection: TextSelection.collapsed(
            offset: newValue.selection.end - separator.length,
          ),
        );
      }
    }

    return newValue;
  }
}

class CardExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String formattedExpiryDate = _formatCardExpiryDate(newValue.text);
    return newValue.copyWith(
      text: formattedExpiryDate,
      selection: _updateCursorPosition(
        newValue,
        formattedExpiryDate,
      ),
    );
  }

  String _formatCardExpiryDate(String expiryDate) {
    // Remove any whitespace from the expiry date string
    expiryDate = expiryDate.replaceAll(' ', '');

    // Check if the expiry date is empty or has fewer than 2 characters
    if (expiryDate.isEmpty || expiryDate.length < 2) {
      return expiryDate;
    }

    // Get the first character (month) and the remaining characters (year)
    String firstCharacter = expiryDate[0];
    String remainingCharacters = expiryDate.substring(1);

    // Check if the first character is greater than '1'
    if (firstCharacter.compareTo('1') > 0) {
      // Add a leading zero to the month
      firstCharacter = '0$firstCharacter';
    }

    // Concatenate the formatted month and year with '/'
    return '$firstCharacter/$remainingCharacters';
  }

  TextSelection _updateCursorPosition(
      TextEditingValue newValue, String formattedExpiryDate,) {
    // Preserve the cursor position based on the length of the formatted expiry date
    final int selectionIndex = newValue.selection.end;
    return TextSelection.collapsed(
        offset: _getCursorPosition(selectionIndex, formattedExpiryDate),);
  }

  int _getCursorPosition(int selectionIndex, String formattedExpiryDate) {
    // Calculate the cursor position based on the formatted expiry date
    final int unformattedLength =
        formattedExpiryDate.length - formattedExpiryDate.replaceAll('/', '').length;
    return selectionIndex + unformattedLength;
  }
}


// class CardExpireDateInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     final oldText = oldValue.text;
//     final newText = newValue.text;
//     final buffer = StringBuffer();
//     final regExp1 = RegExp(r'[2-9]');
//     final regExp2 = RegExp(r'[3-9]');
//     if (newValue.selection.baseOffset == 0) {
//       return newValue;
//     }
//     if (newValue.selection.baseOffset == 1 && regExp1.hasMatch(newText)) {
//       buffer.write('0');
//     }
//     if (newValue.selection.baseOffset == 2 && regExp2.hasMatch(newText[1])) {
//       buffer.write(oldValue);
//       buffer.write('2');
//     }
//     for (int i = 0; i < newText.length; i++) {
//       buffer.write(newText[i]);
//       var nonZeroIndex = i + 1;
//       if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
//         buffer.write('/');
//       }
//     }
//     var string = buffer.toString();
//     return newValue.copyWith(
//       text: string,
//       selection: TextSelection.collapsed(offset: string.length),
//     );
//   }
// }
