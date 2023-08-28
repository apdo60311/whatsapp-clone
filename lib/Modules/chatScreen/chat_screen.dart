import 'package:flutter/material.dart';
import 'package:whatsapp_clone/shared/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.lastSeen});
  final String image;
  final String name;
  final String lastSeen;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  bool isMessageEmpty = true;

  @override
  Widget build(BuildContext context) {
    messageController.addListener(() {
      setState(() {
        if (messageController.text.isNotEmpty) {
          isMessageEmpty = false;
        } else {
          isMessageEmpty = true;
        }
      });
    });
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 25,
        backgroundColor: ColorsData.themePrimaryColor,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.asset(
                widget.image,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    widget.lastSeen,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              IconData(0xe6a8, fontFamily: 'MaterialIcons'),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.phone,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/whatsappBackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.face,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: messageController,
                          decoration: const InputDecoration(
                            hintText: 'Message',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 17),
                            border: InputBorder.none,
                          ),
                          cursorHeight: 20,
                          cursorColor: ColorsData.themePrimaryColor,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.link,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          (isMessageEmpty)
                              ? const Icon(
                                  Icons.camera_alt_rounded,
                                  color: Colors.grey,
                                )
                              : Container(),
                        ],
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                CircleAvatar(
                  radius: 21,
                  backgroundColor: ColorsData.themePrimaryColor,
                  child: (isMessageEmpty)
                      ? const Icon(Icons.mic)
                      : const Icon(Icons.send),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
