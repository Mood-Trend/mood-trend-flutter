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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Skip`
  String get onboardingSkip {
    return Intl.message(
      'Skip',
      name: 'onboardingSkip',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get onboardingNext {
    return Intl.message(
      'Next',
      name: 'onboardingNext',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get onboardingStart {
    return Intl.message(
      'Start',
      name: 'onboardingStart',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get onboardingTitleFirst {
    return Intl.message(
      'Welcome',
      name: 'onboardingTitleFirst',
      desc: '',
      args: [],
    );
  }

  /// `Record Your Mood`
  String get onboardingTitleSecond {
    return Intl.message(
      'Record Your Mood',
      name: 'onboardingTitleSecond',
      desc: '',
      args: [],
    );
  }

  /// `Mood Value Reference Table`
  String get onboardingTitleThird {
    return Intl.message(
      'Mood Value Reference Table',
      name: 'onboardingTitleThird',
      desc: '',
      args: [],
    );
  }

  /// `Share Your Mood`
  String get onboardingBodyFirst {
    return Intl.message(
      'Share Your Mood',
      name: 'onboardingBodyFirst',
      desc: '',
      args: [],
    );
  }

  /// `Track and Confirm with Graph`
  String get onboardingBodySecond {
    return Intl.message(
      'Track and Confirm with Graph',
      name: 'onboardingBodySecond',
      desc: '',
      args: [],
    );
  }

  /// `Edit to Create Your Personal Table`
  String get onboardingBodyThird {
    return Intl.message(
      'Edit to Create Your Personal Table',
      name: 'onboardingBodyThird',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Mood Graph!`
  String get onboardingWelcome {
    return Intl.message(
      'Welcome to Mood Graph!',
      name: 'onboardingWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get dialogError {
    return Intl.message(
      'Error',
      name: 'dialogError',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get dialogOk {
    return Intl.message(
      'OK',
      name: 'dialogOk',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get dialogConfirm {
    return Intl.message(
      'Confirm',
      name: 'dialogConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get dialogYes {
    return Intl.message(
      'Yes',
      name: 'dialogYes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get dialogNo {
    return Intl.message(
      'No',
      name: 'dialogNo',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingSetting {
    return Intl.message(
      'Settings',
      name: 'settingSetting',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get settingEdit {
    return Intl.message(
      'Edit',
      name: 'settingEdit',
      desc: '',
      args: [],
    );
  }

  /// `Mood Value Reference Table`
  String get table {
    return Intl.message(
      'Mood Value Reference Table',
      name: 'table',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get settingSupport {
    return Intl.message(
      'Support',
      name: 'settingSupport',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get settingContact {
    return Intl.message(
      'Contact Us',
      name: 'settingContact',
      desc: '',
      args: [],
    );
  }

  /// `About the App`
  String get settingAboutApp {
    return Intl.message(
      'About the App',
      name: 'settingAboutApp',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get settingReview {
    return Intl.message(
      'Review',
      name: 'settingReview',
      desc: '',
      args: [],
    );
  }

  /// `Developers will dance with joy if you leave a review!`
  String get settingReviewRequest {
    return Intl.message(
      'Developers will dance with joy if you leave a review!',
      name: 'settingReviewRequest',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get settingTerms {
    return Intl.message(
      'Terms of Service',
      name: 'settingTerms',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get settingPrivacy {
    return Intl.message(
      'Privacy Policy',
      name: 'settingPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get settingOther {
    return Intl.message(
      'Other',
      name: 'settingOther',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw`
  String get settingWithdraw {
    return Intl.message(
      'Withdraw',
      name: 'settingWithdraw',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to withdraw?`
  String get settingWithdrawConfirm {
    return Intl.message(
      'Are you sure you want to withdraw?',
      name: 'settingWithdrawConfirm',
      desc: '',
      args: [],
    );
  }

  /// `All data will be deleted and cannot be restored.`
  String get settingWithdrawConfirmDetail {
    return Intl.message(
      'All data will be deleted and cannot be restored.',
      name: 'settingWithdrawConfirmDetail',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for using our service!`
  String get settingThank {
    return Intl.message(
      'Thank you for using our service!',
      name: 'settingThank',
      desc: '',
      args: [],
    );
  }

  /// `1 Year`
  String get homeYear {
    return Intl.message(
      '1 Year',
      name: 'homeYear',
      desc: '',
      args: [],
    );
  }

  /// `6 Months`
  String get homeHalfYear {
    return Intl.message(
      '6 Months',
      name: 'homeHalfYear',
      desc: '',
      args: [],
    );
  }

  /// `1 Month`
  String get homeMonth {
    return Intl.message(
      '1 Month',
      name: 'homeMonth',
      desc: '',
      args: [],
    );
  }

  /// `Mood Value`
  String get moodValue {
    return Intl.message(
      'Mood Value',
      name: 'moodValue',
      desc: '',
      args: [],
    );
  }

  /// `Planned Volume`
  String get plannedVolume {
    return Intl.message(
      'Planned Volume',
      name: 'plannedVolume',
      desc: '',
      args: [],
    );
  }

  /// `Registration of Mood Value and Planned Number is complete.`
  String get inputSuccess {
    return Intl.message(
      'Registration of Mood Value and Planned Number is complete.',
      name: 'inputSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get inputSave {
    return Intl.message(
      'Save',
      name: 'inputSave',
      desc: '',
      args: [],
    );
  }

  /// ` is already registered.`
  String get inputAlreadyExist {
    return Intl.message(
      ' is already registered.',
      name: 'inputAlreadyExist',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to overwrite it?`
  String get inputOverwritingQuestion {
    return Intl.message(
      'Do you want to overwrite it?',
      name: 'inputOverwritingQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Overwrite`
  String get inputOverwriting {
    return Intl.message(
      'Overwrite',
      name: 'inputOverwriting',
      desc: '',
      args: [],
    );
  }

  /// `Depressive State`
  String get depression {
    return Intl.message(
      'Depressive State',
      name: 'depression',
      desc: '',
      args: [],
    );
  }

  /// `Manic State`
  String get manic {
    return Intl.message(
      'Manic State',
      name: 'manic',
      desc: '',
      args: [],
    );
  }

  /// `Start Editing`
  String get tableStartEdit {
    return Intl.message(
      'Start Editing',
      name: 'tableStartEdit',
      desc: '',
      args: [],
    );
  }

  /// `Enter symptoms of depression`
  String get inputDepression {
    return Intl.message(
      'Enter symptoms of depression',
      name: 'inputDepression',
      desc: '',
      args: [],
    );
  }

  /// `Enter symptoms of mania`
  String get inputManic {
    return Intl.message(
      'Enter symptoms of mania',
      name: 'inputManic',
      desc: '',
      args: [],
    );
  }

  /// `Please enter symptoms`
  String get inputRequest {
    return Intl.message(
      'Please enter symptoms',
      name: 'inputRequest',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Registration Confirmation`
  String get registerConfirm {
    return Intl.message(
      'Registration Confirmation',
      name: 'registerConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Registration of Mood Value Reference Table is complete.`
  String get registerSave {
    return Intl.message(
      'Registration of Mood Value Reference Table is complete.',
      name: 'registerSave',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerRegister {
    return Intl.message(
      'Register',
      name: 'registerRegister',
      desc: '',
      args: [],
    );
  }

  /// `What is your type of depression?`
  String get typeDepression {
    return Intl.message(
      'What is your type of depression?',
      name: 'typeDepression',
      desc: '',
      args: [],
    );
  }

  /// `What is your type of mania?`
  String get typeManic {
    return Intl.message(
      'What is your type of mania?',
      name: 'typeManic',
      desc: '',
      args: [],
    );
  }

  /// `Melancholy`
  String get typeMelancholy {
    return Intl.message(
      'Melancholy',
      name: 'typeMelancholy',
      desc: '',
      args: [],
    );
  }

  /// `Decreased\nCognitive Function`
  String get typePoorThinking {
    return Intl.message(
      'Decreased\nCognitive Function',
      name: 'typePoorThinking',
      desc: '',
      args: [],
    );
  }

  /// `Sleep\nDisorder`
  String get typeSleepDisorder {
    return Intl.message(
      'Sleep\nDisorder',
      name: 'typeSleepDisorder',
      desc: '',
      args: [],
    );
  }

  /// `Custom`
  String get typeOther {
    return Intl.message(
      'Custom',
      name: 'typeOther',
      desc: '',
      args: [],
    );
  }

  /// `Suggestions`
  String get typeSuggestion {
    return Intl.message(
      'Suggestions',
      name: 'typeSuggestion',
      desc: '',
      args: [],
    );
  }

  /// `Ideas`
  String get typeIdea {
    return Intl.message(
      'Ideas',
      name: 'typeIdea',
      desc: '',
      args: [],
    );
  }

  /// `Elation`
  String get typeElation {
    return Intl.message(
      'Elation',
      name: 'typeElation',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get typeActivity {
    return Intl.message(
      'Active',
      name: 'typeActivity',
      desc: '',
      args: [],
    );
  }

  /// `Tend to be somewhat pessimistic`
  String get melancholyMinus_1 {
    return Intl.message(
      'Tend to be somewhat pessimistic',
      name: 'melancholyMinus_1',
      desc: '',
      args: [],
    );
  }

  /// `Mild sense of melancholy, with an increase in things you don't want to do in daily life`
  String get melancholyMinus_2 {
    return Intl.message(
      'Mild sense of melancholy, with an increase in things you don\'t want to do in daily life',
      name: 'melancholyMinus_2',
      desc: '',
      args: [],
    );
  }

  /// `Strong sense of melancholy, making life difficult. Almost no interest in usual activities`
  String get melancholyMinus_3 {
    return Intl.message(
      'Strong sense of melancholy, making life difficult. Almost no interest in usual activities',
      name: 'melancholyMinus_3',
      desc: '',
      args: [],
    );
  }

  /// `Intense feeling of melancholy, causing disruptions in daily life. Affecting daily functions`
  String get melancholyMinus_4 {
    return Intl.message(
      'Intense feeling of melancholy, causing disruptions in daily life. Affecting daily functions',
      name: 'melancholyMinus_4',
      desc: '',
      args: [],
    );
  }

  /// `Completely hopeless, living is only pain. Unable to perform daily activities`
  String get melancholyMinus_5 {
    return Intl.message(
      'Completely hopeless, living is only pain. Unable to perform daily activities',
      name: 'melancholyMinus_5',
      desc: '',
      args: [],
    );
  }

  /// `Sometimes feel a bit reluctant to think about things`
  String get thinkMinus_1 {
    return Intl.message(
      'Sometimes feel a bit reluctant to think about things',
      name: 'thinkMinus_1',
      desc: '',
      args: [],
    );
  }

  /// `Mild dullness in thinking`
  String get thinkMinus_2 {
    return Intl.message(
      'Mild dullness in thinking',
      name: 'thinkMinus_2',
      desc: '',
      args: [],
    );
  }

  /// `Dull thinking, significant decrease in problem-solving and judgment abilities`
  String get thinkMinus_3 {
    return Intl.message(
      'Dull thinking, significant decrease in problem-solving and judgment abilities',
      name: 'thinkMinus_3',
      desc: '',
      args: [],
    );
  }

  /// `Severe decrease in thinking, with major issues in concentration and memory`
  String get thinkMinus_4 {
    return Intl.message(
      'Severe decrease in thinking, with major issues in concentration and memory',
      name: 'thinkMinus_4',
      desc: '',
      args: [],
    );
  }

  /// `Thinking is non-functional, almost everything is incomprehensible`
  String get thinkMinus_5 {
    return Intl.message(
      'Thinking is non-functional, almost everything is incomprehensible',
      name: 'thinkMinus_5',
      desc: '',
      args: [],
    );
  }

  /// `Mornings are not refreshing`
  String get sleepMinus_1 {
    return Intl.message(
      'Mornings are not refreshing',
      name: 'sleepMinus_1',
      desc: '',
      args: [],
    );
  }

  /// `Low sleep quality, with daytime drowsiness and fatigue`
  String get sleepMinus_2 {
    return Intl.message(
      'Low sleep quality, with daytime drowsiness and fatigue',
      name: 'sleepMinus_2',
      desc: '',
      args: [],
    );
  }

  /// `Disrupted sleep, not getting sufficient rest. Strong daytime sleepiness`
  String get sleepMinus_3 {
    return Intl.message(
      'Disrupted sleep, not getting sufficient rest. Strong daytime sleepiness',
      name: 'sleepMinus_3',
      desc: '',
      args: [],
    );
  }

  /// `Extreme lack or excess of sleep, causing significant decline in daytime functioning`
  String get sleepMinus_4 {
    return Intl.message(
      'Extreme lack or excess of sleep, causing significant decline in daytime functioning',
      name: 'sleepMinus_4',
      desc: '',
      args: [],
    );
  }

  /// `Constantly in a severe state of insomnia, strong fatigue during the day. Alternatively, spending most of the day sleeping`
  String get sleepMinus_5 {
    return Intl.message(
      'Constantly in a severe state of insomnia, strong fatigue during the day. Alternatively, spending most of the day sleeping',
      name: 'sleepMinus_5',
      desc: '',
      args: [],
    );
  }

  /// `Capable of thinking of ideas when motivated`
  String get ideaPlus_1 {
    return Intl.message(
      'Capable of thinking of ideas when motivated',
      name: 'ideaPlus_1',
      desc: '',
      args: [],
    );
  }

  /// `Easily come up with ideas`
  String get ideaPlus_2 {
    return Intl.message(
      'Easily come up with ideas',
      name: 'ideaPlus_2',
      desc: '',
      args: [],
    );
  }

  /// `Ideas flow and continue to think incessantly`
  String get ideaPlus_3 {
    return Intl.message(
      'Ideas flow and continue to think incessantly',
      name: 'ideaPlus_3',
      desc: '',
      args: [],
    );
  }

  /// `Struggling to materialize a continuous flow of ideas`
  String get ideaPlus_4 {
    return Intl.message(
      'Struggling to materialize a continuous flow of ideas',
      name: 'ideaPlus_4',
      desc: '',
      args: [],
    );
  }

  /// `Confident that ideas will succeed and actively working towards realization`
  String get ideaPlus_5 {
    return Intl.message(
      'Confident that ideas will succeed and actively working towards realization',
      name: 'ideaPlus_5',
      desc: '',
      args: [],
    );
  }

  /// `Generally more positive than usual`
  String get elationPlus_1 {
    return Intl.message(
      'Generally more positive than usual',
      name: 'elationPlus_1',
      desc: '',
      args: [],
    );
  }

  /// `Positive and challenging, feeling positive energy`
  String get elationPlus_2 {
    return Intl.message(
      'Positive and challenging, feeling positive energy',
      name: 'elationPlus_2',
      desc: '',
      args: [],
    );
  }

  /// `Strong sense that everything will go well regardless of the situation`
  String get elationPlus_3 {
    return Intl.message(
      'Strong sense that everything will go well regardless of the situation',
      name: 'elationPlus_3',
      desc: '',
      args: [],
    );
  }

  /// `Confident that everything will succeed`
  String get elationPlus_4 {
    return Intl.message(
      'Confident that everything will succeed',
      name: 'elationPlus_4',
      desc: '',
      args: [],
    );
  }

  /// `Absolutely certain of being correct, and everything will go well`
  String get elationPlus_5 {
    return Intl.message(
      'Absolutely certain of being correct, and everything will go well',
      name: 'elationPlus_5',
      desc: '',
      args: [],
    );
  }

  /// `Capable of activity`
  String get activityPlus_1 {
    return Intl.message(
      'Capable of activity',
      name: 'activityPlus_1',
      desc: '',
      args: [],
    );
  }

  /// `In a more active mood than usual`
  String get activityPlus_2 {
    return Intl.message(
      'In a more active mood than usual',
      name: 'activityPlus_2',
      desc: '',
      args: [],
    );
  }

  /// `Active and energetic, with a lot of plans`
  String get activityPlus_3 {
    return Intl.message(
      'Active and energetic, with a lot of plans',
      name: 'activityPlus_3',
      desc: '',
      args: [],
    );
  }

  /// `Full day of scheduled activities`
  String get activityPlus_4 {
    return Intl.message(
      'Full day of scheduled activities',
      name: 'activityPlus_4',
      desc: '',
      args: [],
    );
  }

  /// `Continuing activities all day for several days, actively moving without feeling tired`
  String get activityPlus_5 {
    return Intl.message(
      'Continuing activities all day for several days, actively moving without feeling tired',
      name: 'activityPlus_5',
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
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'ne'),
      Locale.fromSubtags(languageCode: 'no'),
      Locale.fromSubtags(languageCode: 'zh-TW'),
      Locale.fromSubtags(languageCode: 'zh'),
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
