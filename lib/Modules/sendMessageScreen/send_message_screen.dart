import 'package:whatsapp_clone/Models/chat_type.dart';
import 'package:whatsapp_clone/Models/contact.dart';
import 'package:whatsapp_clone/shared/colors.dart';
import 'package:flutter/material.dart';

class SendMessageScreen extends StatefulWidget {
  SendMessageScreen({super.key});

  @override
  State<SendMessageScreen> createState() => _SendMessageScreenState();

  final List<Contact> contactsOnWhatsapp = [
    Contact(
      name: 'Joyce M Miller',
      image: Image.asset('assets/images/Joyce.jpg'),
      bio:
          'Award-winning twitter evangelist. Musicaholic. Unapologetic coffee fanatic. Reader.',
      type: ChatType.person,
    ),
    Contact(
      name: 'Dwayne S Robertson',
      image: Image.asset('assets/images/Dwayne.jpg'),
      bio:
          'Creator. Thinker. Alcohol practitioner. Entrepreneur. Web geek. Pop culture trailblazer.',
      type: ChatType.person,
    ),
    Contact(
      name: 'Amy F Jones',
      image: Image.asset('assets/images/Amy.jpg'),
      bio:
          'Troublemaker. Alcohol ninja. Freelance twitter geek. Passionate student.',
      type: ChatType.person,
    ),
    Contact(
      name: 'William D Caro',
      image: Image.asset('assets/images/William.jpg'),
      bio: 'Social media enthusiast.',
      type: ChatType.person,
    ),
    Contact(
      name: 'Donna J Hinshaw',
      image: Image.asset('assets/images/Donna.jpg'),
      bio: 'Unapologetic music junkie.',
      type: ChatType.person,
    ),
    Contact(
      name: 'Daniel M Salinas',
      image: Image.asset('assets/images/Daniel.jpg'),
      bio:
          'Lifelong coffee junkie. Unable to type with boxing gloves on. Freelance food practitioner.',
      type: ChatType.person,
    ),
    Contact(
      name: 'Kevin D Hill',
      image: Image.asset('assets/images/Kevin.jpg'),
      bio: 'Amateur coffee nerd.',
      type: ChatType.person,
    ),
  ];
}

class _SendMessageScreenState extends State<SendMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsData.themePrimaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select contact'),
            Text(
              '${widget.contactsOnWhatsapp.length} contacts',
              style:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sendMessageOption(
              title: 'New group',
              icon: const Icon(Icons.group),
              onClick: () {},
            ),
            sendMessageOption(
              title: 'New contact',
              icon: const Icon(Icons.person_add),
              onClick: () {},
              suffex: const Icon(
                Icons.qr_code,
                color: Colors.grey,
              ),
            ),
            sendMessageOption(
              title: 'New group',
              icon: const Icon(Icons.group),
              onClick: () {},
            ),
            textLabel(),
            ...widget.contactsOnWhatsapp.map((e) => contactItem(e))
          ],
        ),
      ),
    );
  }

  Widget contactItem(Contact e) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: CircleAvatar(
              radius: 19,
              child: e.image,
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  e.bio,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding textLabel() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Contacts on WhatsApp',
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
      ),
    );
  }

  InkWell sendMessageOption(
      {required String title, required icon, required onClick, suffex}) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 19,
              backgroundColor: ColorsData.themePrimaryColor.withGreen(155),
              foregroundColor: Colors.white,
              child: icon,
            ),
            const SizedBox(
              width: 15.0,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            const Spacer(),
            (suffex != null) ? suffex : const SizedBox(),
            const SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    );
  }
}
