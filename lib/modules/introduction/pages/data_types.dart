import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/code_widget.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/modules/introduction/controllers/data_types_controller.dart';
import 'package:dart_programing/utils/app_constants.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DataTypes extends GetView<DataTypesController> {
  const DataTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseWhite,
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverAppBar(
                toolbarHeight: 60,
                automaticallyImplyLeading: false,
                elevation: 0,
                expandedHeight: 60,
                floating: false,
                pinned: true,
                flexibleSpace: PageHeader(
                  headerName: SK.dataTypes,
                ),
                backgroundColor: C.primary50,
              ),
              SliverToBoxAdapter(
                child: Padding(
                   padding: ScreenSpecific(
                    desktop: EdgeInsets.only(
                      left: 54.0.w,
                      right: 54.0.w,
                    ),
                    fallback: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: BigText(
                          text: 'DATA TYPES IN DART',
                          style: AppStyle.globalBigTextStyle.copyWith(
                            fontSize: 40,
                            letterSpacing: 1.8,
                            height: 2.5,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      BigText(
                        text: 'Dive into Dart — Data Types : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'Data types help you to categorize all the different types of data you use in your code. For e.g. numbers, texts, symbols, etc. The data type specifies what type of value will be stored by the variable. Each variable has its data type. \nDart supports the following built-in data types:',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: controller.dataTypes
                            .map((e) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SmallText(
                                      textAlign: TextAlign.start,
                                      text: '${AppConstant.getBullet()} $e',
                                      style: AppStyle.globalSmallTextStyle
                                          .copyWith(
                                        fontSize: 18,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ))
                            .toList(),
                      ),
                      const CommonHeight(
                        height: 20,
                      ),
                      BigText(
                        text:
                            'In Dart language, there is the type of values that can be represented and manipulated. The data type classification is as given below:',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(
                        height: 20,
                      ),
                      Table(
                        border: TableBorder.all(),
                        children: List.generate(
                          controller.tableData.length,
                          (index) => TableRow(
                            children: [
                              TableCell(
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.tableData[index][0],
                                    style:
                                        AppStyle.globalSmallTextStyle.copyWith(
                                      fontSize: index == 0 ? 20 : 16,
                                      letterSpacing: 0,
                                      fontWeight: index == 0
                                          ? FontWeight.bold
                                          : FontWeight.w100,
                                    ),
                                  ),
                                )),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    controller.tableData[index][1],
                                    style:
                                        AppStyle.globalSmallTextStyle.copyWith(
                                      fontSize: index == 0 ? 20 : 16,
                                      letterSpacing: 0,
                                      fontWeight: index == 0
                                          ? FontWeight.bold
                                          : FontWeight.w100,
                                    ),
                                  )),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.tableData[index][2],
                                    style:
                                        AppStyle.globalSmallTextStyle.copyWith(
                                      fontSize: index == 0 ? 20 : 16,
                                      letterSpacing: 0,
                                      fontWeight: index == 0
                                          ? FontWeight.bold
                                          : FontWeight.w100,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      BigText(
                        text: 'Numbers: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'When you need to store numeric value on dart, you can use either int or double. Both int and double are subtypes of num. You can use num to store both int or double value.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CodeWidget(code: controller.numbersExample),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.numbersOutput,
                      ),
                      BigText(
                        text: 'int: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'Integer is a type of non fractional number value without. Here non fractional means a value without point. Integer dose not support POINT values. It can only hold pure numeric values. See the example below.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CodeWidget(code: controller.intExample),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.intOutput,
                      ),
                      BigText(
                        text: 'double: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'Double are basically bigger type of FLOAT values. It can hold fractional decimal values. In dart the double support 64 bit double prescription values. double also represents floating point literals.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CodeWidget(code: controller.dobuleExample),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.doubleOutput,
                      ),
                      BigText(
                        text: 'Round Double Value To 2 Decimal Places: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'The .toStringAsFixed(2) is used to round the double value upto 2 decimal places in dart. You can round to any decimal places by entering numbers like 2, 3, 4, etc.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CodeWidget(code: controller.doubleValue2Decimal),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CodeWidget(
                        code: '1130.22',
                      ),
                      BigText(
                        text: 'String: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'String data type represents a sequence of multiple characters text also known as group of multiple characters. In Dart string is sequence of UTF-16 code units. String can be created using both single quotes and double quotes but both should be same a creation time.\nString helps you to store text data. You can store values like I love dart, New York 2140 in String. You can use single or double quotes to store string in dart.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CodeWidget(code: controller.stringExample),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.stringOutput,
                      ),
                      BigText(
                        text: 'Create A Multi-Line String In Dart: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'If you want to create a multi-line String in dart, then you can use triple quotes with either single or double quotation marks.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CodeWidget(code: controller.stringMultiLineString),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.stringOutput,
                      ),
                      BigText(
                        text: 'Special Character In String: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Table(
                        border: TableBorder.all(),
                        children: List.generate(
                          controller.specialCharactor.length,
                          (index) => TableRow(
                            children: [
                              TableCell(
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.specialCharactor[index][0],
                                    style:
                                        AppStyle.globalSmallTextStyle.copyWith(
                                      fontSize: index == 0 ? 20 : 16,
                                      letterSpacing: 0,
                                      fontWeight: index == 0
                                          ? FontWeight.bold
                                          : FontWeight.w100,
                                    ),
                                  ),
                                )),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    controller.specialCharactor[index][1],
                                    style:
                                        AppStyle.globalSmallTextStyle.copyWith(
                                      fontSize: index == 0 ? 20 : 16,
                                      letterSpacing: 0,
                                      fontWeight: index == 0
                                          ? FontWeight.bold
                                          : FontWeight.w100,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CodeWidget(code: controller.specialString),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.specialStringOutput,
                      ),
                      BigText(
                        text: 'Create A Raw String In Dart: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'You can also create raw string in dart. Special characters will not work here. You must write r after equal sign.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CodeWidget(code: controller.rawString),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.rawStringOutput,
                      ),
                      BigText(
                        text: 'Type Conversion In Dart: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'In dart, type conversion allows you to convert one data type to another type. For e.g. to convert String to int, int to String or String to bool, etc.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      BigText(
                        text: 'Convert String To Int In Dart: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'You can convert String to int using int.parse() method. The method takes String as an argument and converts it into an integer.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CodeWidget(code: controller.convertStringIntoInt),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.convertStringIntoIntOutput,
                      ),
                      BigText(
                        text: 'Convert String To Double In Dart: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'You can convert String to double using double.parse() method. The method takes String as an argument and converts it into a double.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CodeWidget(code: controller.stringToDouble),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.stringToDoubleOutput,
                      ),
                      BigText(
                        text: 'Convert Int To String In Dart: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'You can convert int to String using the toString() method. Here is example:.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CodeWidget(code: controller.intToString),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.intTStringOutput,
                      ),
                      BigText(
                        text: 'Convert Double To Int In Dart: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'You can convert double to int using the toInt() method.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CodeWidget(code: controller.intToString),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.intTStringOutput,
                      ),
                      BigText(
                        text: 'Booleans: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'Boolean data type is used to hold true and false values. Boolean data type uses the ‘bool‘ keyword on declaration time. In Dart, boolean holds either true or false value. You can write the bool keyword to define the boolean data type. You can use boolean if the answer is true or false. Consider the answer to the following questions:',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: controller.booleans
                            .map((e) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SmallText(
                                      textAlign: TextAlign.start,
                                      text: '${AppConstant.getBullet()} $e',
                                      style: AppStyle.globalSmallTextStyle
                                          .copyWith(
                                        fontSize: 18,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ))
                            .toList(),
                      ),
                      BigText(
                        text:
                            'These all are yes/no questions. Its a good idea to store them in boolean. ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 15,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.boolExample,
                      ),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.boolExampleOutput,
                      ),
                      BigText(
                        text: 'Lists: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'A very commonly used collection in programming is an array. Dart represents arrays in the form of List objects. A List is simply an ordered group of objects. The dart:core library provides the List class that enables creation and manipulation of lists. The list holds multiple values in a single variable. It is also called arrays. If you want to store multiple values without creating multiple variables, you can use a list.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(),
                      BigText(
                        text:
                            'Each element in the List is identified by a unique number called the index. The index starts from zero and extends up to n-1 where n is the total number of elements in the List. The index is also referred to as the subscript.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CodeWidget(
                        code: controller.listExample,
                      ),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.listExampleOutput,
                      ),
                      BigText(
                        text: 'Types of List: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'In Dart, the type of list can be inferred based on how it\'s initialized and used. There are two main types of lists:',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  controller.scrollToTop();
                },
                child: const CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.yellow,
                  child: Icon(
                    Icons.arrow_upward,
                    color: AppColors.primary700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
