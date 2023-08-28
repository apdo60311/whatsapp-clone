import 'package:whatsapp_clone/shared/colors.dart';
import 'package:flutter/material.dart';

class ArchivedScreen extends StatelessWidget {
  const ArchivedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsData.themePrimaryColor,
        elevation: 0,
        title: const Text('Archived'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [chatsSettingsLabel(), const Spacer(), encryptionLabel()],
        ),
      ),
    );
  }

  Row encryptionLabel() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.lock,
          color: Colors.grey.shade700,
          size: 15,
        ),
        const SizedBox(
          width: 5.0,
        ),
        const Text(
          'Your personal messages are ',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        InkWell(
          onTap: () {},
          child: const Text(
            'end-to-end encrypted',
            style: TextStyle(fontSize: 12, color: Colors.green),
          ),
        ),
      ],
    );
  }

  Padding chatsSettingsLabel() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 60.0,
        right: 60.0,
        top: 20.0,
        bottom: 20.0,
      ),
      child: Text(
        'These chats stay archived when new messages are recieved. Tap to change.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }
}
