import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../constants/images.dart';
import '../../../../routes/app_pages.dart';

class EmployeeGridItemView extends GetView {
  const EmployeeGridItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GridItem(),
    );
  }
}

/// TODO : Remove from here
///
///
class Employee {
  Employee(
      {required this.id,
      required this.employeeName,
      required this.mobile,
      required this.workLocation,
      required this.pinCode,
      required this.latitude,
      required this.emailId,
      required this.longitude,
      required this.dateOfJoining,
      required this.experience,
      required this.status,
      required this.sendPwd,
      required this.designation});

  final int id;
  final String employeeName;
  final String mobile;
  final String designation;
  final String emailId;
  final String workLocation;
  final String pinCode;
  final String latitude;
  final String longitude;
  final String dateOfJoining;
  final String experience;
  final String status;
  final String sendPwd;
}

class GridItem extends StatelessWidget {
  const GridItem({super.key});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = (MediaQuery.of(context).size.width / 330).floor();
    double aspectRatio = 1.75;
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10.0,
            childAspectRatio: aspectRatio),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(Routes.EMPLOYEE_PROFILE);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFE8E7EA),
                  width: 2.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          'https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Text('Teena Datt'),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE7F8F0),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Active',
                                    style: TextStyle(color: Color(0xFF10A760)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(I.icLocation),
                              const SizedBox(
                                width: 4,
                              ),
                              const Text(
                                'Gurgaon ',
                                style: TextStyle(color: Colors.red),
                              ),
                              const Text(
                                'Associate (1.5 years)',
                                style: TextStyle(color: Color(0xFF7D7A83)),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pin code',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF7D7A83)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '222162',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Latitude',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF7D7A83)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '222162.3',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Longitude',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF7D7A83)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '222162.2',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DOJ',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF7D7A83)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '10/12/2022',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE6F1F9),
                        ),
                        child: IconButton(
                          icon: SvgPicture.asset(I.icCall2),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF5F1FD),
                        ),
                        child: IconButton(
                          icon: SvgPicture.asset(I.icSms1),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE7F8F0),
                        ),
                        child: IconButton(
                          icon: SvgPicture.asset(I.icEditSmall),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFEF4E6),
                        ),
                        child: IconButton(
                          icon: SvgPicture.asset(I.icUpload),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFEECEB),
                        ),
                        child: IconButton(
                          iconSize: 100,
                          icon: SvgPicture.asset(I.icTrashSmall),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Widget grid({required BuildContext context, required List<Employee> dataList}) {
//   int crossAxisCount = (MediaQuery.of(context).size.width / 330).floor();
//   double aspectRatio = 1.75;
//   return SizedBox(
//     width: double.infinity,
//     height: MediaQuery.of(context).size.height * 0.7,
//     child: GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: crossAxisCount, // Number of columns in the grid
//           crossAxisSpacing: 10, // Spacing between columns
//           mainAxisSpacing: 10.0,
//           childAspectRatio: aspectRatio // Spacing between rows
//           ),
//       itemCount: 10, // Number of items in the grid
//       itemBuilder: (BuildContext context, int index) {
//         return InkWell(
//           onTap: () {
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(builder: (context) => const EmployeeProfile()),
//             // );
//             Get.toNamed(Routes.EMPLOYEE_PROFILE);
//             // const EmployeeProfilePage();
//           },
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20), // Border radius
//               border: Border.all(
//                 color: const Color(0xFFE8E7EA), // Border color
//                 width: 2.0, // Border width
//               ),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Row(
//                   children: [
//                     ClipOval(
//                       child: Image.network(
//                         'https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
//                         width: 50, // Set the desired width
//                         height: 50, // Set the desired height
//                         fit: BoxFit.cover, // Choose the fitting strategy
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 8,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Row(
//                           children: [
//                             const Text('Teena Datt'),
//                             const SizedBox(
//                               width: 8,
//                             ),
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 16, vertical: 4),
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFFE7F8F0),
//                                 borderRadius: BorderRadius.circular(
//                                     20.0), // Adjust the radius as needed
//                               ),
//                               child: const Center(
//                                 child: Text(
//                                   'Active',
//                                   style: TextStyle(color: Color(0xFF10A760)),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             // SvgPicture.asset('assets/svg/location.svg'),
//                             SvgPicture.asset(I.icLocation),
//                             const SizedBox(
//                               width: 4,
//                             ),
//                             const Text(
//                               'Gurgaon ',
//                               style: TextStyle(color: Colors.red),
//                             ),
//                             const Text(
//                               'Associate (1.5 years)',
//                               style: TextStyle(color: Color(0xFF7D7A83)),
//                             ),
//                           ],
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Pin code',
//                           style:
//                               TextStyle(fontSize: 12, color: Color(0xFF7D7A83)),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           '222162',
//                           style: TextStyle(fontSize: 14),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Latitude',
//                           style:
//                               TextStyle(fontSize: 12, color: Color(0xFF7D7A83)),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           '222162.3',
//                           style: TextStyle(fontSize: 14),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Longitude',
//                           style:
//                               TextStyle(fontSize: 12, color: Color(0xFF7D7A83)),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           '222162.2',
//                           style: TextStyle(fontSize: 14),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'DOJ',
//                           style:
//                               TextStyle(fontSize: 12, color: Color(0xFF7D7A83)),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           '10/12/2022',
//                           style: TextStyle(fontSize: 14),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(top: 8),
//                   child: Divider(
//                     color: Colors.grey, // Set the color of the line
//                     thickness: 1, // Set the thickness of the line
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       width: 40,
//                       height: 40,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Color(0xFFE6F1F9),
//                       ),
//                       child: IconButton(
//                         // icon: SvgPicture.asset('assets/svg/call.svg'),
//                         icon: SvgPicture.asset(I.icCall1),
//                         onPressed: () {
//                           // Handle button press
//                         },
//                       ),
//                     ),
//                     Container(
//                       width: 40,
//                       height: 40,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Color(0xFFF5F1FD),
//                       ),
//                       child: IconButton(
//                         // icon: SvgPicture.asset('assets/svg/sms.svg'),
//                         icon: SvgPicture.asset(I.icSms),
//                         onPressed: () {},
//                       ),
//                     ),
//                     Container(
//                       width: 40,
//                       height: 40,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Color(0xFFE7F8F0),
//                       ),
//                       child: IconButton(
//                         // icon: SvgPicture.asset('assets/svg/edit.svg'),
//                         icon: SvgPicture.asset(I.icEditSmall),
//                         onPressed: () {},
//                       ),
//                     ),
//                     Container(
//                       width: 40,
//                       height: 40,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Color(0xFFFEF4E6),
//                       ),
//                       child: IconButton(
//                         // icon: SvgPicture.asset('assets/svg/upload.svg'),
//                         icon: SvgPicture.asset(I.icUpload),
//                         onPressed: () {},
//                       ),
//                     ),
//                     Container(
//                       width: 40,
//                       height: 40,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Color(0xFFFEECEB),
//                       ),
//                       child: IconButton(
//                         iconSize: 100,
//                         // icon: SvgPicture.asset('assets/svg/trash.svg'),
//                         icon: SvgPicture.asset(I.icTrashSmall),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     ),
//   );


// }
