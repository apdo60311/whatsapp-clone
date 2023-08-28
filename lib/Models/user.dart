// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:whatsapp_clone/Models/chat_type.dart';
import 'package:whatsapp_clone/Models/chatable.dart';

class User extends Chatable {
  String phoneNumber;
  String lastSeen;
  @override
  String name;
  @override
  dynamic image;
  @override
  String bio;
  @override
  ChatType type;

  User({
    required this.phoneNumber,
    required this.lastSeen,
    required this.name,
    required this.image,
    required this.bio,
    required this.type,
  });
}
