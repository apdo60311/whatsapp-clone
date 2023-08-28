// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:whatsapp_clone/Models/chat_type.dart';
import 'package:whatsapp_clone/Models/chatable.dart';

class Contact extends Chatable {
  @override
  String bio;
  @override
  dynamic image;
  @override
  String name;
  @override
  ChatType type;

  Contact({
    required this.bio,
    required this.image,
    required this.name,
    required this.type,
  });
}
