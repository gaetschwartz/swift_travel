import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';

Future<Contact?> showContactPicker(BuildContext context) => showCupertinoDialog<Contact>(
      context: context,
      builder: (context) => const ContactsDialog(),
    );

class ContactsDialog extends StatefulWidget {
  const ContactsDialog({Key? key}) : super(key: key);

  @override
  _ContactsDialogState createState() => _ContactsDialogState();
}

class _ContactsDialogState extends State<ContactsDialog> {
  List<Contact>? contacts;

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  Future<void> getContacts() async {
    final c = (await ContactsService.getContacts(withThumbnails: true))
        .where((e) => e.postalAddresses != null && e.postalAddresses!.isNotEmpty)
        .toList();
    setState(() {
      contacts = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
      cupertinoBuilder: (context, child) => CupertinoPageScaffold(
        navigationBar: const SwiftCupertinoBar(
          transitionBetweenRoutes: false,
          middle: Text("Contacts"),
        ),
        child: child!,
      ),
      materialBuilder: (context, child) => Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          title: const Text("Contacts"),
        ),
        body: child,
      ),
      child: contacts == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: contacts!.length,
              itemBuilder: (context, i) {
                final c = contacts!.elementAt(i);
                return ListTile(
                  title: Text(c.displayName ?? ""),
                  onTap: () => Navigator.of(context).pop(c),
                );
              },
            ),
    );
  }
}
