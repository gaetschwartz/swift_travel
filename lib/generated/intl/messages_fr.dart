// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static m0(walk) => "Marchez *${walk}*.";

  static m1(walk, wait) => "Marchez *${walk}* et attendez *${wait}*.";

  static m2(time) => "Vous arrivez à *${time}*.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "add_to_favs" : MessageLookupByLibrary.simpleMessage("Ajouter aux Favoris"),
    "arrival" : MessageLookupByLibrary.simpleMessage("Arrivée"),
    "brightness" : MessageLookupByLibrary.simpleMessage("Luminosité"),
    "brightness_dark" : MessageLookupByLibrary.simpleMessage("Foncé"),
    "brightness_light" : MessageLookupByLibrary.simpleMessage("Clair"),
    "brightness_system" : MessageLookupByLibrary.simpleMessage("Système"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Annuler"),
    "close" : MessageLookupByLibrary.simpleMessage("Fermer"),
    "continue_" : MessageLookupByLibrary.simpleMessage("Continuer"),
    "current_location" : MessageLookupByLibrary.simpleMessage("Localisation actuelle"),
    "delete" : MessageLookupByLibrary.simpleMessage("Supprimer"),
    "delete_fav" : MessageLookupByLibrary.simpleMessage("Supprimer le favori?"),
    "departure" : MessageLookupByLibrary.simpleMessage("Départ"),
    "destination" : MessageLookupByLibrary.simpleMessage("Destination"),
    "developer" : MessageLookupByLibrary.simpleMessage("Développeur"),
    "done" : MessageLookupByLibrary.simpleMessage("Terminé"),
    "fav_route" : MessageLookupByLibrary.simpleMessage("Ajouter la route aux favoris"),
    "find_a_route" : MessageLookupByLibrary.simpleMessage("Faire un itinéraire"),
    "from" : MessageLookupByLibrary.simpleMessage("De"),
    "maps_app" : MessageLookupByLibrary.simpleMessage("Application de cartes"),
    "more" : MessageLookupByLibrary.simpleMessage("Plus"),
    "navigation_api" : MessageLookupByLibrary.simpleMessage("API de navigation"),
    "no" : MessageLookupByLibrary.simpleMessage("Non"),
    "our_team" : MessageLookupByLibrary.simpleMessage("Notre équipe"),
    "remove_from_favoruites" : MessageLookupByLibrary.simpleMessage("Retirer des favoris"),
    "rename" : MessageLookupByLibrary.simpleMessage("Renommer"),
    "reset_settings" : MessageLookupByLibrary.simpleMessage("Réinitialiser les paramètres"),
    "search" : MessageLookupByLibrary.simpleMessage("Recherche"),
    "search_station" : MessageLookupByLibrary.simpleMessage("Rechercher une station"),
    "settings" : MessageLookupByLibrary.simpleMessage("Paramètres"),
    "tabs_favourites" : MessageLookupByLibrary.simpleMessage("Favoris"),
    "tabs_route" : MessageLookupByLibrary.simpleMessage("Itinéraire"),
    "tabs_search" : MessageLookupByLibrary.simpleMessage("Recherche"),
    "themes" : MessageLookupByLibrary.simpleMessage("Thèmes"),
    "to" : MessageLookupByLibrary.simpleMessage("à"),
    "travel_duration" : MessageLookupByLibrary.simpleMessage("Durée du voyage"),
    "use_current_location" : MessageLookupByLibrary.simpleMessage("Utiliser l\'emplacement actuel"),
    "use_current_time" : MessageLookupByLibrary.simpleMessage("Utiliser l\'heure actuelle"),
    "walk" : m0,
    "walk_and_wait" : m1,
    "what_to_do" : MessageLookupByLibrary.simpleMessage("Que faire ?"),
    "yes" : MessageLookupByLibrary.simpleMessage("Oui"),
    "youll_be_there" : m2
  };
}
