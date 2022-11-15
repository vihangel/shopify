import 'package:flutter/widgets.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class I18nHelper {
  static String translate(
    final BuildContext context,
    final String key, {
    final Map<String, String>? params,
    final int? quantity,
  }) {
    if (quantity != null) {
      return FlutterI18n.plural(context, key, quantity);
    }

    return FlutterI18n.translate(context, key, translationParams: params);
  }
}
