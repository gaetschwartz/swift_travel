// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static m0(walk) => "Walk *${walk}*.";

  static m1(walk, wait) => "Walk *${walk}* and wait *${wait}*.";

  static m2(time) => "You arrive at *${time}*.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "add_to_favs" : MessageLookupByLibrary.simpleMessage("Add to favourites"),
    "arrival" : MessageLookupByLibrary.simpleMessage("Arrival"),
    "brightness" : MessageLookupByLibrary.simpleMessage("Brightness"),
    "brightness_dark" : MessageLookupByLibrary.simpleMessage("Dark"),
    "brightness_light" : MessageLookupByLibrary.simpleMessage("Light"),
    "brightness_system" : MessageLookupByLibrary.simpleMessage("System"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "continue_" : MessageLookupByLibrary.simpleMessage("Continue"),
    "current_location" : MessageLookupByLibrary.simpleMessage("Current location"),
    "delete" : MessageLookupByLibrary.simpleMessage("Delete"),
    "delete_fav" : MessageLookupByLibrary.simpleMessage("Delete favourite ?"),
    "departure" : MessageLookupByLibrary.simpleMessage("Starting point"),
    "destination" : MessageLookupByLibrary.simpleMessage("Destination"),
    "developer" : MessageLookupByLibrary.simpleMessage("Developer"),
    "done" : MessageLookupByLibrary.simpleMessage("Done"),
    "fav_route" : MessageLookupByLibrary.simpleMessage("Save route"),
    "find_a_route" : MessageLookupByLibrary.simpleMessage("Find a route"),
    "from" : MessageLookupByLibrary.simpleMessage("From"),
    "maps_app" : MessageLookupByLibrary.simpleMessage("Maps app"),
    "more" : MessageLookupByLibrary.simpleMessage("More"),
    "navigation_api" : MessageLookupByLibrary.simpleMessage("Navigation API"),
    "no" : MessageLookupByLibrary.simpleMessage("No"),
    "our_team" : MessageLookupByLibrary.simpleMessage("Our team"),
    "remove_from_favoruites" : MessageLookupByLibrary.simpleMessage("Remove from favourites"),
    "rename" : MessageLookupByLibrary.simpleMessage("Rename"),
    "reset_settings" : MessageLookupByLibrary.simpleMessage("Reset settings"),
    "search" : MessageLookupByLibrary.simpleMessage("Search"),
    "search_station" : MessageLookupByLibrary.simpleMessage("Search for a station"),
    "settings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "tabs_favourites" : MessageLookupByLibrary.simpleMessage("Favourites"),
    "tabs_route" : MessageLookupByLibrary.simpleMessage("Itinerary"),
    "tabs_search" : MessageLookupByLibrary.simpleMessage("Search"),
    "themes" : MessageLookupByLibrary.simpleMessage("Themes"),
    "to" : MessageLookupByLibrary.simpleMessage("to"),
    "travel_duration" : MessageLookupByLibrary.simpleMessage("Travel duration"),
    "use_current_location" : MessageLookupByLibrary.simpleMessage("Use current location"),
    "use_current_time" : MessageLookupByLibrary.simpleMessage("Use current time"),
    "walk" : m0,
    "walk_and_wait" : m1,
    "what_to_do" : MessageLookupByLibrary.simpleMessage("What to do ?"),
    "yes" : MessageLookupByLibrary.simpleMessage("Yes"),
    "youll_be_there" : m2
  };
}
