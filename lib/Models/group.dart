// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:whatsapp_clone/Models/chat_type.dart';
import 'package:whatsapp_clone/Models/chatable.dart';

class Group extends Chatable {
  int membersCount;
  String creationDate;
  String createdBy;
  @override
  String bio;
  @override
  dynamic image;
  @override
  String name;
  @override
  ChatType type;

  Group({
    required this.membersCount,
    required this.creationDate,
    required this.createdBy,
    required this.bio,
    required this.image,
    required this.name,
    required this.type,
  });
}
