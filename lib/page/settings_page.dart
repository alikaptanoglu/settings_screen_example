import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:settings_screen_example/page/settings/account_page.dart';
import 'package:settings_screen_example/page/settings/header_page.dart';
import 'package:settings_screen_example/page/settings/notifications_page.dart';
import 'package:settings_screen_example/utils.dart';
import 'package:settings_screen_example/widget/icon_widget.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(24),
            children: [
              HeaderPage(),
              SettingsGroup(
                title: 'GENERAL',
                children: <Widget>[
                  AccountPage(),
                  NotificationsPage(),
                  buildLogout(),
                  buildDeleteAccount(),
                ],
              ),
              const SizedBox(height: 32),
              SettingsGroup(
                title: 'FEEDBACK',
                children: <Widget>[
                  const SizedBox(height: 8),
                  buildReportBug(context),
                  buildSendFeedback(context),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildLogout() => SimpleSettingsTile(
        title: 'Logout',
        subtitle: '',
        leading: IconWidget(icon: Icons.logout, color: Colors.blueAccent),
        onTap: () {
          Utils.showSnackBar(context, 'Clicked Logout');
        },
      );

  Widget buildDeleteAccount() => SimpleSettingsTile(
        title: 'Delete Account',
        subtitle: '',
        leading: IconWidget(icon: Icons.delete, color: Colors.pink),
        onTap: () => Utils.showSnackBar(context, 'Clicked Delete Account'),
      );

  Widget buildReportBug(BuildContext context) => SimpleSettingsTile(
        title: 'Report A Bug',
        subtitle: '',
        leading: IconWidget(icon: Icons.bug_report, color: Colors.teal),
        onTap: () => Utils.showSnackBar(context, 'Clicked Report A Bug'),
      );

  Widget buildSendFeedback(BuildContext context) => SimpleSettingsTile(
        title: 'Send Feedback',
        subtitle: '',
        leading: IconWidget(icon: Icons.thumb_up, color: Colors.purple),
        onTap: () => Utils.showSnackBar(context, 'Clicked SendFeedback'),
      );
}
