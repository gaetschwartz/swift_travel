
// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get add_to_favs => 'Ajouter aux Favoris';

  @override
  String get arrival => 'Arrivée';

  @override
  String get brightness => 'Luminosité';

  @override
  String get brightness_dark => 'Foncé';

  @override
  String get brightness_light => 'Clair';

  @override
  String get brightness_system => 'Système';

  @override
  String get cancel => 'Annuler';

  @override
  String get close => 'Fermer';

  @override
  String get continue_ => 'Continuer';

  @override
  String get current_location => 'Localisation actuelle';

  @override
  String get delete => 'Supprimer';

  @override
  String get delete_fav => 'Supprimer le favori?';

  @override
  String get departure => 'Départ';

  @override
  String get destination => 'Destination';

  @override
  String get developer => 'Développeur';

  @override
  String get done => 'Terminé';

  @override
  String get fav_route => 'Ajouter la route aux favoris';

  @override
  String get find_a_route => 'Faire un itinéraire';

  @override
  String get font => 'Police';

  @override
  String get from => 'de';

  @override
  String get maps_app => 'Application de cartes';

  @override
  String get more => 'Plus';

  @override
  String get navigation_api => 'API de navigation';

  @override
  String get no => 'Non';

  @override
  String get our_team => 'Notre équipe';

  @override
  String get remove_from_favoruites => 'Retirer des favoris';

  @override
  String get rename => 'Renommer';

  @override
  String get reset_settings => 'Réinitialiser les paramètres';

  @override
  String get search => 'Recherche';

  @override
  String get search_station => 'Rechercher une station';

  @override
  String get settings => 'Paramètres';

  @override
  String get tabs_favourites => 'Favoris';

  @override
  String get tabs_route => 'Itinéraire';

  @override
  String get tabs_search => 'Recherche';

  @override
  String get themes => 'Thèmes';

  @override
  String get timetable => 'Horaire';

  @override
  String get to => 'à';

  @override
  String get travel_duration => 'Durée du voyage';

  @override
  String get use_current_location => 'Utiliser l\'emplacement actuel';

  @override
  String get use_current_time => 'Utiliser l\'heure actuelle';

  @override
  String walk(String walk) {
    return 'Marchez *${walk}*.';
  }

  @override
  String walk_and_wait(String wait, String walk) {
    return 'Marchez *${walk}* et attendez *${wait}*.';
  }

  @override
  String get what_to_do => 'Que faire ?';

  @override
  String get yes => 'Oui';

  @override
  String youll_be_there(String time) {
    return 'Vous arrivez à *${time}*.';
  }
}
