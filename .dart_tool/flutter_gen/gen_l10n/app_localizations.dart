
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @sevafarm.
  ///
  /// In en, this message translates to:
  /// **'SEVAFARM'**
  String get sevafarm;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'LOGIN'**
  String get login;

  /// No description provided for @userid.
  ///
  /// In en, this message translates to:
  /// **'User Id'**
  String get userid;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup;

  /// No description provided for @createuser.
  ///
  /// In en, this message translates to:
  /// **'Create User'**
  String get createuser;

  /// No description provided for @createpass.
  ///
  /// In en, this message translates to:
  /// **'Create Pass'**
  String get createpass;

  /// No description provided for @createad.
  ///
  /// In en, this message translates to:
  /// **'Create Ad'**
  String get createad;

  /// No description provided for @goback.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get goback;

  /// No description provided for @vegetables.
  ///
  /// In en, this message translates to:
  /// **'Vegetables'**
  String get vegetables;

  /// No description provided for @fruits.
  ///
  /// In en, this message translates to:
  /// **'Fruits'**
  String get fruits;

  /// No description provided for @pulses.
  ///
  /// In en, this message translates to:
  /// **'Pulses'**
  String get pulses;

  /// No description provided for @cereals.
  ///
  /// In en, this message translates to:
  /// **'Cereals'**
  String get cereals;

  /// No description provided for @mycart.
  ///
  /// In en, this message translates to:
  /// **'My Cart'**
  String get mycart;

  /// No description provided for @seasp.
  ///
  /// In en, this message translates to:
  /// **'Seasonal Special'**
  String get seasp;

  /// No description provided for @seas.
  ///
  /// In en, this message translates to:
  /// **'Seasonal Products'**
  String get seas;

  /// No description provided for @kmango.
  ///
  /// In en, this message translates to:
  /// **'Kaalapadi mango available'**
  String get kmango;

  /// No description provided for @adc.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get adc;

  /// No description provided for @click.
  ///
  /// In en, this message translates to:
  /// **'Click Here'**
  String get click;

  /// No description provided for @added.
  ///
  /// In en, this message translates to:
  /// **'Added to Cart'**
  String get added;

  /// No description provided for @fail.
  ///
  /// In en, this message translates to:
  /// **'Username or password is wrong'**
  String get fail;

  /// No description provided for @na.
  ///
  /// In en, this message translates to:
  /// **'That amount is not available'**
  String get na;

  /// No description provided for @ca.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get ca;

  /// No description provided for @ys.
  ///
  /// In en, this message translates to:
  /// **'Your Order is Placed Successfully'**
  String get ys;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'ORDERS'**
  String get order;

  /// No description provided for @homepage.
  ///
  /// In en, this message translates to:
  /// **'Go to Home'**
  String get homepage;

  /// No description provided for @cod.
  ///
  /// In en, this message translates to:
  /// **'CASH ON DELIVERY'**
  String get cod;

  /// No description provided for @not.
  ///
  /// In en, this message translates to:
  /// **'No Items Selected'**
  String get not;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'View Total Price'**
  String get total;

  /// No description provided for @tota.
  ///
  /// In en, this message translates to:
  /// **'The Total price is '**
  String get tota;

  /// No description provided for @pa.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get pa;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(_lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations _lookupAppLocalizations(Locale locale) {
  


// Lookup logic when only language code is specified.
switch (locale.languageCode) {
  case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
}


  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
