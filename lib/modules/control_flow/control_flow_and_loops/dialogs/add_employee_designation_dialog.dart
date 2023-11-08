import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../app/views/common_text_field_view.dart';

void addEmployeeDesignationDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 32, horizontal: 40),
          content: const AddEmployeeDesignationDialog());
    },
  );
}

class AddEmployeeDesignationDialog extends GetView {
  const AddEmployeeDesignationDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Add Designation',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF140F29),
            )),
        const SizedBox(height: 16),
        const Form(
            child: Column(
          children: [
            CommonTextFormField(title: 'Designation name *'),
            SizedBox(
              height: 16,
            ),
            CommonTextFormField(title: 'Designation code *'),
          ],
        )),
        const SizedBox(height: 40),
        Row(
          children: [
            Container(
              width: 100,
              height: 40,
              color: Colors.transparent,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    width: 1,
                    color: C.bluishGray50,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: C.error500),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Container(
              width: 100,
              height: 40,
              color: Colors.transparent,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0071BC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Next',
                ),
              ),
            ),
            const SizedBox(height: 16)
          ],
        )
      ],
    );
  }
}

// class AddDesignation extends StatelessWidget {
//   const AddDesignation({super.key});

//   void _showDialog(BuildContext context) async {
//     return await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 48, horizontal: 40),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const CircleAvatar(
//                 radius: 32,
//                 backgroundColor: C.success,
//                 child: Icon(
//                   Icons.check,
//                   color: Colors.white,
//                   size: 40,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               const Text(
//                 'Successfully Created',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w700,
//                   color: C.primaryText,
//                 ),
//               ),
//               const Text(
//                 'You have successfully created Sub Partner',
//                 style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                     color: C.seconderyText),
//               ),
//               const SizedBox(height: 24),
//               const Divider(),
//               const SizedBox(height: 24),
//               const Text(
//                 'Mr. Aditya Singh',
//                 style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16,
//                     color: C.primaryText),
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'License ID - ',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                         color: C.seconderyText),
//                   ),
//                   Text(
//                     'LC0094',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                         color: C.success700),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 40),
//               Row(
//                 children: [
//                   Container(
//                     width: 200,
//                     height: 40,
//                     color: Colors.transparent,
//                     child: OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                         side: const BorderSide(
//                           width: 1,
//                           color: C.buttonBorder,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       onPressed: () {},
//                       child: const Text(
//                         'Share via mail',
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: C.buttonBorder),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   Container(
//                     width: 200,
//                     height: 40,
//                     color: Colors.transparent,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: C.button,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: const Text(
//                         'Download',
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16)
//                 ],
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               SK.addDesignation,
//               style: const TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.w700,
//                 color: C.primaryText,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Card(
//               margin: EdgeInsets.zero,
//               child: Container(
//                 padding: const EdgeInsets.all(16.0),
//                 width: double.maxFinite,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       SK.addDesignation,
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700,
//                         color: C.primaryText,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Container(
//                       width: 284,
//                       color: Colors.transparent,
//                       child: Form(
//                           child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Designation name
//                           CommonTextField(
//                             fieldName: SK.designationName,
//                             controller: CommonTextFieldController()
//                               ..text = 'Associate',
//                           ),
//                           const SizedBox(height: 16),
//                           // Designation code
//                           CommonTextField(
//                             fieldName: SK.designationCode,
//                             controller: CommonTextFieldController()
//                               ..text = 'A009',
//                             maxLine: 1,
//                           ),
//                         ],
//                       )),
//                     ),
//                     const SizedBox(height: 40),
//                     Wrap(
//                       children: [
//                         Container(
//                           width: 115,
//                           height: 40,
//                           color: Colors.transparent,
//                           child: OutlinedButton(
//                             style: OutlinedButton.styleFrom(
//                               side: const BorderSide(
//                                 width: 1,
//                                 color: C.bluishGray50,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             onPressed: () {},
//                             child: const Text(
//                               'Cancle',
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                   color: C.error500),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 20),
//                         Container(
//                           width: 112,
//                           height: 40,
//                           color: Colors.transparent,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               _showDialog(context);
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: C.button,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             child: const Text(
//                               'Next',
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
