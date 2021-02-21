
[![codecov](https://codecov.io/gh/gaetschwartz/swift_travel/branch/master/graph/badge.svg?token=BS53B3CBIN)](https://codecov.io/gh/gaetschwartz/swift_travel)

<img src="assets/logo/swift.png" width="32px"> 

# Swift Travel - Travel swiftly

This is an open-source public transport app packed with cool features 😎

It features: 

⭐ A beautiful route search and view

<img src="doc/assets/pictures/itinerary_search.png" width="150px" alt="Itinerary search"> <img src="doc/assets/pictures/itinerary.png" width="150px" alt="Itinerary">

⭐ A timetable

<img src="doc/assets/pictures/timetable.png" width="150px" alt="Timetable"> <img src="doc/assets/pictures/timetable_view.png" width="150px" alt="Itinerary view"> 

🤖 AI-powered smart suggestions

<img src="doc/assets/pictures/sugg1.png" width="150px" alt="Suggestion"> <img src="doc/assets/pictures/sugg_search.png" width="150px" alt="Suggestion in search bar"> 

# Documentation

## Contributing 

### Guidelines

If you want to contribute, fork the repository and create a pull-request with your new feature, and make sure to:
 - Describe it well
 - Include **necessary tests**
 - Follow the coding style

### Adding support for a new country

 - Read [ADDING-NEW-API.md](doc/ADDING-NEW-API.md)

### Adding support for a new language

1. Create a new file named `intl_you_locale_code.arb` i.e `intl_de.arb` for German in `lib/l10n/`
2. Copy the content of the `intl_en.arb` to your newly create file and make sure to modify the `@@locale` field to the appropriate language.
3. Translate each field.

