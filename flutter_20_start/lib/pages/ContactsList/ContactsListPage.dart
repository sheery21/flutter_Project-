import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Contactslistpage extends StatefulWidget {
  const Contactslistpage({super.key});

  @override
  State<Contactslistpage> createState() => _ContactslistpageState();
}

class _ContactslistpageState extends State<Contactslistpage> {
  List<Contact> contacts = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  Future<void> getContacts() async {
    final permission = await Permission.contacts.request();

    if (permission.isGranted) {
      final result = await ContactsService.getContacts();
      setState(() {
        contacts = result.toList();
        loading = false;
      });
    } else {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Contacts")),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  leading: CircleAvatar(child: Text(contact.initials())),
                  title: Text(contact.displayName ?? "No Name"),
                  subtitle: Text(
                    contact.phones!.isNotEmpty
                        ? contact.phones!.first.value ?? ""
                        : "No Number",
                  ),
                );
              },
            ),
    );
  }
}
