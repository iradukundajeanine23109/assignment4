import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = locale.countryCode?.isEmpty ?? false ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S._current = S();
      return S._current!;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  // Add your localization keys and methods here
  String get title {
    return Intl.message(
      'Hello World',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  String get message {
    return Intl.message(
      'Welcome to Flutter',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  String get contacts {
    return Intl.message(
      'Contacts',
      name: 'contacts',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return <String>['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<S> load(Locale locale) {
    return S.load(locale);
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) {
    return false;
  }

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('en', ''), // English
      Locale('es', ''), // Spanish
    ];
  }
}
