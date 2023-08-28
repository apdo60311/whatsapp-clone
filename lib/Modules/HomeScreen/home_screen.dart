import 'package:whatsapp_clone/Modules/callsScreen/calls_screen.dart';
import 'package:whatsapp_clone/Modules/sendMessageScreen/send_message_screen.dart';
import 'package:whatsapp_clone/shared/components.dart';
import 'package:flutter/material.dart';

import '../../shared/colors.dart';
import '../CreateStatusScreen/create_status.dart';
import '../chatsScreen/chats_screen.dart';
import '../communityScreen/community_screen.dart';
import '../statusScreen/status_screen.dart';
import 'main_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  Screen currentScreen = Screen.chats;
  IconData floatingActionButtonIcon = Icons.message;
  Widget? fabDestination = SendMessageScreen();

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.index = 1;

    tabController.addListener(() {
      handleCurrentScreen(tabController);
      handleFloatingActionButtonIcon(currentScreen);
    });

    super.initState();
  }

  void handleCurrentScreen(tabController) {
    setState(() {
      switch (tabController.index) {
        case 0:
          currentScreen = Screen.community;
          break;
        case 1:
          currentScreen = Screen.chats;
          break;
        case 2:
          currentScreen = Screen.status;
          break;
        case 3:
          currentScreen = Screen.calls;
          break;
        default:
      }
    });
  }

  void handleFloatingActionButtonIcon(Screen currentScreen) {
    setState(
      () {
        switch (currentScreen) {
          case Screen.chats:
            floatingActionButtonIcon = Icons.message;
            fabDestination = SendMessageScreen();
            break;
          case Screen.status:
            floatingActionButtonIcon = Icons.camera_alt_rounded;
            fabDestination = null;
            break;
          case Screen.calls:
            floatingActionButtonIcon = Icons.add_call;
            fabDestination = null;
            break;
          case Screen.community:
            floatingActionButtonIcon = Icons.people;
            fabDestination = null;
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool isScrolled) => [
          MainAppBar(
            tabController: tabController,
            isScrolled: isScrolled,
            context: context,
          ),
        ],
        body: TabBarView(
          controller: tabController,
          physics: const BouncingScrollPhysics(),
          children: const [
            CommunityScreen(),
            ChatsScreen(),
            StatusScreen(),
            CallsScreen(),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          (currentScreen == Screen.status)
              ? floatingActionButton(
                  iconColor: ColorsData.blackColor,
                  icon: Icons.edit,
                  onclick: () {
                    navigateTo(
                      context: context,
                      to: const CreateStatusScreen(),
                    );
                  },
                  backgroundColor: ColorsData.greyColor,
                  radius: 24,
                )
              : const SizedBox(),
          const SizedBox(
            height: 10.0,
          ),
          (currentScreen == Screen.community)
              ? const SizedBox()
              : floatingActionButton(
                  icon: floatingActionButtonIcon,
                  onclick: () {
                    navigateTo(context: context, to: SendMessageScreen());
                  }),
        ],
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

enum Screen {
  chats,
  status,
  calls,
  community,
}
