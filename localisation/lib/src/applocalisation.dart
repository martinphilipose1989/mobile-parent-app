import 'package:flutter/cupertino.dart';

class AppLocalizations {
  final Locale locale;
  Map<String, String> _jsonText = {};

  AppLocalizations(this.locale);

  String jsonFileUrl =
      "https://shared-infra-production-translationsbucket-190qcd2p71v5j.s3.eu-central-1.amazonaws.com/staging/yaya/";

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
    'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  //Call the api to download the json based on the current language selected and load into the map for future use.



}