import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp_clone/Models/setting.dart';
import 'package:whatsapp_clone/shared/colors.dart';

import '../../shared/components.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<Setting> settings = [
    Setting(
        name: 'Account',
        subText: 'Security notification, change number',
        icon: FontAwesomeIcons.key),
    Setting(
        name: 'Privacy',
        subText: 'Block contacts, disappearing messages',
        icon: FontAwesomeIcons.lock),
    Setting(
        name: 'Avatar',
        subText: 'Create, edit,profile photo',
        icon: Icons.face),
    Setting(
        name: 'Chats',
        subText: 'Theme, wallpapers,chat history',
        icon: FontAwesomeIcons.message),
    Setting(
        name: 'Notifications',
        subText: 'Message, group & call tones',
        icon: Icons.notifications),
    Setting(
        name: 'Storage and data',
        subText: 'Network usage, auto-download',
        icon: Icons.storage),
    Setting(
        name: 'App languages',
        subText: 'phone\'s language',
        icon: Icons.language),
    Setting(
        name: 'Help',
        subText: 'Help center, contact us, privacy policy',
        icon: Icons.help_outline_outlined),
    Setting(
      name: 'Invite a friend',
      subText: '',
      icon: Icons.people,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: ColorsData.themePrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            profileBar(),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey.shade200,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => [
                        ...settings.map((e) => settingItem(settingData: e))
                      ][index],
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 35.0,
                      ),
                  itemCount: settings.length),
            ),
            const SizedBox(
              height: 20.0,
            ),
            fromMetaLogo(),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  Padding profileBar() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          personIcon('assets/images/user.png', size: 30),
          const SizedBox(
            width: 15.0,
          ),
          const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ABDO',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'اللهم صلي علي سيدنا محمد',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.qr_code,
            color: ColorsData.themePrimaryColor,
            size: 25,
          ),
        ],
      ),
    );
  }

  Column fromMetaLogo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'from',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              FontAwesomeIcons.meta,
              size: 15,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Meta',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget settingItem({required Setting settingData}) {
    return Row(
      children: [
        Icon(
          settingData.icon,
          color: Colors.grey,
          size: 20,
        ),
        const SizedBox(
          width: 20.0,
        ),
        (settingData.subText.isNotEmpty)
            ? Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      settingData.name,
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      settingData.subText,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            : Text(
                settingData.name,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w400,
                ),
              ),
      ],
    );
  }
}
