import 'package:whatsapp_clone/Modules/chatScreen/chat_screen.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

Widget chatItem({
  required String name,
  required String image,
  required String lastMessage,
  required String date,
  required BuildContext context,
}) {
  return InkWell(
    onTap: () {
      navigateTo(
          context: context,
          to: ChatScreen(
            image: image,
            name: name,
            lastSeen: date,
          ));
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => popupDialog(image, name),
              );
            },
            child: personIcon(image),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                lastMessage,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            date,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    ),
  );
}

CircleAvatar personIcon(String image, {double size = 26}) {
  return CircleAvatar(
    radius: size,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(image),
    ),
  );
}

Center popupDialog(String image, String name) {
  return Center(
    child: Material(
      child: SizedBox(
        width: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Image.asset(
                  image,
                  width: 250,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.black.withOpacity(0.2),
                  child: Text(name),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.message,
                        color: Colors.green,
                      )),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call,
                        color: Colors.green,
                      )),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.green,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget archievedBar({
  required int archievedCount,
  onTap,
}) =>
    InkWell(
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.archive_outlined,
                color: Colors.green,
              ),
              onPressed: () {},
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('Archieved'),
            const Spacer(),
            Text(
              '$archievedCount',
              style: const TextStyle(
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );

Widget itemBar(
    {required icon,
    required String title,
    required String subText,
    required BuildContext context,
    required to}) {
  return InkWell(
    onTap: () {
      navigateTo(
        context: context,
        to: to,
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                subText,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Future<dynamic> navigateTo(
    {required BuildContext context, required Widget to}) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => to),
  );
}

Widget floatingActionButton({
  required IconData icon,
  double radius = 28.0,
  double? iconSize,
  Color iconColor = Colors.white,
  Color? backgroundColor,
  onclick,
}) {
  return InkWell(
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    focusColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: onclick ?? () {},
    child: CircleAvatar(
      backgroundColor: backgroundColor ?? ColorsData.themePrimaryColor,
      radius: radius,
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    ),
  );
}

Container defaultTextButton({
  required double width,
  required double height,
  required String text,
  required onClick,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: ColorsData.themePrimaryColor,
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: TextButton(
      onPressed: onClick,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
