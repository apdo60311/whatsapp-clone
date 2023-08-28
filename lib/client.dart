import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Models/chat_type.dart';
import 'package:whatsapp_clone/Models/user.dart';

class Client {
  List<User> chats = [
    User(
        phoneNumber: '',
        lastSeen: 'lastSeen',
        name: '',
        image: Image.asset(''),
        bio: '',
        type: ChatType.person),
  ];
}
