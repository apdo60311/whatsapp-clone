import 'package:whatsapp_clone/shared/colors.dart';
import 'package:flutter/material.dart';

import '../../shared/components.dart';

class CreateCommunityScreen extends StatefulWidget {
  const CreateCommunityScreen({super.key});

  @override
  State<CreateCommunityScreen> createState() => _CreateCommunityScreenState();
}

class _CreateCommunityScreenState extends State<CreateCommunityScreen> {
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setDefaultDescriptionValue();
  }

  void setDefaultDescriptionValue() {
    descriptionController.text =
        'Hi everyone! This cimmunity is for members to chat in topic-based groupes and get important updates';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New community'),
        backgroundColor: ColorsData.themePrimaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help_outline),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: ColorsData.greyColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: const Icon(
                      Icons.people,
                      color: Colors.white,
                      size: 70.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'change photo',
                    style: TextStyle(color: ColorsData.blackColor),
                  )
                ],
              ),
            ),
            verticalSeperator(),
            TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                label: const Text(
                  'Community name',
                  style: TextStyle(fontSize: 17),
                ),
                floatingLabelStyle: TextStyle(
                  color: ColorsData.blackColor,
                ),
                labelStyle: TextStyle(
                  color: Colors.grey.shade400,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorsData.blackColor,
                  ),
                ),
              ),
              maxLength: 100,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            verticalSeperator(),
            Container(
              padding: const EdgeInsets.only(top: 10.0),
              color: Colors.grey.shade200,
              child: TextField(
                controller: descriptionController,
                style: const TextStyle(overflow: TextOverflow.clip),
                maxLines: 5,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  hintText:
                      'what\'s this community for? It\'s helpful to add rules for your members.',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorsData.blackColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton(icon: Icons.arrow_forward),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  SizedBox verticalSeperator() {
    return const SizedBox(
      height: 30.0,
    );
  }
}
