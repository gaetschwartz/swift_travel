// ignore_for_file: non_constant_identifier_names
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('de'),
    Locale('en'),
    Locale('fr'),
    Locale('it')
  ];

  /// No description provided for @add_to_favs.
  ///
  /// In en, this message translates to:
  /// **'Add to favourites'**
  String get add_to_favs;

  /// No description provided for @advanced_settings.
  ///
  /// In en, this message translates to:
  /// **'Advanced settings'**
  String get advanced_settings;

  /// No description provided for @arrival.
  ///
  /// In en, this message translates to:
  /// **'Arrival'**
  String get arrival;

  /// No description provided for @arrive.
  ///
  /// In en, this message translates to:
  /// **'Arrive'**
  String get arrive;

  /// No description provided for @brightness.
  ///
  /// In en, this message translates to:
  /// **'Brightness'**
  String get brightness;

  /// No description provided for @brightness_dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get brightness_dark;

  /// No description provided for @brightness_light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get brightness_light;

  /// No description provided for @brightness_system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get brightness_system;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @contact_no_address.
  ///
  /// In en, this message translates to:
  /// **'This contact doesn\'t have any address'**
  String get contact_no_address;

  /// No description provided for @contacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @continue_.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_;

  /// No description provided for @current_location.
  ///
  /// In en, this message translates to:
  /// **'Current location'**
  String get current_location;

  /// No description provided for @customization.
  ///
  /// In en, this message translates to:
  /// **'Customisation'**
  String get customization;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @delete_fav.
  ///
  /// In en, this message translates to:
  /// **'Delete favourite ?'**
  String get delete_fav;

  /// No description provided for @departure.
  ///
  /// In en, this message translates to:
  /// **'Starting point'**
  String get departure;

  /// No description provided for @destination.
  ///
  /// In en, this message translates to:
  /// **'Destination'**
  String get destination;

  /// No description provided for @developer.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get developer;

  /// No description provided for @direction.
  ///
  /// In en, this message translates to:
  /// **'Direction {dir}'**
  String direction(String dir);

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @failed_get_contact.
  ///
  /// In en, this message translates to:
  /// **'Failed to obtain the address book'**
  String get failed_get_contact;

  /// No description provided for @fav_route.
  ///
  /// In en, this message translates to:
  /// **'Save route'**
  String get fav_route;

  /// No description provided for @find_a_route.
  ///
  /// In en, this message translates to:
  /// **'Find a route'**
  String get find_a_route;

  /// No description provided for @font.
  ///
  /// In en, this message translates to:
  /// **'Font'**
  String get font;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'from'**
  String get from;

  /// No description provided for @itinerary.
  ///
  /// In en, this message translates to:
  /// **'Itinerary'**
  String get itinerary;

  /// No description provided for @journey_informations.
  ///
  /// In en, this message translates to:
  /// **'Journey information'**
  String get journey_informations;

  /// No description provided for @live_route.
  ///
  /// In en, this message translates to:
  /// **'Live route'**
  String get live_route;

  /// No description provided for @maps_app.
  ///
  /// In en, this message translates to:
  /// **'Maps app'**
  String get maps_app;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @navigation_api.
  ///
  /// In en, this message translates to:
  /// **'Navigation API'**
  String get navigation_api;

  /// No description provided for @new_fav.
  ///
  /// In en, this message translates to:
  /// **'New favourite stop'**
  String get new_fav;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @no_contacts.
  ///
  /// In en, this message translates to:
  /// **'Your address book is empty'**
  String get no_contacts;

  /// No description provided for @our_team.
  ///
  /// In en, this message translates to:
  /// **'Our team'**
  String get our_team;

  /// No description provided for @remove_from_favoruites.
  ///
  /// In en, this message translates to:
  /// **'Remove from favourites'**
  String get remove_from_favoruites;

  /// No description provided for @rename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get rename;

  /// No description provided for @reset_settings.
  ///
  /// In en, this message translates to:
  /// **'Reset settings'**
  String get reset_settings;

  /// No description provided for @route_to.
  ///
  /// In en, this message translates to:
  /// **'Route'**
  String get route_to;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @search_station.
  ///
  /// In en, this message translates to:
  /// **'Search for a station'**
  String get search_station;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @share_as_image.
  ///
  /// In en, this message translates to:
  /// **'Share as image'**
  String get share_as_image;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @suggestion.
  ///
  /// In en, this message translates to:
  /// **'Suggestion'**
  String get suggestion;

  /// No description provided for @tabs_favourites.
  ///
  /// In en, this message translates to:
  /// **'Favourites'**
  String get tabs_favourites;

  /// No description provided for @tabs_route.
  ///
  /// In en, this message translates to:
  /// **'Planning'**
  String get tabs_route;

  /// No description provided for @tabs_search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get tabs_search;

  /// No description provided for @themes.
  ///
  /// In en, this message translates to:
  /// **'Themes'**
  String get themes;

  /// No description provided for @timetable.
  ///
  /// In en, this message translates to:
  /// **'Timetable'**
  String get timetable;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'to'**
  String get to;

  /// No description provided for @travel_duration.
  ///
  /// In en, this message translates to:
  /// **'Travel duration'**
  String get travel_duration;

  /// No description provided for @unable_locate.
  ///
  /// In en, this message translates to:
  /// **'Unable to obtain location.'**
  String get unable_locate;

  /// No description provided for @unsupported_area.
  ///
  /// In en, this message translates to:
  /// **'You don\'t seem to be in a supported area.'**
  String get unsupported_area;

  /// No description provided for @use_current_location.
  ///
  /// In en, this message translates to:
  /// **'Use current location'**
  String get use_current_location;

  /// No description provided for @use_current_time.
  ///
  /// In en, this message translates to:
  /// **'Use current time'**
  String get use_current_time;

  /// No description provided for @walk.
  ///
  /// In en, this message translates to:
  /// **'Walk *{walk}*.'**
  String walk(String walk);

  /// No description provided for @walk_and_wait.
  ///
  /// In en, this message translates to:
  /// **'Walk *{walk}* and wait *{wait}*.'**
  String walk_and_wait(String wait, String walk);

  /// No description provided for @what_to_do.
  ///
  /// In en, this message translates to:
  /// **'What to do ?'**
  String get what_to_do;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @youll_be_there.
  ///
  /// In en, this message translates to:
  /// **'You arrive at *{time}*.'**
  String youll_be_there(String time);

  /// No description provided for @search_a_station.
  ///
  /// In en, this message translates to:
  /// **'Search a station'**
  String get search_a_station;

  /// No description provided for @no_favorites.
  ///
  /// In en, this message translates to:
  /// **'You have no favorites !'**
  String get no_favorites;

  /// No description provided for @how_to_add_favorite.
  ///
  /// In en, this message translates to:
  /// **'You can add one by tapping the ➕ button.'**
  String get how_to_add_favorite;

  /// No description provided for @continue_welcome.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_welcome;

  /// No description provided for @purchase_success.
  ///
  /// In en, this message translates to:
  /// **'Purchase successful'**
  String get purchase_success;

  /// No description provided for @thank_you_for_purchase.
  ///
  /// In en, this message translates to:
  /// **'Thank you so much for supporting the development of the app !'**
  String get thank_you_for_purchase;

  /// No description provided for @in_app_purchases.
  ///
  /// In en, this message translates to:
  /// **'In-App Purchases'**
  String get in_app_purchases;

  /// No description provided for @in_app_purchases_desc.
  ///
  /// In en, this message translates to:
  /// **'You can support the development of this app by donating. Any amount is really appreciated. Any donation will unlock Swift Travel Pro with more customization options.'**
  String get in_app_purchases_desc;

  /// No description provided for @in_app_purchases_restore.
  ///
  /// In en, this message translates to:
  /// **'Restore purchases'**
  String get in_app_purchases_restore;

  /// No description provided for @in_app_purchases_restore_desc.
  ///
  /// In en, this message translates to:
  /// **'If you have already purchased one of the above products, you can restore it here.'**
  String get in_app_purchases_restore_desc;

  /// No description provided for @that_is_required.
  ///
  /// In en, this message translates to:
  /// **'{that} is required'**
  String that_is_required(String that);

  /// No description provided for @pro_desc.
  ///
  /// In en, this message translates to:
  /// **''**
  String get pro_desc;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @redeem_code.
  ///
  /// In en, this message translates to:
  /// **'Redeem a code'**
  String get redeem_code;

  /// No description provided for @donation_of.
  ///
  /// In en, this message translates to:
  /// **'Donation of {price}'**
  String donation_of(String price);

  /// No description provided for @support_me.
  ///
  /// In en, this message translates to:
  /// **'Support me'**
  String get support_me;

  /// No description provided for @about_the_app.
  ///
  /// In en, this message translates to:
  /// **'About the app'**
  String get about_the_app;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'fr', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'fr': return AppLocalizationsFr();
    case 'it': return AppLocalizationsIt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
