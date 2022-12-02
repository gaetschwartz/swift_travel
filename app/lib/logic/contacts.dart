import 'package:contacts_service/contacts_service.dart';
import 'package:gaets_logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:swift_travel/constants/env.dart';

class ContactsRepository {
  ContactsRepository._();

  static final instance = ContactsRepository._();

  bool _granted = false;
  ContactsData? _data;

  /// ttl is in seconds, default is 1 hour
  int ttl = 3600;

  final log = Logger.of('ContactsRepository');

  Future<Iterable<Contact>> getAll({
    bool withThumbnails = false,
  }) async {
    if (Env.doMockContacts) {
      return const [
        Contact(
          displayName: 'John Doe',
          postalAddresses: [
            PostalAddress(street: 'Chemin des colombettes 34, 1202 Genève')
          ],
        )
      ];
    }
    if (!_granted) {
      final status = await Permission.contacts.request();
      log.log('Status1: $status');

      _granted = status.isGranted;
      if (!_granted) {
        throw Exception('Contacts permission is needed. Status: $status');
      }
    }

    if (_data == null || _data!.isExpired(ttl)) {
      final data = ContactsData(
        await ContactsService.getContacts(withThumbnails: withThumbnails)
            .then((value) => value.toList()),
        DateTime.now(),
      );
      _data = data;
      return data.contacts;
    } else {
      return _data!.contacts;
    }
  }
}

class ContactsData {
  const ContactsData(this.contacts, this.timestamp);

  final List<Contact> contacts;
  final DateTime timestamp;

  bool isExpired(int ttl) {
    final now = DateTime.now();
    final diff = now.difference(timestamp);
    return diff.inSeconds > ttl;
  }
}
