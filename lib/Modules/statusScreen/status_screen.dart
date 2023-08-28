import 'package:dotted_border/dotted_border.dart';
import 'package:whatsapp_clone/Modules/statusScreen/status_view.dart';
import 'package:whatsapp_clone/shared/components.dart';
import 'package:flutter/material.dart';

import '../../shared/colors.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List statusList = [
      itemBar(
        icon: statusIcon(
          count: 30,
          firstStatusIcon: Image.asset('assets/images/Joyce.jpg'),
        ),
        title: 'Joyce M Miller',
        subText: '15 minutes ago',
        context: context,
        to: StatusView(
          name: 'Joyce M Miller',
          status: Image.asset('assets/images/Joyce.jpg'),
          time: '15 minutes ago',
          text: 'Random text',
        ),
      ),
      itemBar(
        icon: statusIcon(
          count: 0,
          firstStatusIcon: Image.asset('assets/images/Dwayne.jpg'),
        ),
        title: 'Dwayne S Robertson',
        subText: 'Today, 1:17 AM',
        context: context,
        to: StatusView(
          name: 'Dwayne S Robertson',
          status: Image.asset('assets/images/Dwayne.jpg'),
          time: '45 minutes ago',
          text: 'Random Text',
        ),
      ),
      itemBar(
          context: context,
          to: null,
          icon: statusIcon(count: 0),
          title: 'Amy F Jones',
          subText: 'Today, 5:17 PM'),
      itemBar(
          context: context,
          to: null,
          icon: statusIcon(count: 0),
          title: 'Amy F Jones',
          subText: 'Yesterday, 1:17 AM'),
      itemBar(
          context: context,
          to: null,
          icon: statusIcon(count: 0),
          title: 'William D Caro',
          subText: '45 minutes ago'),
      itemBar(
          context: context,
          to: null,
          icon: statusIcon(count: 0),
          title: 'Donna J Hinshaw',
          subText: 'Today, 10:37 AM'),
      itemBar(
          context: context,
          to: null,
          icon: statusIcon(count: 0),
          title: 'Daniel M Salinas',
          subText: 'Yesterday, 10:27 AM'),
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            itemBar(
              icon: createStatusIcon(),
              title: 'My status',
              subText: 'Tap to add status update',
              context: context,
              to: null,
            ),
            labelBar(text: 'Recent updates'),
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => statusList[index],
                itemCount: statusList.length),
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

  Widget createStatusIcon() {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: ColorsData.greyColor,
          child: Icon(
            Icons.person,
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

  Widget statusIcon({dynamic firstStatusIcon, required int count}) {
    return DottedBorder(
      borderType: BorderType.Circle,
      dashPattern: handleDottedBorderPattern(8),
      strokeWidth: 2.2,
      color: Colors.green,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: ColorsData.greyColor,
        child: (firstStatusIcon != null)
            ? Opacity(
                opacity: 0.7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: firstStatusIcon,
                ),
              )
            : Icon(
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
