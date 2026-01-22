import 'package:flutter/material.dart';
import 'package:flutter_20_start/pages/ContactsList/ContactsListPage.dart';
import 'package:flutter_20_start/pages/profile/profile_page.dart';
import 'package:flutter_20_start/pages/search/search_page.dart';
import 'package:flutter_20_start/providers/user_Provider.dart';
import 'package:flutter_20_start/widgets/ColorsField/colorsField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

  enum AppBarActionType {
  profile,
  call,
  contacts,
  settings,
}
class Customappbarfield extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBarActionType actionType;

  const Customappbarfield({
    super.key,
    required this.title,
    required this.actionType,
  });

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colorsfield.customBlackColorField(),
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsetsGeometry.only(right: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xff051D13),
                  radius: 20,
                  child: IconButton(
                    icon: const Icon(
                      Icons.search,
                      size: 32,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SearchPage()),
                      );
                    },
                  ),
                ),

                /// 🏠 Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                /// 👤 Profile Icon (conditional)
                _buildActionIcon(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionIcon(BuildContext context) {
    switch (actionType) {
      case AppBarActionType.profile:
        return IconButton(
          icon: Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              if (userProvider.imageUrl != null &&
                  userProvider.imageUrl!.isNotEmpty) {
                return CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(userProvider.imageUrl!),
                );
              }
              return const Icon(FontAwesomeIcons.circleUser);
            },
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfilePage()),
            );
          },
        );
      case AppBarActionType.call:
        return IconButton(
          icon: const Icon(Icons.call, color: Colors.white, size: 26),
          onPressed: () {
            debugPrint("Call icon pressed");
          },
        );

      case AppBarActionType.contacts:
        return IconButton(
          icon: const Icon(Icons.contact_page, color: Colors.white, size: 26),
          onPressed: () {
            Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const Contactslistpage(),
        ),
      );
          },
        );

      case AppBarActionType.settings:
        return IconButton(
          icon: const Icon(Icons.settings, color: Colors.white, size: 26),
          onPressed: () {
            debugPrint("Settings icon pressed");
          },
        );
    }
  }
}
