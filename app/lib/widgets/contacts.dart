import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/logic/contacts.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:vibration/vibration.dart';

Future<Contact?> showContactPicker(BuildContext context) =>
    CupertinoScaffold.showCupertinoModalBottomSheet<Contact>(
      context: context,
      builder: (context) => const ContactsDialog(),
    );

final contactsProvider =
    FutureProvider((ref) async => (await ContactsRepository.instance.getAll()).toList());

final _filteredContacts = FutureProvider((ref) async {
  final contacts = await ContactsRepository.instance.getAll();
  return contacts.where((c) => c.postalAddresses.isNotEmpty).toList();
});

class ContactsDialog extends StatelessWidget {
  const ContactsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
      cupertinoBuilder: (context, child) => CupertinoPageScaffold(
        navigationBar: SwiftCupertinoBar(
          transitionBetweenRoutes: false,
          middle: Text(AppLocalizations.of(context).contacts),
        ),
        child: child!,
      ),
      materialBuilder: (context, child) => Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          title: Text(AppLocalizations.of(context).contacts),
        ),
        body: child,
      ),
      child: Material(child: Consumer(builder: (context, w, _) {
        return w(_filteredContacts).when(
          data: (contacts) => contacts.isNotEmpty
              ? ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, i) {
                    final c = contacts[i];
                    return ListTile(
                      title: Text(c.displayName ?? ""),
                      onTap: () {
                        Vibration.instance.select();
                        Navigator.of(context).pop(c);
                      },
                    );
                  },
                )
              : Center(
                  child: Text(AppLocalizations.of(context).no_contacts),
                ),
          loading: () => const Center(child: CircularProgressIndicator.adaptive()),
          error: (e, s) {
            debugPrintStack(stackTrace: s, label: e.toString());
            return Center(
              child: Text(
                AppLocalizations.of(context).failed_get_contact,
              ),
            );
          },
        );
      })),
    );
  }
}
