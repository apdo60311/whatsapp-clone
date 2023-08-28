import 'package:whatsapp_clone/shared/colors.dart';
import 'package:whatsapp_clone/shared/components.dart';
import 'package:flutter/material.dart';

import 'create_community.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        newCommunityBar(onTap: () {
          navigateTo(context: context, to: const CreateCommunityScreen());
        }),
      ],
    );
  }

  Widget newCommunityBar({required onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0,
                1), // set the offset to (0,1) to create a shadow at the bottom
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              createCommunityIcon(),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'New Community',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack createCommunityIcon() {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorsData.greyColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(10),
          child: Icon(
            Icons.group,
            color: ColorsData.iconsColor,
            size: 33,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const CircleAvatar(
            radius: 10,
            child: Icon(
              Icons.add,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}
