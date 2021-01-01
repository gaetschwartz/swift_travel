// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
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
  String get localeName => 'it';

  static m0(walk) => "Cammina ${walk}";

  static m1(walk, wait) => "Camminare ${walk} e aspettare ${wait}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "add_to_favs" : MessageLookupByLibrary.simpleMessage("Aggiungi ai preferiti"),
    "arrival" : MessageLookupByLibrary.simpleMessage("Arrivo"),
    "brightness" : MessageLookupByLibrary.simpleMessage("Luminosità"),
    "brightness_dark" : MessageLookupByLibrary.simpleMessage("Scuro"),
    "brightness_light" : MessageLookupByLibrary.simpleMessage("Luce"),
    "brightness_system" : MessageLookupByLibrary.simpleMessage("Sistema"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Annulla"),
    "continue_" : MessageLookupByLibrary.simpleMessage("Continua"),
    "delete" : MessageLookupByLibrary.simpleMessage("Cancellare"),
    "departure" : MessageLookupByLibrary.simpleMessage("Partenza"),
    "destination" : MessageLookupByLibrary.simpleMessage("Destinazione"),
    "developer" : MessageLookupByLibrary.simpleMessage("Sviluppatore"),
    "fav_route" : MessageLookupByLibrary.simpleMessage("Salvare il percorso"),
    "find_a_route" : MessageLookupByLibrary.simpleMessage("Trova un percorso"),
    "from" : MessageLookupByLibrary.simpleMessage("A partire dal"),
    "maps_app" : MessageLookupByLibrary.simpleMessage("Applicazione mappe"),
    "more" : MessageLookupByLibrary.simpleMessage("Altro"),
    "navigation_api" : MessageLookupByLibrary.simpleMessage("API di navigazione"),
    "no" : MessageLookupByLibrary.simpleMessage("No"),
    "our_team" : MessageLookupByLibrary.simpleMessage("Il nostro team"),
    "remove_from_favoruites" : MessageLookupByLibrary.simpleMessage("Rimuovi dai preferiti"),
    "rename" : MessageLookupByLibrary.simpleMessage("Rinominare"),
    "reset_settings" : MessageLookupByLibrary.simpleMessage("Reimpostare le impostazioni"),
    "search" : MessageLookupByLibrary.simpleMessage("Ricerca"),
    "search_station" : MessageLookupByLibrary.simpleMessage("Cerca una stazione"),
    "settings" : MessageLookupByLibrary.simpleMessage("Impostazioni"),
    "tabs_favourites" : MessageLookupByLibrary.simpleMessage("Preferiti"),
    "tabs_route" : MessageLookupByLibrary.simpleMessage("Percorso"),
    "tabs_search" : MessageLookupByLibrary.simpleMessage("Ricerca"),
    "themes" : MessageLookupByLibrary.simpleMessage("Temi"),
    "to" : MessageLookupByLibrary.simpleMessage("a"),
    "travel_duration" : MessageLookupByLibrary.simpleMessage("Durata del viaggio"),
    "use_current_location" : MessageLookupByLibrary.simpleMessage("Utilizzare la posizione corrente"),
    "use_current_time" : MessageLookupByLibrary.simpleMessage("Utilizzare l\'ora corrente"),
    "walk" : m0,
    "walk_and_wait" : m1,
    "what_to_do" : MessageLookupByLibrary.simpleMessage("Cosa fare?"),
    "yes" : MessageLookupByLibrary.simpleMessage("Sì"),
    "youll_be_there" : MessageLookupByLibrary.simpleMessage("Sarai presente al")
  };
}
