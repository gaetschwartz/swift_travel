
// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get add_to_favs => 'Zu Favoriten hinzufügen ';

  @override
  String get arrival => 'Ankunft';

  @override
  String get brightness => 'Helligkeit';

  @override
  String get brightness_dark => 'Dunkelheit';

  @override
  String get brightness_light => 'Licht';

  @override
  String get brightness_system => 'System';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get close => 'Schließen';

  @override
  String get continue_ => 'Fortsetzen';

  @override
  String get current_location => 'Aktueller Standort';

  @override
  String get delete => 'Löschen';

  @override
  String get delete_fav => 'Favorit löschen?';

  @override
  String get departure => 'Abreise';

  @override
  String get destination => 'Ziel';

  @override
  String get developer => 'Entwickler';

  @override
  String get done => 'Erledigt';

  @override
  String get fav_route => 'Route speichern';

  @override
  String get find_a_route => 'Finde eine Route';

  @override
  String get font => 'Schriftart';

  @override
  String get from => 'von';

  @override
  String get maps_app => 'Karten-App';

  @override
  String get more => 'Mehr';

  @override
  String get navigation_api => 'Navigation-API';

  @override
  String get no => 'Nein';

  @override
  String get our_team => 'Unser Team';

  @override
  String get remove_from_favoruites => 'Aus Favoriten entfernen';

  @override
  String get rename => 'Umbenennen';

  @override
  String get reset_settings => 'Einstellungen zurücksetzen';

  @override
  String get search => 'Suche';

  @override
  String get search_station => 'Suche nach einer Station';

  @override
  String get settings => 'Einstellungen';

  @override
  String get tabs_favourites => 'Favoriten';

  @override
  String get tabs_route => 'Reiseplan';

  @override
  String get tabs_search => 'Suchen';

  @override
  String get themes => 'Themen';

  @override
  String get timetable => 'Fahrplan';

  @override
  String get to => 'zu';

  @override
  String get travel_duration => 'Reisedauer';

  @override
  String get use_current_location => 'Aktuellen Standort verwenden';

  @override
  String get use_current_time => 'Aktuelle Zeit verwenden';

  @override
  String walk(String walk) {
    return 'Gehen Sie *${walk}*.';
  }

  @override
  String walk_and_wait(String wait, String walk) {
    return '*${walk}* gehen und *${wait}* warten.';
  }

  @override
  String get what_to_do => 'Was ist zu tun?';

  @override
  String get yes => 'Ja';

  @override
  String youll_be_there(String time) {
    return 'Sie kommen zu *${time}*.';
  }

  @override
  String get suggestion => 'Vorschlag';

  @override
  String get live_route => 'Live-Strecke';

  @override
  String get share => 'Aktie';
}
