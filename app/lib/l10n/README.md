
# Adding support for a new locale

1. Create a new file named `intl_your_locale_code.arb` i.e `intl_es.arb` for Spanish in `lib/l10n/`
2. Copy the content of `lib/l10n/intl_en.arb` to your newly created file and make sure to modify the `@@locale` field to the appropriate language.
3. Translate each field.

## I don't know what my language's code is

Refer to https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements for a list of all country codes.
