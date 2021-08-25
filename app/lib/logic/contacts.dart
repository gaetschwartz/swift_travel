import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:swift_travel/utils/strings/strings.dart';

class ContactsRepository {
  ContactsRepository._();

  static late final instance = ContactsRepository._();

  bool _granted = false;
  Iterable<Contact>? _contacts;

  Future<Iterable<Contact>> query(String q) async {
    if (!_granted) {
      _granted = await Permission.contacts.request().isGranted;
    }
    if (_granted) {
      _contacts ??= await ContactsService.getContacts(withThumbnails: false);
      final list = _contacts!
          .where((element) => element.displayName != null)
          .map((e) => MapEntry(e, levenshtein(e.displayName!, q)))
          .toList(growable: false);
      list.sort((a, b) => a.value.compareTo(b.value));
      return list.map((e) => e.key);
    } else {
      return const Iterable.empty();
    }
  }
}
