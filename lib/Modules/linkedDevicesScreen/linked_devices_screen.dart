import 'package:whatsapp_clone/shared/colors.dart';
import 'package:flutter/material.dart';

import '../../shared/components.dart';

class LinkedDevicesScreen extends StatelessWidget {
  const LinkedDevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsData.themePrimaryColor,
        elevation: 0,
        title: const Text('Linked devices'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 55.0, vertical: 25.0),
              child: Image.asset(
                'assets/images/xx.png',
              ),
            ),
            const Text(
              'Use whatsApp on web, Desktop, and other devices.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                'Learn more',
                style: TextStyle(color: Colors.lightBlue.shade700),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            defaultTextButton(
                width: MediaQuery.of(context).size.width * 0.9,
                text: 'Link a device',
                onClick: () {},
                height: 40),
            const SizedBox(
              height: 22,
            ),
            encryptionLabel(),
          ],
        ),
      ),
    );
  }
}

Row encryptionLabel() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
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
      Column(
        children: [
          Row(
            children: [
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
          ),
          const Text(
            'on all your devices',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      )
    ],
  );
}
