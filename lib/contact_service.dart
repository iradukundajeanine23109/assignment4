import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> fetchContacts() async {
  if (await Permission.contacts.request().isGranted) {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    // Use contacts
  } else {
    // Handle permission denied
  }
}
