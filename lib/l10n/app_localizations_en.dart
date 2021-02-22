
// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

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
  String get tabs_route => 'Itinerary';

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
    return 'Walk *${walk}*.';
  }

  @override
  String walk_and_wait(String wait, String walk) {
    return 'Walk *${walk}* and wait *${wait}*.';
  }

  @override
  String get what_to_do => 'What to do ?';

  @override
  String get yes => 'Yes';

  @override
  String youll_be_there(String time) {
    return 'You arrive at *${time}*.';
  }
}
