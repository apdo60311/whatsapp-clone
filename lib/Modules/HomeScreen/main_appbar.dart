import 'package:whatsapp_clone/Modules/linkedDevicesScreen/linked_devices_screen.dart';
import 'package:whatsapp_clone/shared/components.dart';
import 'package:flutter/material.dart';

import '../../shared/colors.dart';
import '../SettingsScreen/settings_screen.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key,
    required this.tabController,
    required this.isScrolled,
    required this.context,
  });

  final TabController tabController;
  final bool isScrolled;
  final BuildContext context;
  List<Widget> getTabs() => [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
          child: const Tab(
            icon: Icon(
              Icons.people_alt,
              size: 18,
            ),
          ),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.22,
            child: const Tab(text: 'Chats')),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.22,
            child: const Tab(text: 'Status')),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.22,
            child: const Tab(text: 'Calls')),
      ];

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorsData.themePrimaryColor,
      title: const Text(
        'WhatsApp',
        style: TextStyle(),
      ),
      pinned: true,
      floating: true,
      forceElevated: isScrolled,
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert_outlined),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 1,
              child: Text('Linked devices'),
            ),
            const PopupMenuItem(
              value: 2,
              child: Text('Settings'),
            ),
          ],
          onSelected: (value) {
            // Handle menu item selection
            switch (value) {
              case 1:
                navigateTo(
                  context: context,
                  to: const LinkedDevicesScreen(),
                );
                break;
              case 2:
                navigateTo(
                  context: context,
                  to: SettingsScreen(),
                );
                break;
            }
          },
        ),
      ],
      bottom: TabBar(
        isScrollable: true,
        indicatorColor: ColorsData.tabBarIndicatorColor,
        indicatorWeight: 3,
        tabs: getTabs(),
        controller: tabController,
      ),
    );
  }
}
