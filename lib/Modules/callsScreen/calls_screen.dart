import 'package:dotted_border/dotted_border.dart';
import 'package:whatsapp_clone/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../shared/colors.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List calls = [
      callItemBar(
        onClick: () {},
        icon: personIcon('assets/images/Joyce.jpg'),
        title: 'Joyce M Miller',
        subText: '(4) June 12,7:23 AM',
      ),
      callItemBar(
        onClick: () {},
        icon: personIcon('assets/images/Dwayne.jpg'),
        title: 'Dwayne S Robertson',
        subText: 'June 8,3:23 AM',
        isVideocall: true,
        isOutgoing: true,
      ),
      callItemBar(
        onClick: () {},
        icon: personIcon('assets/images/Amy.jpg'),
        title: 'Amy F Jones',
        subText: 'June 17,3:23 PM',
      ),
      callItemBar(
          onClick: () {},
          icon: personIcon('assets/images/William.jpg'),
          title: 'William D Caro',
          subText: '15 minutes ago'),
      callItemBar(
        onClick: () {},
        icon: personIcon('assets/images/Donna.jpg'),
        title: 'Donna J Hinshaw',
        subText: 'June 11,1:23 AM',
        isOutgoing: true,
      ),
      callItemBar(
          onClick: () {},
          icon: personIcon('assets/images/Daniel.jpg'),
          title: 'Daniel M Salinas',
          subText: '(3) June 2,5:23 PM'),
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            itemBar(
              icon: createStatusIcon(),
              title: 'Create call link',
              subText: 'Share a link for your WhatsApp call',
              context: context,
              to: null,
            ),
            labelBar(text: 'Recent'),
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => calls[index],
                itemCount: calls.length),
          ],
        ),
      ),
    );
  }

  Widget labelBar({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget callItemBar({
    required icon,
    required String title,
    required String subText,
    required void Function() onClick,
    bool isVideocall = false,
    bool isOutgoing = false,
  }) {
    return InkWell(
      onTap: onClick,
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
                Row(
                  children: [
                    (isOutgoing)
                        ? const Icon(
                            Icons.arrow_outward,
                            color: Colors.green,
                            size: 16,
                          )
                        : const Icon(
                            IconData(0xf607,
                                fontFamily: 'MaterialIcons',
                                matchTextDirection: true),
                            color: Colors.red,
                            size: 16,
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
            const Spacer(),
            Icon(
              (isVideocall)
                  ? const IconData(0xe6a8, fontFamily: 'MaterialIcons')
                  : Icons.call,
              color: ColorsData.themePrimaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget createStatusIcon() {
    return CircleAvatar(
      radius: 25,
      backgroundColor: ColorsData.themePrimaryColor,
      child: Icon(
        Icons.link,
        color: ColorsData.iconsColor,
        size: 33,
      ),
    );
  }

  Widget statusIcon({required int count}) {
    return DottedBorder(
      borderType: BorderType.Circle,
      dashPattern: handleDottedBorderPattern(8),
      strokeWidth: 2.2,
      color: Colors.green,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: ColorsData.greyColor,
        child: Icon(
          Icons.person,
          color: ColorsData.iconsColor,
          size: 33,
        ),
      ),
    );
  }

  List<double> handleDottedBorderPattern(int count) {
    List<double> pattern = [];
    switch (count) {
      case 0:
        pattern = [100, 0];
        break;
      case 1:
        pattern = [100, 0];
        break;
      case 2:
        pattern = [75, 2];
        break;
      case 3:
        pattern = [50, 2];
        break;
      case 4:
        pattern = [40, 2];
        break;
      case 5:
        pattern = [30, 2];
        break;
      case 6:
        pattern = [25, 2];
        break;
      case 7:
        pattern = [20, 2];
        break;
      default:
        pattern = [100 / count, 2];
    }
    return pattern;
  }
}
