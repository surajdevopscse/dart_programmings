import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dart_programing/constants/colors.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../constants/images.dart';
import '../../../../constants/strings/string_keys.dart';
import '../../../views/common_text_field_view.dart';
import '../controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 8,
            child: Stack(
              children: [
                SvgPicture.asset(
                  I.icLogin,
                  fit: BoxFit.fill,
                  height: double.maxFinite,
                  width: double.maxFinite,
                ),
                Positioned(
                  // top: 50,
                  // left: 50,
                  top: height * 0.0762,
                  left: width * 0.04,
                  child: SvgPicture.asset(
                    I.icHBLogoWhite,
                    // height: 40,
                    height: height * 0.061,
                  ),
                ),
                Positioned(
                  // left: 50,
                  // top: 200,
                  // right: 200,
                  left: width * 0.04,
                  top: height * 0.31,
                  right: width * 0.158,
                  child: Row(
                    children: [
                      Text(
                        SK.welcometo,
                        style: TextStyle(
                            // fontSize: 40,
                            // fontSize: height * 0.061,
                            fontSize: width * 0.0315,
                            color: C.baseWhite,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        SK.partnerPortal,
                        style: TextStyle(
                            // fontSize: 40,
                            // fontSize: height * 0.061,

                            fontSize: width * 0.0315,
                            color: C.baseWhite,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  // top: 260,
                  // left: 50,
                  // right: 200,
                  top: height * 0.42,
                  left: width * 0.04,
                  right: width * 0.158,
                  child: Text(
                    SK.belowWelcomLineOnLoginPage,
                    style: TextStyle(
                        // fontSize: 20,
                        fontSize: (width * 0.0315) / 2,
                        fontWeight: FontWeight.w400,
                        color: C.baseWhite),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      I.icHBLogoBlue1,
                      height: height * 0.061,
                    ),
                    SizedBox(height: height * 0.0762),
                    CommonTextField(
                      fieldName: SK.loginID,
                      controller: CommonTextFieldController()..text = 'Aditya',
                    ),
                    SizedBox(height: height * 0.025),
                    CommonTextField(
                      fieldName: SK.password,
                      isObscureText: true,
                      maxLine: 1,
                      controller: CommonTextFieldController()
                        ..text = '12345678',
                    ),
                    // CheckboxListTile(
                    //   dense: true,
                    //   controlAffinity: ListTileControlAffinity.leading,
                    //   contentPadding: EdgeInsets.zero,
                    //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    //   value: false,
                    //   onChanged: (val) {},
                    //   side: const BorderSide(
                    //     color: C.bluishGray200,
                    //   ),
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(4)),
                    //   title: const Text('Keep me loged in'),
                    // ),
                    SizedBox(height: (height * 0.025) / 2),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Transform.translate(
                          offset: const Offset(-6, 0),
                          child: Checkbox(
                            value: false,
                            onChanged: (val) {},
                            side: const BorderSide(
                              color: C.bluishGray200,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ),
                        Text(
                          SK.keepMeLogedIN,
                          style: const TextStyle(color: C.bluishGray200),
                        )
                      ],
                    ),

                    SizedBox(height: (height * 0.061) / 1.5),
                    Container(
                      width: width * 0.11,
                      height: height * 0.063,
                      color: Colors.transparent,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: C.button,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          SK.login,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
