import 'package:elmashriqtestapp/localization/locales.dart';
import 'package:flutter/cupertino.dart';

String getTranslated(BuildContext ctx, String key) {
  return DemoLocalizations.of(ctx).getTranslatedValue(key);
}
