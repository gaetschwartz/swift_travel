// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'de';

  static m0(walk) => "Gehen Sie *${walk}*.";

  static m1(walk, wait) => "*${walk}* gehen und *${wait}* warten.";

  static m2(time) => "Sie kommen zu *${time}*.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "add_to_favs" : MessageLookupByLibrary.simpleMessage("Zu Favoriten hinzufügen "),
    "arrival" : MessageLookupByLibrary.simpleMessage("Ankunft"),
    "brightness" : MessageLookupByLibrary.simpleMessage("Helligkeit"),
    "brightness_dark" : MessageLookupByLibrary.simpleMessage("Dunkelheit"),
    "brightness_light" : MessageLookupByLibrary.simpleMessage("Licht"),
    "brightness_system" : MessageLookupByLibrary.simpleMessage("System"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Abbrechen"),
    "continue_" : MessageLookupByLibrary.simpleMessage("Fortsetzen"),
    "delete" : MessageLookupByLibrary.simpleMessage("Löschen"),
    "delete_fav" : MessageLookupByLibrary.simpleMessage("Favorit löschen?"),
    "departure" : MessageLookupByLibrary.simpleMessage("Abreise"),
    "destination" : MessageLookupByLibrary.simpleMessage("Ziel"),
    "developer" : MessageLookupByLibrary.simpleMessage("Entwickler"),
    "done" : MessageLookupByLibrary.simpleMessage("Erledigt"),
    "fav_route" : MessageLookupByLibrary.simpleMessage("Route speichern"),
    "find_a_route" : MessageLookupByLibrary.simpleMessage("Finde eine Route"),
    "from" : MessageLookupByLibrary.simpleMessage("Von"),
    "maps_app" : MessageLookupByLibrary.simpleMessage("Karten-App"),
    "more" : MessageLookupByLibrary.simpleMessage("Mehr"),
    "navigation_api" : MessageLookupByLibrary.simpleMessage("Navigation-API"),
    "no" : MessageLookupByLibrary.simpleMessage("Nein"),
    "our_team" : MessageLookupByLibrary.simpleMessage("Unser Team"),
    "remove_from_favoruites" : MessageLookupByLibrary.simpleMessage("Aus Favoriten entfernen"),
    "rename" : MessageLookupByLibrary.simpleMessage("Umbenennen"),
    "reset_settings" : MessageLookupByLibrary.simpleMessage("Einstellungen zurücksetzen"),
    "search" : MessageLookupByLibrary.simpleMessage("Suche"),
    "search_station" : MessageLookupByLibrary.simpleMessage("Suche nach einer Station"),
    "settings" : MessageLookupByLibrary.simpleMessage("Einstellungen"),
    "tabs_favourites" : MessageLookupByLibrary.simpleMessage("Favoriten"),
    "tabs_route" : MessageLookupByLibrary.simpleMessage("Reiseplan"),
    "tabs_search" : MessageLookupByLibrary.simpleMessage("Suchen"),
    "themes" : MessageLookupByLibrary.simpleMessage("Themen"),
    "to" : MessageLookupByLibrary.simpleMessage("zu"),
    "travel_duration" : MessageLookupByLibrary.simpleMessage("Reisedauer"),
    "use_current_location" : MessageLookupByLibrary.simpleMessage("Aktuellen Standort verwenden"),
    "use_current_time" : MessageLookupByLibrary.simpleMessage("Aktuelle Zeit verwenden"),
    "walk" : m0,
    "walk_and_wait" : m1,
    "what_to_do" : MessageLookupByLibrary.simpleMessage("Was ist zu tun?"),
    "yes" : MessageLookupByLibrary.simpleMessage("Ja"),
    "youll_be_there" : m2
  };
}
