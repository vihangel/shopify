import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shopify/shared/i18n/i18n_helper.dart';

class StringUtils {
  final regexEmail = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  static String enumName(String enumToString) {
    List<String> paths = enumToString.split(".");
    return paths[paths.length - 1];
  }

  static String onlyNumber(String str) {
    final numberRegex = RegExp(r'[0-9]', multiLine: true);
    String strOnlyNumber = '';
    Iterable matches = numberRegex.allMatches(str);
    for (var match in matches) {
      strOnlyNumber += str.substring(match.start, match.end);
    }
    return strOnlyNumber;
  }

  /// Truncate text with size
  static String? truncate(String? string, int size) {
    if (string == null) {
      return null;
    } else {
      final end = string.length <= size ? string.length : size;

      return string.substring(0, end);
    }
  }

  static bool validateEmail(String value) {
    return RegExp(
                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
            .hasMatch(value) &&
        !value.contains(' ') &&
        _validateLastEmailPart(value) &&
        validateDomainEmail(value);
  }

  static bool validateDomainEmail(String value) {
    final parsedEmail = value.split('@');
    final afterAt = parsedEmail.elementAt(1);
    if (afterAt.isEmpty) return false;

    final contentForValidation = afterAt.split('.');

    for (var i = 0; i < contentForValidation.length; i++) {
      final results = contentForValidation
          .where((element1) => contentForValidation.elementAt(i) == element1);
      if (results.length > 1) {
        return false;
      }
    }

    return true;
  }

  /// Valida telefone no formato (##) ####-####
  static bool validatePhoneNumber(value) {
    final List<String> splitNumber = value.split(' ');
    if (splitNumber.length > 4 && splitNumber[1] != '9') {
      return false;
    }
    if ((splitNumber.length > 4 && splitNumber.join('').length < 14) &&
        splitNumber[1] == '9') {
      return false;
    }
    if (splitNumber.length >= 4 && splitNumber.length <= 4) {
      String part1 = splitNumber[1];
      String part2 = splitNumber[3];
      if (part1 == '0000' && part2 == '0000') {
        return false;
      }
    } else if (splitNumber.length >= 5) {
      String part1 = splitNumber[2];
      String part2 = splitNumber[4];
      if (part1 == '0000' && part2 == '0000') {
        return false;
      }
    }

    return true;
  }

  static bool _validateLastEmailPart(String value) {
    if (value.indexOf('.') > 0) {
      final parts = value.split('.');

      final last = parts[parts.length - 1];

      if (last.length > 3) return false;
      return RegExp(r"^[a-z]{2,3}").hasMatch(last);
    }

    return false;
  }

  static bool validateCpf(String strCPF) {
    if (strCPF.length < 11) return false;
    int soma = 0;
    int resto = 0;
    soma = 0;
    if (strCPF == "00000000000" ||
        strCPF == "11111111111" ||
        strCPF == "22222222222" ||
        strCPF == "3333333333" ||
        strCPF == "44444444444" ||
        strCPF == "55555555555" ||
        strCPF == "66666666666" ||
        strCPF == "77777777777" ||
        strCPF == "88888888888" ||
        strCPF == "99999999999") {
      return false;
    }

    for (int i = 1; i <= 9; i++) {
      soma = soma + int.parse(strCPF.substring(i - 1, i)) * (11 - i);
    }
    resto = (soma * 10) % 11;

    if ((resto == 10) || (resto == 11)) resto = 0;
    if (resto != int.parse(strCPF.substring(9, 10))) return false;

    soma = 0;
    for (int i = 1; i <= 10; i++) {
      soma = soma + int.parse(strCPF.substring(i - 1, i)) * (12 - i);
    }
    resto = (soma * 10) % 11;

    if ((resto == 10) || (resto == 11)) resto = 0;
    if (resto != int.parse(strCPF.substring(10, 11))) {
      return false;
    } else {
      return true;
    }
  }

  static String formatMonth(int mes) {
    return mes < 13 && mes > 0
        ? [
            'Janeiro',
            'Fevereiro',
            'Março',
            'Abril',
            'Maio',
            'Junho',
            'Julho',
            'Agosto',
            'Setembro',
            'Outubro',
            'Novembro',
            'Dezembro'
          ][mes - 1]
        : '';
  }

  static String formatMonthTranslated(BuildContext context, int month) {
    List<String> months = [
      'january',
      'february',
      'march',
      'april',
      'may',
      'june',
      'july',
      'august',
      'september',
      'october',
      'november',
      'december'
    ];
    return I18nHelper.translate(context, 'common.months.${months[month - 1]}');
  }

  static String removeDiactrics(String input) {
    final matchRE = RegExp(r"[ÁÀÃÂáàãâÉÈÊéèêÍÌÎíìîÓÒÔÕóòôõÚÙÛúùûçÇ]");
    final replacementMap = Map.fromIterables(
        "ÁÀÃÂáàãâÉÈÊéèêÍÌÎíìîÓÒÔÕóòôõÚÙÛúùûçÇ".split(""),
        "AAAAaaaaEEEeeeEEEiiiOOOOooooUUUuuucC".split(""));

    return input.replaceAllMapped(matchRE, (m) => replacementMap[m[0]!]!);
  }

  static String removeSpecialChars(String input) {
    return input.replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  static String removeSpecialCharsAndSpaces(String input) {
    return StringUtils.removeSpecialChars(input.replaceAll(' ', ''));
  }

  static String monthAndYear(String input) {
    final year = input.substring(0, 4);

    final month = input.substring(4);

    return '$month/$year';
  }

  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  static String? objectToString(Object number) {
    if (number is String) {
      return number;
    } else if (number is num) {
      return number.toString();
    }
    return null;
  }

  static String sanitizeString(String raw) {
    return raw
        .replaceAll(')', '')
        .replaceAll('(', '')
        .replaceAll('-', '')
        .replaceAll('_', '')
        .replaceAll(' ', '');
  }

  static String formatedCpf(String cpf) {
    final cpfFormatter = MaskTextInputFormatter(
        mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
    return cpfFormatter.maskText(cpf);
  }

  static bool compareNames(String? fullName, String search) {
    if (fullName == null || fullName.isEmpty || search.isEmpty) return false;
    final List<String> fullNameSplitted = fullName.split(" ");
    final List<String> searchSplitted = search.trim().split(" ");
    int matches = 0;

    for (final searchPart in searchSplitted) {
      for (var name in fullNameSplitted) {
        if (name.toUpperCase().contains(searchPart.toUpperCase())) {
          matches++;
        }
      }
    }

    return searchSplitted.length == matches;
  }

  static String formateBirthBR(value) {
    return DateFormat('y-MM-dd').format(DateFormat('dd/MM/y').parse(value));
  }

  static MaskTextInputFormatter formatedBirth() {
    return MaskTextInputFormatter(
        mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  }

  static MaskTextInputFormatter formatedCep() {
    return MaskTextInputFormatter(
        mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});
  }

  static MaskTextInputFormatter formatedPhone() {
    return MaskTextInputFormatter(
        mask: '(##) ####-####', filter: {"#": RegExp(r'[0-9]')});
  }

  static String? validateFiedlNull(value) {
    if (value == null || value.isEmpty) {
      return "Este campo não pode ser vazio";
    }
    return null;
  }

  /// Valida telefone no formato (##) ####-####
  static String? validatePhoneNumberField(value) {
    final List<String> splitNumber = value.split(' ');
    if (splitNumber.length > 4 && splitNumber[1] != '9') {
      return "Numero de telefone inválido";
    }
    if ((splitNumber.length > 4 && splitNumber.join('').length < 14) &&
        splitNumber[1] == '9') {
      return "Numero de telefone inválido";
    }
    if (splitNumber.length >= 4 && splitNumber.length <= 4) {
      String part1 = splitNumber[1];
      String part2 = splitNumber[3];
      if (part1 == '0000' && part2 == '0000') {
        return "Numero de telefone inválido";
      }
    } else if (splitNumber.length >= 5) {
      String part1 = splitNumber[2];
      String part2 = splitNumber[4];
      if (part1 == '0000' && part2 == '0000') {
        return "Numero de telefone inválido";
      }
    }

    return null;
  }

  static String? validateFieldCpf(String? strCPF) {
    if (strCPF == null || strCPF.isEmpty) {
      return "Este campo não pode ser vazio";
    }

    strCPF = strCPF.replaceAll(RegExp(r'[^\w\s]+'), '');

    if (strCPF.length < 11) return "CPF inválido";
    int soma = 0;
    int resto = 0;
    soma = 0;
    if (strCPF == "00000000000" ||
        strCPF == "11111111111" ||
        strCPF == "22222222222" ||
        strCPF == "3333333333" ||
        strCPF == "44444444444" ||
        strCPF == "55555555555" ||
        strCPF == "66666666666" ||
        strCPF == "77777777777" ||
        strCPF == "88888888888" ||
        strCPF == "99999999999") {
      return "CPF inválido";
    }

    for (int i = 1; i <= 9; i++) {
      soma = soma + int.parse(strCPF.substring(i - 1, i)) * (11 - i);
    }
    resto = (soma * 10) % 11;

    if ((resto == 10) || (resto == 11)) resto = 0;
    if (resto != int.parse(strCPF.substring(9, 10))) return "CPF inválido";

    soma = 0;
    for (int i = 1; i <= 10; i++) {
      soma = soma + int.parse(strCPF.substring(i - 1, i)) * (12 - i);
    }
    resto = (soma * 10) % 11;

    if ((resto == 10) || (resto == 11)) resto = 0;
    if (resto != int.parse(strCPF.substring(10, 11))) {
      return "CPF inválido";
    } else {
      return null;
    }
  }

  /// Formato com 16 dígitos. Ex: 0630020062564382
  static String formatCarteira16Numbers({
    required int unimedCarteira,
    required int codCarteira,
    digitoCarteira,
  }) {
    final part1 = '$unimedCarteira'.padLeft(3, '0');
    final part2 = '$codCarteira'.padLeft(12, '0');
    return '$part1$part2${digitoCarteira ?? "0"}';
  }
}
