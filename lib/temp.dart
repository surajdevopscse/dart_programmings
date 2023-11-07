// //
// // import 'package:adaptive_theme/adaptive_theme.dart';
// // import 'package:flutter/material.dart';

// // import 'package:get/get.dart';
// // import 'package:dart_programing/theme/dark_theme.dart';
// // import 'package:dart_programing/theme/light_theme.dart';

// // import 'app/routes/app_pages.dart';
// // import 'services/settings/settings_service.dart';
// // import 'services/shared_preference_service/shared_preference_service.dart';
// // import 'services/webservice/webservice.dart';
// // import 'constants/strings/strings.dart';

// // Future<void> main() async {
// //   await initServices();

// //   /// AWAIT SERVICES INITIALIZATION.
// //   runApp(const MyApp());
// // }

// // Future<void> initServices() async {
// //   debugPrint('starting services ...');
// //   await Get.putAsync(() => SharedPreferenceService().init());
// //   await Get.putAsync(() => Webservice().init());
// //   await Get.putAsync(() => SettingsService().init());
// //   debugPrint('All services started...');
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return FutureBuilder<AdaptiveThemeMode?>(
// //       future: AdaptiveTheme.getThemeMode(),
// //       builder: (context, snapshot) {
// //         return AdaptiveTheme(
// //           light: AppLightTheme.data,
// //           dark: AppDarkTheme.data,
// //           debugShowFloatingThemeButton: true, // <------ add this line
// //           initial: snapshot.data ?? AdaptiveThemeMode.system,
// //           builder: (theme, darkTheme) {
// //             return GetMaterialApp(
// //               debugShowCheckedModeBanner: false,
// //               title: "Partner Portal",
// //               initialRoute: AppPages.INITIAL,
// //               getPages: AppPages.routes,
// //               translations: Strings(),
// //               locale: const Locale('en', 'US'),
// //               fallbackLocale: const Locale('en', 'US'),
// //               theme: theme,
// //               darkTheme: darkTheme,
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }
// // }

// import 'package:expandable_tree_menu/expandable_tree_menu.dart';
// import 'package:flutter/material.dart';
// import 'package:dart_programing/constants/images.dart';
// import 'package:svg_flutter/svg.dart';

// import 'constants/colors.dart';
// import 'constants/strings/string_keys.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: SideNavbar(),
//       ),
//     );
//   }
// }

// class SideNavbar extends StatefulWidget {
//   const SideNavbar({super.key});

//   @override
//   State<SideNavbar> createState() => _SideNavbarState();
// }

