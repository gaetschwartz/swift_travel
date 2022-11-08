// ignore_for_file: non_constant_identifier_names

import 'app_localizations.dart';

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get add_to_favs => 'Ajouter aux Favoris';

  @override
  String get advanced_settings => 'Paramètres avancés';

  @override
  String get arrival => 'Arrivée';

  @override
  String get arrive => 'Arrivée';

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
  String get contact_no_address => 'Ce contact n\'a pas d\'adresse';

  @override
  String get contacts => 'Contacts';

  @override
  String get current_location => 'Localisation actuelle';

  @override
  String get customization => 'Personnalisation';

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
  String direction(String dir) {
    return 'Direction $dir';
  }

  @override
  String get done => 'Terminé';

  @override
  String get failed_get_contact =>
      'Impossible d\'obtenir le carnet d\'adresses';

  @override
  String get fav_route => 'Ajouter la route aux favoris';

  @override
  String get find_a_route => 'Faire un itinéraire';

  @override
  String get font => 'Police';

  @override
  String get from => 'de';

  @override
  String get itinerary => 'Itinéraire';

  @override
  String get journey_informations => 'Itinéraire';

  @override
  String get live_route => 'Parcours en direct';

  @override
  String get maps_app => 'Application de cartes';

  @override
  String get more => 'Plus';

  @override
  String get navigation_api => 'API de navigation';

  @override
  String get new_fav => 'Nouvel arrêt préféré';

  @override
  String get no => 'Non';

  @override
  String get no_contacts => 'Votre carnet d\'adresses est vide';

  @override
  String get our_team => 'Notre équipe';

  @override
  String get remove_from_favoruites => 'Retirer des favoris';

  @override
  String get rename => 'Renommer';

  @override
  String get reset_settings => 'Réinitialiser les paramètres';

  @override
  String get route_to => 'Itinéraire';

  @override
  String get search => 'Recherche';

  @override
  String get search_station => 'Rechercher une station';

  @override
  String get settings => 'Paramètres';

  @override
  String get share => 'Partager';

  @override
  String get share_as_image => 'Partager comme image';

  @override
  String get start => 'Départ';

  @override
  String get suggestion => 'Suggestion';

  @override
  String get tabs_favourites => 'Favoris';

  @override
  String get tabs_route => 'Planifier';

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
  String get unable_locate => 'Impossible d\'obtenir la localisation.';

  @override
  String get unsupported_area =>
      'Vous n\'avez pas l\'air d\'être dans une zone prise en charge.';

  @override
  String get use_current_location => 'Utiliser l\'emplacement actuel';

  @override
  String get use_current_time => 'Utiliser l\'heure actuelle';

  @override
  String walk(String walk) {
    return 'Marchez *$walk*.';
  }

  @override
  String walk_and_wait(String wait, String walk) {
    return 'Marchez *$walk* et attendez *$wait*.';
  }

  @override
  String get what_to_do => 'Que faire ?';

  @override
  String get yes => 'Oui';

  @override
  String youll_be_there(String time) {
    return 'Vous arrivez à *$time*.';
  }

  @override
  String get continue_welcome => 'Continuer';
}
