import 'package:flutter/material.dart';
import 'package:dart_programing/constants/colors.dart';
import 'package:dart_programing/constants/images.dart';
import 'package:svg_flutter/svg.dart';

/// Leads and My Teams
/// ===
class DashboardLeadsMyteams extends StatelessWidget {
  const DashboardLeadsMyteams({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: _Leads()),
        SizedBox(width: 16),
        Expanded(child: _MyTeams()),
      ],
    );
  }
}

/// TODO: Replace with actual model
///
///
class TempLeadModel {
  final String name;
  final String code;
  final String contact;
  final String date;
  final String status;
  const TempLeadModel({
    required this.name,
    required this.code,
    required this.contact,
    required this.date,
    required this.status,
  });
}

class TempCardModel {
  final String name;
  final String code;
  final String accountType;
  final String address;
  final String lastLogin;
  final String image;
  const TempCardModel({
    required this.name,
    required this.code,
    required this.accountType,
    required this.address,
    required this.lastLogin,
    required this.image,
  });
}

class _Leads extends StatelessWidget {
  const _Leads();
  static const tableData = [
    TempLeadModel(
        name: 'Ashutosh',
        code: '#2457009',
        contact: '7903400115',
        date: '02 Jul 23',
        status: 'Warm'),
    TempLeadModel(
        name: 'Gaurav',
        code: '#2457009',
        contact: '7903400115',
        date: '02 Jul 23',
        status: 'Warm'),
    TempLeadModel(
        name: 'Ankit',
        code: '#2457009',
        contact: '7903400115',
        date: '02 Jul 23',
        status: 'Warm'),
    TempLeadModel(
        name: 'Bhavneet',
        code: '#2457009',
        contact: '7903400115',
        date: '02 Jul 23',
        status: 'Sold Out'),
    TempLeadModel(
        name: 'Vikram',
        code: '#2457009',
        contact: '7903400115',
        date: '02 Jul 23',
        status: 'Warm'),
  ];

  (Color bg, Color txt) statusColor(String status) {
    switch (status) {
      case 'Warm':
        return (C.success50, C.success600);
      case 'Sold Out':
        return (C.error50, C.error);
      default:
        return (C.success50, C.success600);
    }
  }

  // Pass Data inside
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
              tableHeaderCell('Code'),
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
                    tableCell(tableData[index].code),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Leads',
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
        const SizedBox(height: 16),
      ],
    );
  }
}

class _MyTeams extends StatelessWidget {
  const _MyTeams();

  static const image = 'https://picsum.photos/200/300';
  static const cardData = [
    TempCardModel(
        name: 'Ankit Kumar',
        code: 'EM4536',
        accountType: 'Admin Manager',
        address: 'Gurugram,Haryana',
        image: image,
        lastLogin: '22 August 2023, 15:35:00'),
    TempCardModel(
        name: 'Shruti S.',
        code: 'EM4536',
        accountType: 'Admin Manager',
        address: 'Gurugram,Haryana',
        image: image,
        lastLogin: '22 August 2023, 15:35:00'),
    TempCardModel(
        name: 'Vikram Mehta',
        code: 'EM4536',
        accountType: 'Admin Manager',
        address: 'Gurugram,Haryana',
        image: image,
        lastLogin: '22 August 2023, 15:35:00'),
    TempCardModel(
        name: 'Orange Marvin',
        code: 'EM4536',
        accountType: 'Admin Manager',
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

  Row cardCell(TempCardModel data) {
    return Row(
      children: [
        Expanded(
            child: Row(
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
                        child: Text(data.code,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: C.primary500)))
                  ],
                ),
                Text(
                  data.accountType,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: C.bluishGray400),
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
              'My Teams',
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
        const SizedBox(height: 16),
      ],
    );
  }
}
