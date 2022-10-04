import 'package:isar/isar.dart';

@collection
class Email {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(type: IndexType.value)
  String? title;

  List<Recipient>? recipients;

  @enumerated
  Status status = Status.sending;
}

@embedded
class Recipient {
  String? name;

  String? address;
}

enum Status {
  draft,
  sending,
  sent,
}
