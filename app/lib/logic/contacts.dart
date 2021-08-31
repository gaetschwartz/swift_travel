import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:swift_travel/constants/env.dart';

class ContactsRepository {
  ContactsRepository._();

  static late final instance = ContactsRepository._();

  bool _granted = false;
  Iterable<Contact>? _contacts;

  Future<Iterable<Contact>> getAll({bool cache = false, bool withThumbnails = false}) async {
    if (Env.doMockContacts) {
      return const [
        Contact(
          displayName: "John Doe",
          postalAddresses: [PostalAddress(street: "Chemin des colombettes 34, 1202 Genève")],
        )
      ];
    }
    if (!_granted) {
      final request = await Permission.contacts.request();
      print("Status1: $request");

      _granted = request.isGranted;
    }
    if (_granted) {
      if (cache) {
        _contacts ??= await ContactsService.getContacts(withThumbnails: withThumbnails);
        return _contacts!;
      } else {
        return await ContactsService.getContacts(withThumbnails: withThumbnails);
      }
    } else {
      final status = await Permission.contacts.status;
      print("Status2: $status");
      throw Exception("Contacts permission is needed. Status: $status");
    }
  }
}
