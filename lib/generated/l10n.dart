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

  /// ` Skip`
  String get onboardingSkip {
    return Intl.message(' Skip', name: 'onboardingSkip', desc: '', args: []);
  }

  /// ` Next`
  String get onboardingNext {
    return Intl.message(' Next', name: 'onboardingNext', desc: '', args: []);
  }

  /// `Start`
  String get onboardingStart {
    return Intl.message('Start', name: 'onboardingStart', desc: '', args: []);
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

  /// `Mood Graph`
  String get onboardingTitleSecond {
    return Intl.message(
      'Mood Graph',
      name: 'onboardingTitleSecond',
      desc: '',
      args: [],
    );
  }

  /// `Mood Value Guide`
  String get onboardingTitleThird {
    return Intl.message(
      'Mood Value Guide',
      name: 'onboardingTitleThird',
      desc: '',
      args: [],
    );
  }

  /// `Record your mood and create your own graph`
  String get onboardingBodyFirst {
    return Intl.message(
      'Record your mood and create your own graph',
      name: 'onboardingBodyFirst',
      desc: '',
      args: [],
    );
  }

  /// `Input mood values from -5 to +5 (excluding 0) and build up your graph`
  String get onboardingBodySecond {
    return Intl.message(
      'Input mood values from -5 to +5 (excluding 0) and build up your graph',
      name: 'onboardingBodySecond',
      desc: '',
      args: [],
    );
  }

  /// `Support for mood value input\nCustomize it to fit your needs`
  String get onboardingBodyThird {
    return Intl.message(
      'Support for mood value input\nCustomize it to fit your needs',
      name: 'onboardingBodyThird',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the Mood Trend!`
  String get onboardingWelcome {
    return Intl.message(
      'Welcome to the Mood Trend!',
      name: 'onboardingWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get dialogError {
    return Intl.message('Error', name: 'dialogError', desc: '', args: []);
  }

  /// `OK`
  String get dialogOk {
    return Intl.message('OK', name: 'dialogOk', desc: '', args: []);
  }

  /// `Confirm`
  String get dialogConfirm {
    return Intl.message('Confirm', name: 'dialogConfirm', desc: '', args: []);
  }

  /// `Yes`
  String get dialogYes {
    return Intl.message('Yes', name: 'dialogYes', desc: '', args: []);
  }

  /// `No`
  String get dialogNo {
    return Intl.message('No', name: 'dialogNo', desc: '', args: []);
  }

  /// `Settings`
  String get settingSetting {
    return Intl.message('Settings', name: 'settingSetting', desc: '', args: []);
  }

  /// `Edit`
  String get settingEdit {
    return Intl.message('Edit', name: 'settingEdit', desc: '', args: []);
  }

  /// `Record Item`
  String get settingRecordItem {
    return Intl.message(
      'Record Item',
      name: 'settingRecordItem',
      desc: '',
      args: [],
    );
  }

  /// `Mood Value Guide`
  String get table {
    return Intl.message('Mood Value Guide', name: 'table', desc: '', args: []);
  }

  /// `Support`
  String get settingSupport {
    return Intl.message('Support', name: 'settingSupport', desc: '', args: []);
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
    return Intl.message('Review', name: 'settingReview', desc: '', args: []);
  }

  /// `A review would make the developer very happy!`
  String get settingReviewRequest {
    return Intl.message(
      'A review would make the developer very happy!',
      name: 'settingReviewRequest',
      desc: '',
      args: [],
    );
  }

  /// `About This App`
  String get settingOnboarding {
    return Intl.message(
      'About This App',
      name: 'settingOnboarding',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use`
  String get settingTerms {
    return Intl.message(
      'Terms of Use',
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
    return Intl.message('Other', name: 'settingOther', desc: '', args: []);
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

  /// `All data will be deleted and cannot be restored`
  String get settingWithdrawConfirmDetail {
    return Intl.message(
      'All data will be deleted and cannot be restored',
      name: 'settingWithdrawConfirmDetail',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for using our app`
  String get settingThank {
    return Intl.message(
      'Thank you for using our app',
      name: 'settingThank',
      desc: '',
      args: [],
    );
  }

  /// `1 Year`
  String get homeYear {
    return Intl.message('1 Year', name: 'homeYear', desc: '', args: []);
  }

  /// `6 Months`
  String get homeHalfYear {
    return Intl.message('6 Months', name: 'homeHalfYear', desc: '', args: []);
  }

  /// `1 Month`
  String get homeMonth {
    return Intl.message('1 Month', name: 'homeMonth', desc: '', args: []);
  }

  /// `Mood Value`
  String get moodValue {
    return Intl.message('Mood Value', name: 'moodValue', desc: '', args: []);
  }

  /// `Activity Count`
  String get plannedVolume {
    return Intl.message(
      'Activity Count',
      name: 'plannedVolume',
      desc: '',
      args: [],
    );
  }

  /// `Mood value and planned activity count have been successfully registered`
  String get inputSuccess {
    return Intl.message(
      'Mood value and planned activity count have been successfully registered',
      name: 'inputSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get inputSave {
    return Intl.message('Save', name: 'inputSave', desc: '', args: []);
  }

  /// `is already registered`
  String get inputAlreadyExist {
    return Intl.message(
      'is already registered',
      name: 'inputAlreadyExist',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to overwrite?`
  String get inputOverwritingQuestion {
    return Intl.message(
      'Do you want to overwrite?',
      name: 'inputOverwritingQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
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

  /// `Depression`
  String get depression {
    return Intl.message('Depression', name: 'depression', desc: '', args: []);
  }

  /// `Mania`
  String get manic {
    return Intl.message('Mania', name: 'manic', desc: '', args: []);
  }

  /// `Start setting up the Mood Value Guide`
  String get tableStartEdit {
    return Intl.message(
      'Start setting up the Mood Value Guide',
      name: 'tableStartEdit',
      desc: '',
      args: [],
    );
  }

  /// `Enter depressive symptoms`
  String get inputDepression {
    return Intl.message(
      'Enter depressive symptoms',
      name: 'inputDepression',
      desc: '',
      args: [],
    );
  }

  /// `Enter manic symptoms`
  String get inputManic {
    return Intl.message(
      'Enter manic symptoms',
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
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Confirm Registration`
  String get registerConfirm {
    return Intl.message(
      'Confirm Registration',
      name: 'registerConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Mood Value Guide registration completed`
  String get registerSave {
    return Intl.message(
      'Mood Value Guide registration completed',
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

  /// `What type of depression do you have?`
  String get typeDepression {
    return Intl.message(
      'What type of depression do you have?',
      name: 'typeDepression',
      desc: '',
      args: [],
    );
  }

  /// `What type of mania do you have?`
  String get typeManic {
    return Intl.message(
      'What type of mania do you have?',
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

  /// `Poor\nThinking`
  String get typePoorThinking {
    return Intl.message(
      'Poor\nThinking',
      name: 'typePoorThinking',
      desc: '',
      args: [],
    );
  }

  /// `Sleep Disorder`
  String get typeSleepDisorder {
    return Intl.message(
      'Sleep Disorder',
      name: 'typeSleepDisorder',
      desc: '',
      args: [],
    );
  }

  /// `Custom\nInput`
  String get typeOther {
    return Intl.message('Custom\nInput', name: 'typeOther', desc: '', args: []);
  }

  /// `Suggestion`
  String get typeSuggestion {
    return Intl.message(
      'Suggestion',
      name: 'typeSuggestion',
      desc: '',
      args: [],
    );
  }

  /// `Idea`
  String get typeIdea {
    return Intl.message('Idea', name: 'typeIdea', desc: '', args: []);
  }

  /// `Elation`
  String get typeElation {
    return Intl.message('Elation', name: 'typeElation', desc: '', args: []);
  }

  /// `Active`
  String get typeActivity {
    return Intl.message('Active', name: 'typeActivity', desc: '', args: []);
  }

  /// `Somewhat pessimistic`
  String get melancholyMinus_1 {
    return Intl.message(
      'Somewhat pessimistic',
      name: 'melancholyMinus_1',
      desc: '',
      args: [],
    );
  }

  /// `Mild melancholy, feeling reluctant to do daily activities`
  String get melancholyMinus_2 {
    return Intl.message(
      'Mild melancholy, feeling reluctant to do daily activities',
      name: 'melancholyMinus_2',
      desc: '',
      args: [],
    );
  }

  /// `Strong melancholy, struggling with daily life, losing interest in usual activities`
  String get melancholyMinus_3 {
    return Intl.message(
      'Strong melancholy, struggling with daily life, losing interest in usual activities',
      name: 'melancholyMinus_3',
      desc: '',
      args: [],
    );
  }

  /// `Severe melancholy, affecting daily function`
  String get melancholyMinus_4 {
    return Intl.message(
      'Severe melancholy, affecting daily function',
      name: 'melancholyMinus_4',
      desc: '',
      args: [],
    );
  }

  /// `Completely hopeless, life feels unbearable, unable to function`
  String get melancholyMinus_5 {
    return Intl.message(
      'Completely hopeless, life feels unbearable, unable to function',
      name: 'melancholyMinus_5',
      desc: '',
      args: [],
    );
  }

  /// `Thinking feels slightly burdensome at times`
  String get thinkMinus_1 {
    return Intl.message(
      'Thinking feels slightly burdensome at times',
      name: 'thinkMinus_1',
      desc: '',
      args: [],
    );
  }

  /// `Mild sluggish thinking`
  String get thinkMinus_2 {
    return Intl.message(
      'Mild sluggish thinking',
      name: 'thinkMinus_2',
      desc: '',
      args: [],
    );
  }

  /// `Noticeable cognitive decline, poor problem-solving and judgment`
  String get thinkMinus_3 {
    return Intl.message(
      'Noticeable cognitive decline, poor problem-solving and judgment',
      name: 'thinkMinus_3',
      desc: '',
      args: [],
    );
  }

  /// `Significant cognitive impairment, severe issues with concentration and memory`
  String get thinkMinus_4 {
    return Intl.message(
      'Significant cognitive impairment, severe issues with concentration and memory',
      name: 'thinkMinus_4',
      desc: '',
      args: [],
    );
  }

  /// `Thoughts are completely non-functional, unable to comprehend most things`
  String get thinkMinus_5 {
    return Intl.message(
      'Thoughts are completely non-functional, unable to comprehend most things',
      name: 'thinkMinus_5',
      desc: '',
      args: [],
    );
  }

  /// `Wake up feeling sluggish`
  String get sleepMinus_1 {
    return Intl.message(
      'Wake up feeling sluggish',
      name: 'sleepMinus_1',
      desc: '',
      args: [],
    );
  }

  /// `Poor sleep quality, feeling sleepy or fatigued during the day`
  String get sleepMinus_2 {
    return Intl.message(
      'Poor sleep quality, feeling sleepy or fatigued during the day',
      name: 'sleepMinus_2',
      desc: '',
      args: [],
    );
  }

  /// `Disrupted sleep, not getting enough rest, strong daytime drowsiness`
  String get sleepMinus_3 {
    return Intl.message(
      'Disrupted sleep, not getting enough rest, strong daytime drowsiness',
      name: 'sleepMinus_3',
      desc: '',
      args: [],
    );
  }

  /// `Extreme sleep deprivation or excessive sleep, major impact on daily function`
  String get sleepMinus_4 {
    return Intl.message(
      'Extreme sleep deprivation or excessive sleep, major impact on daily function',
      name: 'sleepMinus_4',
      desc: '',
      args: [],
    );
  }

  /// `Severe insomnia or sleeping most of the day, extreme fatigue`
  String get sleepMinus_5 {
    return Intl.message(
      'Severe insomnia or sleeping most of the day, extreme fatigue',
      name: 'sleepMinus_5',
      desc: '',
      args: [],
    );
  }

  /// `Can come up with ideas when needed`
  String get ideaPlus_1 {
    return Intl.message(
      'Can come up with ideas when needed',
      name: 'ideaPlus_1',
      desc: '',
      args: [],
    );
  }

  /// `Ideas come easily`
  String get ideaPlus_2 {
    return Intl.message(
      'Ideas come easily',
      name: 'ideaPlus_2',
      desc: '',
      args: [],
    );
  }

  /// `Ideas flow continuously, can't stop thinking`
  String get ideaPlus_3 {
    return Intl.message(
      'Ideas flow continuously, can\'t stop thinking',
      name: 'ideaPlus_3',
      desc: '',
      args: [],
    );
  }

  /// `Struggling to bring a flood of ideas into reality`
  String get ideaPlus_4 {
    return Intl.message(
      'Struggling to bring a flood of ideas into reality',
      name: 'ideaPlus_4',
      desc: '',
      args: [],
    );
  }

  /// `Certain of success and taking action to realize ideas`
  String get ideaPlus_5 {
    return Intl.message(
      'Certain of success and taking action to realize ideas',
      name: 'ideaPlus_5',
      desc: '',
      args: [],
    );
  }

  /// `Feeling more positive than usual`
  String get elationPlus_1 {
    return Intl.message(
      'Feeling more positive than usual',
      name: 'elationPlus_1',
      desc: '',
      args: [],
    );
  }

  /// `Feeling motivated and full of positive energy`
  String get elationPlus_2 {
    return Intl.message(
      'Feeling motivated and full of positive energy',
      name: 'elationPlus_2',
      desc: '',
      args: [],
    );
  }

  /// `Strong belief that everything will go well`
  String get elationPlus_3 {
    return Intl.message(
      'Strong belief that everything will go well',
      name: 'elationPlus_3',
      desc: '',
      args: [],
    );
  }

  /// `Certain of personal success in everything`
  String get elationPlus_4 {
    return Intl.message(
      'Certain of personal success in everything',
      name: 'elationPlus_4',
      desc: '',
      args: [],
    );
  }

  /// `Absolute confidence in being right and succeeding in everything`
  String get elationPlus_5 {
    return Intl.message(
      'Absolute confidence in being right and succeeding in everything',
      name: 'elationPlus_5',
      desc: '',
      args: [],
    );
  }

  /// `Capable of doing activities`
  String get activityPlus_1 {
    return Intl.message(
      'Capable of doing activities',
      name: 'activityPlus_1',
      desc: '',
      args: [],
    );
  }

  /// `More active than usual`
  String get activityPlus_2 {
    return Intl.message(
      'More active than usual',
      name: 'activityPlus_2',
      desc: '',
      args: [],
    );
  }

  /// `Energetic and filling schedule with activities`
  String get activityPlus_3 {
    return Intl.message(
      'Energetic and filling schedule with activities',
      name: 'activityPlus_3',
      desc: '',
      args: [],
    );
  }

  /// `Entire day is packed with activities`
  String get activityPlus_4 {
    return Intl.message(
      'Entire day is packed with activities',
      name: 'activityPlus_4',
      desc: '',
      args: [],
    );
  }

  /// `Engaging in constant activities for days without feeling tired`
  String get activityPlus_5 {
    return Intl.message(
      'Engaging in constant activities for days without feeling tired',
      name: 'activityPlus_5',
      desc: '',
      args: [],
    );
  }

  /// `Version Info`
  String get version_info {
    return Intl.message(
      'Version Info',
      name: 'version_info',
      desc: '',
      args: [],
    );
  }

  /// `How was your mood today?`
  String get moodValueQuestion {
    return Intl.message(
      'How was your mood today?',
      name: 'moodValueQuestion',
      desc: '',
      args: [],
    );
  }

  /// `How many activities or plans did you have today?`
  String get plannedVolumeQuestion {
    return Intl.message(
      'How many activities or plans did you have today?',
      name: 'plannedVolumeQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Record your mood on a scale from -5 to +5\nIf unsure, refer to the Mood Value Guide!\nConsider seeking medical advice for values above +3 or below -3`
  String get moodValueQuestionTooltipMessage {
    return Intl.message(
      'Record your mood on a scale from -5 to +5\nIf unsure, refer to the Mood Value Guide!\nConsider seeking medical advice for values above +3 or below -3',
      name: 'moodValueQuestionTooltipMessage',
      desc: '',
      args: [],
    );
  }

  /// `Record the number of activities you completed today\nThis objective measure can help in reviewing trends`
  String get plannedVolumeQuestionTooltipMessage {
    return Intl.message(
      'Record the number of activities you completed today\nThis objective measure can help in reviewing trends',
      name: 'plannedVolumeQuestionTooltipMessage',
      desc: '',
      args: [],
    );
  }

  /// `View Mood Value Guide`
  String get goTable {
    return Intl.message(
      'View Mood Value Guide',
      name: 'goTable',
      desc: '',
      args: [],
    );
  }

  /// `Let's start recording!`
  String get homeCoachMarkTitle {
    return Intl.message(
      'Let\'s start recording!',
      name: 'homeCoachMarkTitle',
      desc: '',
      args: [],
    );
  }

  /// `Use the button below to record your mood value and activity count`
  String get homeCoachMarkBody {
    return Intl.message(
      'Use the button below to record your mood value and activity count',
      name: 'homeCoachMarkBody',
      desc: '',
      args: [],
    );
  }

  /// `Record your mood today`
  String get notificationDailyTitle {
    return Intl.message(
      'Record your mood today',
      name: 'notificationDailyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Track your mood changes by recording your daily reflection`
  String get notificationDailyBody {
    return Intl.message(
      'Track your mood changes by recording your daily reflection',
      name: 'notificationDailyBody',
      desc: '',
      args: [],
    );
  }

  /// `Record your weekend mood`
  String get notificationWeekendTitle {
    return Intl.message(
      'Record your weekend mood',
      name: 'notificationWeekendTitle',
      desc: '',
      args: [],
    );
  }

  /// `Track your mood changes by recording your weekend reflection`
  String get notificationWeekendBody {
    return Intl.message(
      'Track your mood changes by recording your weekend reflection',
      name: 'notificationWeekendBody',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to set up notification reminders?`
  String get notificationSettingsTitle {
    return Intl.message(
      'Would you like to set up notification reminders?',
      name: 'notificationSettingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Daily`
  String get notificationSettingsDaily {
    return Intl.message(
      'Daily',
      name: 'notificationSettingsDaily',
      desc: '',
      args: [],
    );
  }

  /// `Notify at 8:00 PM daily`
  String get notificationSettingsDailyDescription {
    return Intl.message(
      'Notify at 8:00 PM daily',
      name: 'notificationSettingsDailyDescription',
      desc: '',
      args: [],
    );
  }

  /// `Weekend`
  String get notificationSettingsWeekend {
    return Intl.message(
      'Weekend',
      name: 'notificationSettingsWeekend',
      desc: '',
      args: [],
    );
  }

  /// `Notify at 8:00 PM on weekends`
  String get notificationSettingsWeekendDescription {
    return Intl.message(
      'Notify at 8:00 PM on weekends',
      name: 'notificationSettingsWeekendDescription',
      desc: '',
      args: [],
    );
  }

  /// `No notifications`
  String get notificationSettingsNone {
    return Intl.message(
      'No notifications',
      name: 'notificationSettingsNone',
      desc: '',
      args: [],
    );
  }

  /// `Disable notifications`
  String get notificationSettingsNoneDescription {
    return Intl.message(
      'Disable notifications',
      name: 'notificationSettingsNoneDescription',
      desc: '',
      args: [],
    );
  }

  /// `Notification Settings`
  String get settingNotifications {
    return Intl.message(
      'Notification Settings',
      name: 'settingNotifications',
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
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'la'),
      Locale.fromSubtags(languageCode: 'ne'),
      Locale.fromSubtags(languageCode: 'no'),
      Locale.fromSubtags(languageCode: 'pl'),
      Locale.fromSubtags(languageCode: 'pt'),
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
