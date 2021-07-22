import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:settings_screen_example/utils.dart';
import 'package:settings_screen_example/widget/icon_widget.dart';

class HeaderPage extends StatelessWidget {
  static const keyDarkMode = 'key-dark-mode';

  @override
  Widget build(BuildContext context) => Column(
        children: [
          buildHeader(),
          const SizedBox(height: 32),
          buildUser(context),
          buildDarkMode(),
        ],
      );

  Widget buildDarkMode() => SwitchSettingsTile(
        settingKey: keyDarkMode,
        leading: IconWidget(
          icon: Icons.dark_mode,
          color: Color(0xFF642ef3),
        ),
        title: 'Dark Mode',
        onChange: (_) {},
      );

  Widget buildHeader() => Center(
        child: Text(
          'Settings',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1,
          ),
        ),
      );

  Widget buildUser(BuildContext context) => InkWell(
        onTap: () => Utils.showSnackBar(context, 'Clicked User'),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              ClipOval(
                child: Image.network(
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                ),
              ),
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sarah Abs',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '+1 90211 44 44',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.chevron_right_sharp),
            ],
          ),
        ),
      );
}
