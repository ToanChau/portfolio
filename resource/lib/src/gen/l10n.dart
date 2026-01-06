// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `An unknown network error occurred.`
  String get failure_network_unknown {
    return Intl.message(
      'An unknown network error occurred.',
      name: 'failure_network_unknown',
      desc: '',
      args: [],
    );
  }

  /// `An unknown server error occurred.`
  String get failure_server_unknown {
    return Intl.message(
      'An unknown server error occurred.',
      name: 'failure_server_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Failed to connect to the server.`
  String get failure_connection {
    return Intl.message(
      'Failed to connect to the server.',
      name: 'failure_connection',
      desc: '',
      args: [],
    );
  }

  /// `Request timed out while sending data.`
  String get failure_send_timeout {
    return Intl.message(
      'Request timed out while sending data.',
      name: 'failure_send_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Connection timed out.`
  String get failure_connection_timeout {
    return Intl.message(
      'Connection timed out.',
      name: 'failure_connection_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Request timed out while receiving data.`
  String get failure_receive_timeout {
    return Intl.message(
      'Request timed out while receiving data.',
      name: 'failure_receive_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Bad request. Please check your input.`
  String get failure_bad_request {
    return Intl.message(
      'Bad request. Please check your input.',
      name: 'failure_bad_request',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized access. Please log in.`
  String get failure_unauthorized {
    return Intl.message(
      'Unauthorized access. Please log in.',
      name: 'failure_unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `You do not have permission to access this resource.`
  String get failure_forbidden {
    return Intl.message(
      'You do not have permission to access this resource.',
      name: 'failure_forbidden',
      desc: '',
      args: [],
    );
  }

  /// `Requested resource was not found.`
  String get failure_not_found {
    return Intl.message(
      'Requested resource was not found.',
      name: 'failure_not_found',
      desc: '',
      args: [],
    );
  }

  /// `This method is not allowed.`
  String get failure_method_not_allowed {
    return Intl.message(
      'This method is not allowed.',
      name: 'failure_method_not_allowed',
      desc: '',
      args: [],
    );
  }

  /// `The request is not acceptable.`
  String get failure_not_acceptable {
    return Intl.message(
      'The request is not acceptable.',
      name: 'failure_not_acceptable',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error. Please try again later.`
  String get failure_internal_server {
    return Intl.message(
      'Internal server error. Please try again later.',
      name: 'failure_internal_server',
      desc: '',
      args: [],
    );
  }

  /// `An unknown HTTP error occurred.`
  String get failure_http_unknown {
    return Intl.message(
      'An unknown HTTP error occurred.',
      name: 'failure_http_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Failed to parse the response.`
  String get failure_parser {
    return Intl.message(
      'Failed to parse the response.',
      name: 'failure_parser',
      desc: '',
      args: [],
    );
  }

  /// `You are not logged in. Please log in to continue.`
  String get failure_not_login {
    return Intl.message(
      'You are not logged in. Please log in to continue.',
      name: 'failure_not_login',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with {method}`
  String continue_with(Object method) {
    return Intl.message(
      'Sign in with $method',
      name: 'continue_with',
      desc: '',
      args: [method],
    );
  }

  /// `Apple`
  String get apple {
    return Intl.message('Apple', name: 'apple', desc: '', args: []);
  }

  /// `Google`
  String get google {
    return Intl.message('Google', name: 'google', desc: '', args: []);
  }

  /// `Sign in`
  String get sign_in {
    return Intl.message('Sign in', name: 'sign_in', desc: '', args: []);
  }

  /// `Use phone number`
  String get use_phone_to_sign_in {
    return Intl.message(
      'Use phone number',
      name: 'use_phone_to_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `continue`
  String get continue_key {
    return Intl.message('continue', name: 'continue_key', desc: '', args: []);
  }

  /// `phone number`
  String get phone_number {
    return Intl.message(
      'phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Activities`
  String get activities {
    return Intl.message('Activities', name: 'activities', desc: '', args: []);
  }

  /// `Promos`
  String get promo {
    return Intl.message('Promos', name: 'promo', desc: '', args: []);
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Qr code`
  String get qr_code {
    return Intl.message('Qr code', name: 'qr_code', desc: '', args: []);
  }

  /// `Session expired`
  String get session_expired {
    return Intl.message(
      'Session expired',
      name: 'session_expired',
      desc: '',
      args: [],
    );
  }

  /// `Please log in again`
  String get login_again {
    return Intl.message(
      'Please log in again',
      name: 'login_again',
      desc: '',
      args: [],
    );
  }

  /// `List is clear. Let’s make some chaos!`
  String get todo_empty {
    return Intl.message(
      'List is clear. Let’s make some chaos!',
      name: 'todo_empty',
      desc: '',
      args: [],
    );
  }

  /// `What’s your next challenge?`
  String get todo_title {
    return Intl.message(
      'What’s your next challenge?',
      name: 'todo_title',
      desc: '',
      args: [],
    );
  }

  /// `Briefly describe the task so you can crush it!`
  String get todo_desciption {
    return Intl.message(
      'Briefly describe the task so you can crush it!',
      name: 'todo_desciption',
      desc: '',
      args: [],
    );
  }

  /// `Let's Gooooo`
  String get let_go {
    return Intl.message('Let\'s Gooooo', name: 'let_go', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
