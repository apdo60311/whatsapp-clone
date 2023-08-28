import 'package:flutter/material.dart';

import '../../shared/colors.dart';

class StatusView extends StatefulWidget {
  const StatusView({
    super.key,
    required this.name,
    required this.time,
    required this.status,
    required this.text,
  });
  final String name;
  final String text;
  final String time;
  final dynamic status;
  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: const SafeArea(
          child: LinearProgressIndicator(
            value: 0.5,
            minHeight: 1.4,
            backgroundColor: Colors.grey,
            color: Colors.white,
          ),
        ),
        leadingWidth: 110,
        backgroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.name),
            Text(
              widget.time,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: ColorsData.greyColor,
                child: Icon(
                  Icons.person,
                  color: ColorsData.iconsColor,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 25,
          ),
          child: Column(
            children: [
              const Spacer(),
              widget.status ??
                  const Center(
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
              const Spacer(),
              Text(
                widget.text,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: const [
                    Icon(
                      IconData(0xe356, fontFamily: 'MaterialIcons'),
                      color: Colors.white,
                    ),
                    Text(
                      'Reply',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
