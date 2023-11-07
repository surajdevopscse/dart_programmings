import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/images.dart';

class LeadStatusAction extends StatelessWidget {
  const LeadStatusAction({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 140,
      ),
      children: const [
        CustumeContainer(
          image: I.icCube,
          header: 'Upcoming Expired Lead',
          title1: '12',
          title2: '27',
          title3: '08',
          color: C.error50,
        ),
        CustumeContainer(
          image: I.icCalendar1,
          header: 'Demo Schedule',
          title1: '09',
          title2: '40',
          title3: '05',
          color: C.success50,
        ),
        CustumeContainer(
          image: I.icCall,
          header: 'Call Back',
          title1: '04',
          title2: '33',
          title3: '06',
          color: C.primary50,
        ),
      ],
    );
  }
}

class CustumeContainer extends StatelessWidget {
  final String image;
  final String header;
  final Color color;
  final String title1;
  final String title2;
  final String title3;

  const CustumeContainer({
    required this.image,
    required this.header,
    required this.color,
    required this.title1,
    required this.title2,
    required this.title3,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 20, left: 16, right: 16),
      // height: 140,
      // width: 380,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: C.border)),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: SvgPicture.asset(image),
              ),
              const SizedBox(width: 8),
              Text(
                header,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: C.primaryText),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title1,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: C.primaryText),
                    ),
                    const Text(
                      'Today',
                      style: TextStyle(fontSize: 14, color: C.primaryText),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title2,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: C.primaryText),
                    ),
                    const Text(
                      'Tommorrow',
                      style: TextStyle(fontSize: 14, color: C.primaryText),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title3,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: C.primaryText),
                    ),
                    const Text(
                      'Next Day',
                      style: TextStyle(fontSize: 14, color: C.primaryText),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