// class _SideNavbarState extends State<SideNavbar> {
//   bool isSelected = false;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Expanded(
//             flex: 304,
//             child: Container(
//               height: double.maxFinite,
//               decoration: const BoxDecoration(
//                   border: Border(right: BorderSide(color: C.bluishGray50))),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: SvgPicture.asset(I.icHBLogoBlue1),
//                     ),
//                     const Divider(
//                       indent: 16,
//                       endIndent: 16,
//                       color: C.bluishGray50,
//                     ),
//                     NavTile(
//                       title: SK.dashboard,
//                       image: isSelected ? I.icCategory2Active : I.icCategory2,
//                       onTap: () {
//                         isSelected = true;
//                         setState(() {});
//                       },
//                       isSelected: isSelected,
//                     ),
//                     ExpansionTile(
//                       title: Text(SK.partner),
//                       children: [
//                         ListTile(
//                           title: Text(SK.myPartners),
//                         ),
//                         ListTile(
//                           title: Text(SK.addPartner),
//                         ),
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(SK.employees),
//                       children: [
//                         ListTile(
//                           title: Text(SK.myEmployees),
//                         ),
//                         ListTile(
//                           title: Text(SK.addEmployee),
//                         ),
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(SK.lead),
//                       children: [
//                         ListTile(
//                           title: Text(SK.dashboard),
//                         ),
//                         ListTile(
//                           title: Text(SK.addLead),
//                         ),
//                         ListTile(
//                           title: Text(SK.assignLead),
//                         ),
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: Text(SK.license),
//                       children: [
//                         ListTile(
//                           title: Text(SK.licenseKey),
//                         ),
//                         ListTile(
//                           title: Text(SK.addLicenseKey),
//                         ),
//                         ListTile(
//                           title: Text(SK.transferLicenseKey),
//                         ),
//                         ListTile(
//                           title: Text(SK.requestLicenseKey),
//                         ),
//                       ],
//                     ),
//                     NavTile(
//                       title: SK.logout,
//                       image: I.icLogout,
//                       onTap: () {},
//                       isSelected: false,
//                     ),
//                     ExpandableTree(
//                       childIndent: 0,
//                       nodes: const [
//                         TreeNode(
//                           'Category A',
//                           subNodes: [
//                             TreeNode('CatA first item'),
//                             TreeNode('CatA second item'),
//                           ],
//                         ),
//                         TreeNode(
//                           'Category B',
//                           subNodes: [
//                             TreeNode('Cat B first item'),
//                             TreeNode(
//                               'Cat B sub-category 1',
//                               subNodes: [
//                                 TreeNode('Cat B1 first item'),
//                                 TreeNode('Cat B1 second item'),
//                                 TreeNode('Cat B1 third item'),
//                                 TreeNode('Cat B1 final item'),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                       nodeBuilder: (context, nodeValue) => Card(
//                         child: Text(nodeValue.toString()),
//                       ),
//                       onSelect: (node) => _nodeSelected(context, node),
//                     )
//                   ],
//                 ),
//               ),
//             )),
//         const Expanded(
//             flex: 1728,
//             child: Column(
//               children: [],
//             )),
//       ],
//     );
//   }

//   void _nodeSelected(context, nodeValue) {
//     print(nodeValue);
//     // final route =
//     //     MaterialPageRoute(builder: (context) => DetailPage(value: nodeValue));
//     // Navigator.of(context).push(route);
//   }
// }

// // class NavExpTile extends StatelessWidget {
// //   final List<Widget> items;
// //   final bool isTabed;
// //   final String titleText;
// //   final String tittleImage;
// //   const NavExpTile(
// //       {super.key,
// //       required this.items,
// //       required this.isTabed,
// //       required this.titleText,
// //       required this.tittleImage});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(horizontal: 8),
// //       // height: 50,
// //       alignment: Alignment.center,
// //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
// //       child: ExpansionTile(
// //         tilePadding: EdgeInsets.zero,
// //         backgroundColor: isTabed ? C.primary700 : C.pureWhite,
// //         title: Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 8),
// //           child: Row(
// //             children: [
// //               SvgPicture.asset(tittleImage),
// //               const SizedBox(width: 8),
// //               Text(
// //                 titleText,
// //                 style: TextStyle(
// //                     color: isTabed ? C.pureWhite : C.bluishGray400,
// //                     fontSize: 16,
// //                     fontWeight: isTabed ? FontWeight.w600 : FontWeight.w400),
// //               )
// //             ],
// //           ),
// //         ),
// //         trailing: isTabed
// //             ? Padding(
// //                 padding: const EdgeInsets.only(right: 8),
// //                 child: SvgPicture.asset(I.icMinus),
// //               )
// //             : const SizedBox.shrink(),
// //         children: items,
// //       ),
// //     );
// //   }
// // }

// class NavTile extends StatelessWidget {
//   final bool isSelected;
//   final String image;
//   final String title;
//   final void Function()? onTap;

//   const NavTile(
//       {super.key,
//       required this.title,
//       required this.image,
//       required this.isSelected,
//       this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ListTile(
//         onTap: onTap,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         dense: true,
//         horizontalTitleGap: 8,
//         minLeadingWidth: 25,
//         selectedColor: C.pureWhite,
//         selectedTileColor: C.primary700,
//         titleTextStyle: TextStyle(
//             color: C.bluishGray400,
//             fontSize: 16,
//             fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400),
//         selected: isSelected,
//         contentPadding: const EdgeInsets.only(left: 8),
//         leading: SvgPicture.asset(image),
//         title: Text(title),
//       ),
//     );
//   }
// }
