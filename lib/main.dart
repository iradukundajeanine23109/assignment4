import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'edit_profile_screen.dart';
import 'contacts_screen.dart'; // Import the contacts screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      drawer: buildDrawer(context), // Pass context to buildDrawer
      body: Center(
        child: Text(S.of(context).message),
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          buildUserAccountsDrawerHeader(),
          buildListTile(context), // Pass context to buildListTile
        ],
      ),
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text("Jeanine"),
      accountEmail: Text("iradukundajeanine@.com"),
      currentAccountPicture: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfileScreen()),
          );
        },
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/profile_picture.png"),
        ),
      ),
    );
  }

  ListTile buildListTile(BuildContext context) {
    return ListTile(
      title: Text(S.of(context).contacts),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ContactsScreen()),
        );
      },
    );
  }
}
