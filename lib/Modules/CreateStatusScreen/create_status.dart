import 'dart:math';
import 'package:whatsapp_clone/shared/colors.dart';
import 'package:flutter/material.dart';

import '../../shared/components.dart';

class CreateStatusScreen extends StatefulWidget {
  const CreateStatusScreen({super.key});

  @override
  State<CreateStatusScreen> createState() => _CreateStatusScreenState();
}

class _CreateStatusScreenState extends State<CreateStatusScreen> {
  List<Color> colors = [
    Colors.green.shade400,
    Colors.green,
    Colors.purple.shade400,
    Colors.purple,
    Colors.yellow.shade400,
    Colors.yellow,
    Colors.grey.shade400,
    Colors.grey,
    Colors.red.shade400,
    Colors.red,
    Colors.brown.shade400,
    Colors.brown.shade600,
  ];

  Color? currentBackgroundColor;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  int radioSelectedValue = 1;

  @override
  Widget build(BuildContext context) {
    currentBackgroundColor = colors[Random().nextInt(10)];
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: currentBackgroundColor,
      appBar: AppBar(
        backgroundColor: currentBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.face_5_outlined)),
          IconButton(
            onPressed: () {},
            icon: const Text(
              'T',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                currentBackgroundColor = colors[Random().nextInt(10)];
              });
            },
            icon: const Icon(Icons.color_lens),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            TextField(
              decoration: InputDecoration(
                hintText: 'Type a status',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              cursorHeight: 35,
              cursorColor: Colors.white.withOpacity(0.4),
            ),
            const Spacer(),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    changeWhoCanSeeStatus(onTap: () {
                      scaffoldKey.currentState!.showBottomSheet(
                        backgroundColor: Colors.transparent,
                        (context) => bottomSheet(context),
                      );
                    }),
                    const Spacer(),
                    recordAudioButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container bottomSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 25.0,
        bottom: 25.0,
        left: 15.0,
        right: 15.0,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Who can see my status updates',
              style: TextStyle(fontSize: 20),
            ),
          ),
          RadioListTile(
            title: const Text('My contacts'),
            value: 1,
            groupValue: radioSelectedValue,
            onChanged: (value) {
              setState(() {
                radioSelectedValue = 1;
              });
            },
            contentPadding: const EdgeInsets.all(0),
          ),
          RadioListTile(
            title: const Text('My contacts except...'),
            value: 2,
            groupValue: radioSelectedValue,
            onChanged: (value) {
              setState(() {
                radioSelectedValue = 2;
              });
            },
            contentPadding: const EdgeInsets.all(0),
          ),
          RadioListTile(
            title: const Text('Only share with...'),
            value: 3,
            groupValue: radioSelectedValue,
            onChanged: (value) {
              setState(() {
                radioSelectedValue = 3;
              });
            },
            contentPadding: const EdgeInsets.all(0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          defaultTextButton(
            width: MediaQuery.of(context).size.width * 0.9,
            text: 'Done',
            onClick: () {},
            height: 35.0,
          )
        ],
      ),
    );
  }

  InkWell recordAudioButton() {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        radius: 25,
        backgroundColor: ColorsData.themePrimaryColor,
        child: const Icon(Icons.mic),
      ),
    );
  }

  Widget changeWhoCanSeeStatus({required onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 145,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.black.withOpacity(0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.circle_outlined,
              color: Colors.white.withOpacity(0.7),
              size: 15,
            ),
            const SizedBox(
              width: 4.0,
            ),
            Text(
              'Status (contacts)',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
