import 'package:flutter/material.dart';
import 'package:dart_programing/constants/colors.dart';
import 'package:dart_programing/constants/images.dart';
import 'package:svg_flutter/svg.dart';

/// Demo Scheduled And Sub Partners
/// ===
class DemoScheduledSubPartners extends StatelessWidget {
  const DemoScheduledSubPartners({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: _DemoScheduled()),
        SizedBox(width: 16),
        Expanded(child: _DemoScheduled()),
      ],
    );
  }
}

/// TODO: Replace with actual model
///
///

class TempTableModel {
  final String name;
  final String interest;
  final String contact;
  final String date;
  final String status;
  const TempTableModel({
    required this.name,
    required this.interest,
    required this.contact,
    required this.date,
    required this.status,
  });
}

class TempCardModel1 {
  final String name;
  final String interest;

  final String address;
  final String lastLogin;
  final String image;
  const TempCardModel1({
    required this.name,
    required this.interest,
    required this.address,
    required this.lastLogin,
    required this.image,
  });
}

// ignore: unused_element
class _SubPartners extends StatelessWidget {
  const _SubPartners({super.key});

  static const image = 'https://picsum.photos/200/300';
  static const cardData = [
    TempCardModel1(
        name: 'Ankit Kumar',
        interest: 'EM4536',
        address: 'Gurugram,Haryana',
        image: image,
        lastLogin: '22 August 2023, 15:35:00'),
    TempCardModel1(
        name: 'Shruti S.',
        interest: 'EM4536',
        address: 'Gurugram,Haryana',
        image: image,
        lastLogin: '22 August 2023, 15:35:00'),
    TempCardModel1(
        name: 'Vikram Mehta',
        interest: 'EM4536',
        address: 'Gurugram,Haryana',
        image: image,
        lastLogin: '22 August 2023, 15:35:00'),
    TempCardModel1(
        name: 'Orange Marvin',
        interest: 'EM4536',
        address: 'Gurugram,Haryana',
        image: image,
        lastLogin: '22 August 2023, 15:35:00'),
  ];

  Container card() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: C.border),
      ),
      child: SizedBox(
        height: 272,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: cardData.length,
          separatorBuilder: (BuildContext context, int index) {
            if (index < cardData.length - 1) {
              return const Divider(
                color: C.border,
                thickness: 1.0,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
          itemBuilder: (BuildContext context, int index) {
            return cardCell(cardData[index]);
          },
        ),
      ),
    );
  }

  Row cardCell(TempCardModel1 data) {
    return Row(
      children: [
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: C.backgroundColor,
              backgroundImage: NetworkImage(data.image),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      data.name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: C.primaryText),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: C.primary50,
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(data.interest,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: C.primary500)))
                  ],
                ),
                Text(
                  data.address,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: C.subTitleText),
                )
              ],
            )
          ],
        )),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset(I.icSms),
                const SizedBox(width: 16),
                SvgPicture.asset(I.icCall1),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Last Login: ${data.lastLogin}',
              style: const TextStyle(
                  fontSize: 8,
                  color: C.success600,
                  fontWeight: FontWeight.w400),
            )
          ],
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Sub Partners',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: C.primaryText),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'View All',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                  color: C.primary500,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        // card
        card(),
      ],
    );
  }
}

class _DemoScheduled extends StatelessWidget {
  const _DemoScheduled();

  static const tableData = [
    TempTableModel(
        name: 'Ashutosh',
        interest: 'Super App',
        contact: '7903400115',
        date: '02 Jul 23',
        status: 'Rescheduled'),
    TempTableModel(
        name: 'Gaurav',
        interest: 'Accounting',
        contact: '7903400115',
        date: '02 Jul 23',
        status: 'Done'),
    TempTableModel(
        name: 'Ankit',
        interest: 'Accounting',
        contact: '7903400115',
        date: '02 Jul 23',
        status: 'Pending'),
    TempTableModel(
        name: 'Bhavneet',
        interest: 'Super App',
        contact: '7903400115',
        date: '02 Jul 23',
        status: 'Cancelled'),
    TempTableModel(
        name: 'Vikram',
        interest: 'Neo App',
        contact: '7903400115',
        date: '02 Jul 23',
        status: 'Pending'),
  ];
  (Color bg, Color txt) statusColor(String status) {
    switch (status) {
      case 'Rescheduled':
        return (C.purple50, C.purple600);
      case 'Done':
        return (C.success50, C.success600);
      case 'Pending':
        return (C.warning50, C.warning600);
      case 'Cancelled':
        return (C.error50, C.error);
      default:
        return (C.success50, C.success600);
    }
  }

  Expanded tableHeaderCell(String title) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(color: C.border),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: C.primaryText),
        ),
      ),
    );
  }

  Expanded tableCell(String title, {bool isStatus = false}) {
    if (isStatus) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.only(left: 8, top: 12, bottom: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: statusColor(title).$1,
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: statusColor(title).$2),
          ),
        ),
      );
    }
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 8, top: 12, bottom: 12),
        decoration: const BoxDecoration(),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: C.subTitleText),
        ),
      ),
    );
  }

  Container table() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: C.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              tableHeaderCell('Name'),
              tableHeaderCell('Interest'),
              tableHeaderCell('Contact'),
              tableHeaderCell('Date'),
              tableHeaderCell('Status'),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 240,
            child: ListView.builder(
              itemCount: tableData.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    tableCell(tableData[index].name),
                    tableCell(tableData[index].interest),
                    tableCell(tableData[index].contact),
                    tableCell(tableData[index].date),
                    tableCell(tableData[index].status, isStatus: true),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Demo Scheduled',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: C.primaryText),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'View All',
                style: TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                  color: C.primary500,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        // Table
        table(),
      ],
    );
  }
}
