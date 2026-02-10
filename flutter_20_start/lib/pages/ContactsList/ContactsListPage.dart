import 'package:flutter/material.dart';
import 'package:flutter_20_start/pages/chatPage/chatPage.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
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
    debugPrint("Permission status: $permission");
    if (!permission.isGranted) {
      debugPrint("Contacts permission denied");
      setState(() => loading = false);
      return;
    }

    final result = await FlutterContacts.getContacts(
      withProperties: true,
      withPhoto: false,
    );

    debugPrint("Total contacts: ${result.length}");

    setState(() {
      contacts = result;
      loading = false;
    });
  }

  // ✅ helper method class ke andar, function ke bahar
  String getInitials(String name) {
    if (name.isEmpty) return "?";

    final parts = name.trim().split(" ");
    if (parts.length == 1) {
      return parts.first[0].toUpperCase();
    }
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Contacts")),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : contacts.isEmpty
          ? const Center(child: Text("No contacts found"))
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];

                final phone = contact.phones.isNotEmpty
                    ? contact.phones.first.number
                    : "No Number";

                return ListTile(
                  leading: CircleAvatar(
                    child: Text(getInitials(contact.displayName)),
                  ),
                  title: Text(
                    contact.displayName.isNotEmpty
                        ? contact.displayName
                        : "No Name",
                  ),
                  subtitle: Text(phone),
                  onTap: () {
                    final receiverId = phone;
                    final chatId = generateChatId("USER_123", receiverId);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Chatpage(
                          chatId: chatId,
                          receiverId: receiverId,
                          receiverName: contact.displayName,
                          receiverImage:
                              "", // contacts mein image nahi hoti usually
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }

  void sendContactRequest({required String name, required String phone}) {
    debugPrint("Request sent to:");
    debugPrint("Name: $name");
    debugPrint("Phone: $phone");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Contact request sent to $name"),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  String generateChatId(String uid1, String uid2) {
    return uid1.compareTo(uid2) < 0 ? "${uid1}_$uid2" : "${uid2}_$uid1";
  }
}
