// ignore_for_file: non_constant_identifier_names


import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get add_to_favs => 'Add to favourites';

  @override
  String get arrival => 'Arrival';

  @override
  String get brightness => 'Brightness';

  @override
  String get brightness_dark => 'Dark';

  @override
  String get brightness_light => 'Light';

  @override
  String get brightness_system => 'System';

  @override
  String get cancel => 'Cancel';

  @override
  String get close => 'Close';

  @override
  String get continue_ => 'Continue';

  @override
  String get current_location => 'Current location';

  @override
  String get delete => 'Delete';

  @override
  String get delete_fav => 'Delete favourite ?';

  @override
  String get departure => 'Starting point';

  @override
  String get destination => 'Destination';

  @override
  String get developer => 'Developer';

  @override
  String get done => 'Done';

  @override
  String get fav_route => 'Save route';

  @override
  String get find_a_route => 'Find a route';

  @override
  String get font => 'Font';

  @override
  String get from => 'from';

  @override
  String get maps_app => 'Maps app';

  @override
  String get more => 'More';

  @override
  String get navigation_api => 'Navigation API';

  @override
  String get no => 'No';

  @override
  String get our_team => 'Our team';

  @override
  String get remove_from_favoruites => 'Remove from favourites';

  @override
  String get rename => 'Rename';

  @override
  String get reset_settings => 'Reset settings';

  @override
  String get search => 'Search';

  @override
  String get search_station => 'Search for a station';

  @override
  String get settings => 'Settings';

  @override
  String get tabs_favourites => 'Favourites';

  @override
  String get tabs_route => 'Planning';

  @override
  String get tabs_search => 'Search';

  @override
  String get themes => 'Themes';

  @override
  String get timetable => 'Timetable';

  @override
  String get to => 'to';

  @override
  String get travel_duration => 'Travel duration';

  @override
  String get use_current_location => 'Use current location';

  @override
  String get use_current_time => 'Use current time';

  @override
  String walk(String walk) {
    return 'Walk *$walk*.';
  }

  @override
  String walk_and_wait(String wait, String walk) {
    return 'Walk *$walk* and wait *$wait*.';
  }

  @override
  String get what_to_do => 'What to do ?';

  @override
  String get yes => 'Yes';

  @override
  String youll_be_there(String time) {
    return 'You arrive at *$time*.';
  }

  @override
  String get suggestion => 'Suggestion';

  @override
  String get live_route => 'Live route';

  @override
  String get share => 'Share';

  @override
  String get journey_informations => 'Journey information';

  @override
  String direction(String dir) {
    return 'Direction $dir';
  }

  @override
  String get itinerary => 'Itinerary';

  @override
  String get unable_locate => 'Unable to obtain location.';

  @override
  String get unsupported_area => 'You don\'t seem to be in a supported area.';

  @override
  String get contact_no_address => 'This contact doesn\'t have any address';

  @override
  String get contacts => 'Contacts';

  @override
  String get failed_get_contact => 'Failed to obtain the address book';

  @override
  String get new_fav => 'New favourite stop';

  @override
  String get no_contacts => 'Your address book is empty';

  @override
  String get customization => 'Customisation';
}
