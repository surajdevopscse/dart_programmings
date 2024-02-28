import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/code_widget.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/modules/introduction/controllers/data_types_controller.dart';
import 'package:dart_programing/utils/app_constants.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
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
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
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
