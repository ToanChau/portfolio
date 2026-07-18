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

  /// `Home`
  String get menu_home {
    return Intl.message('Home', name: 'menu_home', desc: '', args: []);
  }

  /// `About`
  String get menu_about {
    return Intl.message('About', name: 'menu_about', desc: '', args: []);
  }

  /// `Experience`
  String get menu_experience {
    return Intl.message(
      'Experience',
      name: 'menu_experience',
      desc: '',
      args: [],
    );
  }

  /// `Skills`
  String get menu_skills {
    return Intl.message('Skills', name: 'menu_skills', desc: '', args: []);
  }

  /// `Projects`
  String get menu_projects {
    return Intl.message('Projects', name: 'menu_projects', desc: '', args: []);
  }

  /// `Available for opportunities`
  String get available_for_opportunities {
    return Intl.message(
      'Available for opportunities',
      name: 'available_for_opportunities',
      desc: '',
      args: [],
    );
  }

  /// `Hi, I'm`
  String get hi_im {
    return Intl.message('Hi, I\'m', name: 'hi_im', desc: '', args: []);
  }

  /// `Mobile Developer specializing in Flutter, Clean Architecture & BLoC Pattern. Building beautiful, scalable apps.`
  String get hero_description {
    return Intl.message(
      'Mobile Developer specializing in Flutter, Clean Architecture & BLoC Pattern. Building beautiful, scalable apps.',
      name: 'hero_description',
      desc: '',
      args: [],
    );
  }

  /// `Projects`
  String get stat_projects {
    return Intl.message('Projects', name: 'stat_projects', desc: '', args: []);
  }

  /// `Teams Led`
  String get stat_teams_led {
    return Intl.message(
      'Teams Led',
      name: 'stat_teams_led',
      desc: '',
      args: [],
    );
  }

  /// `Prize Winner`
  String get stat_prize_winner {
    return Intl.message(
      'Prize Winner',
      name: 'stat_prize_winner',
      desc: '',
      args: [],
    );
  }

  /// `View Project`
  String get view_project {
    return Intl.message(
      'View Project',
      name: 'view_project',
      desc: '',
      args: [],
    );
  }

  /// `Get in Touch`
  String get get_in_touch {
    return Intl.message(
      'Get in Touch',
      name: 'get_in_touch',
      desc: '',
      args: [],
    );
  }

  /// `Download CV`
  String get download_cv {
    return Intl.message('Download CV', name: 'download_cv', desc: '', args: []);
  }

  /// `About Me`
  String get tag_about_me {
    return Intl.message('About Me', name: 'tag_about_me', desc: '', args: []);
  }

  /// `Who I Am`
  String get who_i_am {
    return Intl.message('Who I Am', name: 'who_i_am', desc: '', args: []);
  }

  /// `Passionate about creating beautiful, functional mobile applications`
  String get about_subtitle {
    return Intl.message(
      'Passionate about creating beautiful, functional mobile applications',
      name: 'about_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Developer`
  String get flutter_developer {
    return Intl.message(
      'Flutter Developer',
      name: 'flutter_developer',
      desc: '',
      args: [],
    );
  }

  /// `I'm a passionate Flutter developer with a strong foundation in Clean Architecture and BLoC pattern. I love building beautiful, scalable mobile applications that provide great user experiences.`
  String get about_description {
    return Intl.message(
      'I\'m a passionate Flutter developer with a strong foundation in Clean Architecture and BLoC pattern. I love building beautiful, scalable mobile applications that provide great user experiences.',
      name: 'about_description',
      desc: '',
      args: [],
    );
  }

  /// `Thu Duc, Ho Chi Minh City, Vietnam`
  String get address {
    return Intl.message(
      'Thu Duc, Ho Chi Minh City, Vietnam',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Experience`
  String get tag_experience {
    return Intl.message(
      'Experience',
      name: 'tag_experience',
      desc: '',
      args: [],
    );
  }

  /// `Work Experience`
  String get work_experience {
    return Intl.message(
      'Work Experience',
      name: 'work_experience',
      desc: '',
      args: [],
    );
  }

  /// `What I've been building professionally`
  String get experience_subtitle {
    return Intl.message(
      'What I\'ve been building professionally',
      name: 'experience_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Products I worked on`
  String get products_i_worked_on {
    return Intl.message(
      'Products I worked on',
      name: 'products_i_worked_on',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Developer`
  String get role_flutter_dev {
    return Intl.message(
      'Flutter Developer',
      name: 'role_flutter_dev',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Developer Intern`
  String get role_flutter_intern {
    return Intl.message(
      'Flutter Developer Intern',
      name: 'role_flutter_intern',
      desc: '',
      args: [],
    );
  }

  /// `02/2026 — Present`
  String get period_longvan {
    return Intl.message(
      '02/2026 — Present',
      name: 'period_longvan',
      desc: '',
      args: [],
    );
  }

  /// `06/2025 — 09/2025`
  String get period_ailogy {
    return Intl.message(
      '06/2025 — 09/2025',
      name: 'period_ailogy',
      desc: '',
      args: [],
    );
  }

  /// `Monorepo Architecture`
  String get hl_monorepo_title {
    return Intl.message(
      'Monorepo Architecture',
      name: 'hl_monorepo_title',
      desc: '',
      args: [],
    );
  }

  /// `Managed a Melos monorepo for 3 production apps (SaleOne, DoctorHub, Longvan Wellness). Built reusable core packages distributed via private GitLab, accelerating cross-app development.`
  String get hl_monorepo_desc {
    return Intl.message(
      'Managed a Melos monorepo for 3 production apps (SaleOne, DoctorHub, Longvan Wellness). Built reusable core packages distributed via private GitLab, accelerating cross-app development.',
      name: 'hl_monorepo_desc',
      desc: '',
      args: [],
    );
  }

  /// `Auth & Tooling`
  String get hl_auth_title {
    return Intl.message(
      'Auth & Tooling',
      name: 'hl_auth_title',
      desc: '',
      args: [],
    );
  }

  /// `Implemented complex authentication flows (OAuth, native Apple Sign-in) with GraphQL. Engineered a custom Dart CLI generator to automatically scaffold design systems.`
  String get hl_auth_desc {
    return Intl.message(
      'Implemented complex authentication flows (OAuth, native Apple Sign-in) with GraphQL. Engineered a custom Dart CLI generator to automatically scaffold design systems.',
      name: 'hl_auth_desc',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Web & JS Interop`
  String get hl_web_title {
    return Intl.message(
      'Flutter Web & JS Interop',
      name: 'hl_web_title',
      desc: '',
      args: [],
    );
  }

  /// `Developed a JS bridge library enabling Flutter Web mini-apps to run seamlessly within external WebViews (ViettelMoney).`
  String get hl_web_desc {
    return Intl.message(
      'Developed a JS bridge library enabling Flutter Web mini-apps to run seamlessly within external WebViews (ViettelMoney).',
      name: 'hl_web_desc',
      desc: '',
      args: [],
    );
  }

  /// `DevOps & Release`
  String get hl_devops_title {
    return Intl.message(
      'DevOps & Release',
      name: 'hl_devops_title',
      desc: '',
      args: [],
    );
  }

  /// `Set up GitLab CI/Kaniko pipelines and Nginx caching. Configured Shorebird for Over-The-Air (OTA) updates. Published apps to the App Store and Google Play with strict guideline compliance, and configured APNs push notifications.`
  String get hl_devops_desc {
    return Intl.message(
      'Set up GitLab CI/Kaniko pipelines and Nginx caching. Configured Shorebird for Over-The-Air (OTA) updates. Published apps to the App Store and Google Play with strict guideline compliance, and configured APNs push notifications.',
      name: 'hl_devops_desc',
      desc: '',
      args: [],
    );
  }

  /// `Charge Services`
  String get hl_charge_title {
    return Intl.message(
      'Charge Services',
      name: 'hl_charge_title',
      desc: '',
      args: [],
    );
  }

  /// `Refactored the booking flow and product variants. Enhanced UI consistency with Fluent UI and optimized authentication and pagination with REST APIs.`
  String get hl_charge_desc {
    return Intl.message(
      'Refactored the booking flow and product variants. Enhanced UI consistency with Fluent UI and optimized authentication and pagination with REST APIs.',
      name: 'hl_charge_desc',
      desc: '',
      args: [],
    );
  }

  /// `Company Landing Page`
  String get hl_landing_title {
    return Intl.message(
      'Company Landing Page',
      name: 'hl_landing_title',
      desc: '',
      args: [],
    );
  }

  /// `Fixed performance bottlenecks to improve animations. Applied the Flame package to optimize image and video rendering on Flutter Web.`
  String get hl_landing_desc {
    return Intl.message(
      'Fixed performance bottlenecks to improve animations. Applied the Flame package to optimize image and video rendering on Flutter Web.',
      name: 'hl_landing_desc',
      desc: '',
      args: [],
    );
  }

  /// `Web app`
  String get tooltip_web_app {
    return Intl.message('Web app', name: 'tooltip_web_app', desc: '', args: []);
  }

  /// `App Store`
  String get tooltip_app_store {
    return Intl.message(
      'App Store',
      name: 'tooltip_app_store',
      desc: '',
      args: [],
    );
  }

  /// `Google Play`
  String get tooltip_google_play {
    return Intl.message(
      'Google Play',
      name: 'tooltip_google_play',
      desc: '',
      args: [],
    );
  }

  /// `Skills`
  String get tag_skills {
    return Intl.message('Skills', name: 'tag_skills', desc: '', args: []);
  }

  /// `Technical Expertise`
  String get technical_expertise {
    return Intl.message(
      'Technical Expertise',
      name: 'technical_expertise',
      desc: '',
      args: [],
    );
  }

  /// `Technologies and tools I work with`
  String get skills_subtitle {
    return Intl.message(
      'Technologies and tools I work with',
      name: 'skills_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Development`
  String get cat_mobile {
    return Intl.message(
      'Mobile Development',
      name: 'cat_mobile',
      desc: '',
      args: [],
    );
  }

  /// `Backend Development`
  String get cat_backend {
    return Intl.message(
      'Backend Development',
      name: 'cat_backend',
      desc: '',
      args: [],
    );
  }

  /// `Tools & DevOps`
  String get cat_tools {
    return Intl.message(
      'Tools & DevOps',
      name: 'cat_tools',
      desc: '',
      args: [],
    );
  }

  /// `Soft Skills`
  String get cat_soft {
    return Intl.message('Soft Skills', name: 'cat_soft', desc: '', args: []);
  }

  /// `Problem Solving`
  String get skill_problem_solving {
    return Intl.message(
      'Problem Solving',
      name: 'skill_problem_solving',
      desc: '',
      args: [],
    );
  }

  /// `Communication`
  String get skill_communication {
    return Intl.message(
      'Communication',
      name: 'skill_communication',
      desc: '',
      args: [],
    );
  }

  /// `Projects`
  String get tag_projects {
    return Intl.message('Projects', name: 'tag_projects', desc: '', args: []);
  }

  /// `Personal Projects`
  String get personal_projects {
    return Intl.message(
      'Personal Projects',
      name: 'personal_projects',
      desc: '',
      args: [],
    );
  }

  /// `Side projects I build outside of work`
  String get projects_subtitle {
    return Intl.message(
      'Side projects I build outside of work',
      name: 'projects_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Team Leader`
  String get badge_team_leader {
    return Intl.message(
      'Team Leader',
      name: 'badge_team_leader',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get action_code {
    return Intl.message('Code', name: 'action_code', desc: '', args: []);
  }

  /// `Demo`
  String get action_demo {
    return Intl.message('Demo', name: 'action_demo', desc: '', args: []);
  }

  /// `English vocabulary learning app with Tinder-like swipe gestures. Features offline-first architecture and AI-powered recommendations.`
  String get proj_cardwords_desc {
    return Intl.message(
      'English vocabulary learning app with Tinder-like swipe gestures. Features offline-first architecture and AI-powered recommendations.',
      name: 'proj_cardwords_desc',
      desc: '',
      args: [],
    );
  }

  /// `Mobile app for course management with AI-powered test creation using RAG + LLM technology.`
  String get proj_elearn_desc {
    return Intl.message(
      'Mobile app for course management with AI-powered test creation using RAG + LLM technology.',
      name: 'proj_elearn_desc',
      desc: '',
      args: [],
    );
  }

  /// `Building beautiful, scalable mobile apps.`
  String get footer_tagline {
    return Intl.message(
      'Building beautiful, scalable mobile apps.',
      name: 'footer_tagline',
      desc: '',
      args: [],
    );
  }

  /// `© 2026 Chau Duc Toan — Built with Flutter`
  String get footer_copyright {
    return Intl.message(
      '© 2026 Chau Duc Toan — Built with Flutter',
      name: 'footer_copyright',
      desc: '',
      args: [],
    );
  }

  /// `Thu Duc, Ho Chi Minh City`
  String get footer_address_short {
    return Intl.message(
      'Thu Duc, Ho Chi Minh City',
      name: 'footer_address_short',
      desc: '',
      args: [],
    );
  }

  /// `Switch to the classic dark design`
  String get tooltip_switch_classic {
    return Intl.message(
      'Switch to the classic dark design',
      name: 'tooltip_switch_classic',
      desc: '',
      args: [],
    );
  }

  /// `Switch to the neo-brutalism design`
  String get tooltip_switch_brutal {
    return Intl.message(
      'Switch to the neo-brutalism design',
      name: 'tooltip_switch_brutal',
      desc: '',
      args: [],
    );
  }

  /// `Switch language`
  String get tooltip_switch_language {
    return Intl.message(
      'Switch language',
      name: 'tooltip_switch_language',
      desc: '',
      args: [],
    );
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
