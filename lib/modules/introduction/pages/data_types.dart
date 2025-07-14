import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/code_widget.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/previous_next_btn.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/app/routes/app_pages.dart';
import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
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
              if (!AS.deviceScreenType.isMobile)
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
                      const CommonHeight(height: 10),
                      BigText(
                        text: 'Why Data Types Matter?',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          letterSpacing: 1.2,
                          height: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'Data types are the foundation of programming. They define what kind of data you can store and how you can use it. Choosing the right data type helps you write safer, faster, and more reliable code. In Dart, understanding data types is essential for building robust applications, as it helps prevent bugs and makes your code easier to read and maintain.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(height: 20),
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
                            'Numbers are everywhere in programming: from counting items in a list, to tracking scores in a game, or handling money in a finance app. Dart provides two main numeric types: int for whole numbers and double for decimal numbers. Both are subtypes of num, which is useful when you want to accept either type. Choosing the right numeric type helps avoid errors, such as accidentally using a decimal where only whole numbers make sense.',
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
                            'Use int when you need to represent whole numbers, such as the number of people in a room or the year in a calendar. int cannot store decimal values. If you try to assign a decimal to an int, Dart will throw an error. This helps catch mistakes early. For example, ages, counts, and indices are best stored as int.',
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
                            'Use double for numbers with a fractional part, like 3.14 or 99.99. This is useful for measurements, prices, or scientific calculations. Remember that floating-point numbers can sometimes have rounding errors, so avoid using double for precise values like money—consider using packages like decimal for financial calculations.',
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
                            'Strings are used to represent text, such as names, messages, or any sequence of characters. In Dart, strings are UTF-16 encoded, which means they can store almost any character from any language. Use strings for user input, displaying messages, or storing data like email addresses. Remember to use triple quotes for multi-line strings and escape special characters when needed.',
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
                            'Booleans are used for true/false values. They are perfect for representing yes/no questions, toggles, or conditions. For example, isLoggedIn, hasPermission, or isVisible are all good candidates for bool. Using booleans makes your code more readable and helps prevent logic errors.',
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
                            'Lists are ordered collections of items. Think of a shopping list, a list of students, or a playlist of songs. Lists are zero-indexed, meaning the first item is at position 0. Use lists when you need to store multiple values of the same type. Dart supports both fixed-length and growable lists, so you can choose the one that fits your needs.',
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: controller.typesOfList
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
                        text: 'Fixed List: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.fixedList,
                      ),
                      BigText(
                        text: 'Growable List: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.growableeList,
                      ),
                      BigText(
                        text: 'List Properties: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SmallText(
                        text:
                            'The following table lists some commonly used properties of the List class in the dart:core library.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      const CommonHeight(
                        height: 10,
                      ),
                      Table(
                        border: TableBorder.all(),
                        children: List.generate(
                          controller.listProperties.length,
                          (index) => TableRow(
                            children: [
                              TableCell(
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.listProperties[index][0],
                                    style:
                                        AppStyle.globalSmallTextStyle.copyWith(
                                      fontSize: index == 0 ? 20 : 16,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.listProperties[index][1],
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
                        text: 'Example : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.listPropertiesExample,
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
                        code: controller.listPropertiesExampleOutput,
                      ),
                      BigText(
                        text: 'Maps: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'Maps are collections of key-value pairs. They are like dictionaries or address books, where each key is unique and maps to a value. Use maps when you need to associate data, such as storing user profiles by user ID, or looking up translations for words. Remember that keys must be unique, but values can be duplicated.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CodeWidget(
                        code: controller.maps,
                      ),
                      BigText(
                        text: 'Map — Properties: ',
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
                          controller.mapProperties.length,
                          (index) => TableRow(
                            children: [
                              TableCell(
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.mapProperties[index][0],
                                    style:
                                        AppStyle.globalSmallTextStyle.copyWith(
                                      fontSize: index == 0 ? 20 : 16,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.mapProperties[index][1],
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
                        text: 'Example : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.mapPropertiesExapmle,
                      ),
                      const CommonHeight(
                        height: 10,
                      ),
                      BigText(
                        text: 'Set: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'A Set is an unordered collection of unique items. Use a Set when you want to ensure that no duplicate values are stored, such as a collection of unique tags or IDs.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CodeWidget(
                        code: "Set<String> fruits = {'apple', 'banana', 'orange'};\nfruits.add('apple'); // No effect, 'apple' already exists\nprint(fruits); // Output: {apple, banana, orange}",
                      ),
                      BigText(
                        text: 'enum: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'An enum is a way to define a fixed set of constant values. Enums are great for representing a limited set of options, such as days of the week or user roles.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CodeWidget(
                        code: "enum Status { pending, approved, rejected }\nStatus current = Status.approved;\nprint(current); // Output: Status.approved",
                      ),
                      BigText(
                        text: 'dynamic: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'The dynamic type disables static type checking for a variable. Use dynamic with caution, as it allows any type to be assigned and loses compile-time safety.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CodeWidget(
                        code: "dynamic value = 10;\nvalue = 'Now I am a string';\nprint(value); // Output: Now I am a string",
                      ),
                      BigText(
                        text: 'var: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'The var keyword lets Dart infer the type at compile time. The type is fixed after the first assignment.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CodeWidget(
                        code: "var name = 'Alice'; // Inferred as String\n// name = 42; // Error: can't assign int to String",
                      ),
                      BigText(
                        text: 'final and const: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'Use final for variables whose value is set only once and can be determined at runtime. Use const for compile-time constants. Both help make your code safer and more predictable.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CodeWidget(
                        code: "final today = DateTime.now();\nconst pi = 3.14159;",
                      ),
                      BigText(
                        text: 'Other Dart Types: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          letterSpacing: 1.2,
                          height: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            '- Runes: For working with Unicode code points.\n- Symbol: Rarely used, for reflection.\n- Function: Functions are first-class objects in Dart and can be assigned to variables or passed as arguments.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                     
                      const CommonHeight(
                        height: 35,
                      ),
                      BigText(
                        text: 'Summary',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          letterSpacing: 1.2,
                          height: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'Understanding data types is crucial for writing effective Dart code. Each type—numbers, strings, booleans, lists, and maps—serves a specific purpose. Choosing the right type makes your code safer, faster, and easier to maintain. As you continue learning Dart, pay attention to how and when you use each data type, and practice converting between them as needed.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
 const CommonHeight(
                        height: 70,
                      ),
                       PreviousNextButton(
                        back: () {
                          AppPages.router
                              .goNamed(SideNavBarChildEnum.variables.title);
                        },
                        next: () {
                          AppPages.router
                              .goNamed(SideNavBarChildEnum.comments.title);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: AS.deviceScreenType.isDesktop ? 40.h : 60.h,
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
