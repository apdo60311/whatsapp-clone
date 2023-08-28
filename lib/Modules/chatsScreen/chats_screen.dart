import 'package:flutter/material.dart';

import '../../shared/components.dart';
import '../archievedScreen/archived_screen.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    final List chats = [
      archievedBar(
          archievedCount: 3,
          onTap: () {
            navigateTo(context: context, to: const ArchivedScreen());
          }),
      chatItem(
        image: 'assets/images/Joyce.jpg',
        lastMessage: 'last message in this chat',
        name: 'Joyce M Miller',
        date: 'Yesterday',
        context: context,
      ),
      chatItem(
        image: 'assets/images/Dwayne.jpg',
        lastMessage: 'last message in this chat',
        name: 'Dwayne S Robertson',
        date: '8:40',
        context: context,
      ),
      chatItem(
        image: 'assets/images/Amy.jpg',
        lastMessage: 'last message in this chat',
        name: 'Amy F Jones',
        date: 'Yesterday',
        context: context,
      ),
      chatItem(
        image: 'assets/images/William.jpg',
        lastMessage: 'last message in this chat',
        name: 'William D Caro',
        date: '7:56',
        context: context,
      ),
      chatItem(
        image: 'assets/images/Donna.jpg',
        lastMessage: 'last message in this chat',
        name: 'Donna J Hinshaw',
        date: '3:31',
        context: context,
      ),
      chatItem(
        image: 'assets/images/Daniel.jpg',
        lastMessage: 'last message in this chat',
        name: 'Daniel M Salinas',
        date: '10:30',
        context: context,
      ),
      chatItem(
        image: 'assets/images/Kevin.jpg',
        lastMessage: 'last message in this chat',
        name: 'Kevin D Hill',
        date: 'Yesterday',
        context: context,
      ),
    ];

    return ListView.separated(
      padding: const EdgeInsets.only(top: 10),
      itemBuilder: (context, index) => chats[index],
      separatorBuilder: (context, index) => const SizedBox(
        height: 4.0,
      ),
      itemCount: chats.length,
    );
  }
}
