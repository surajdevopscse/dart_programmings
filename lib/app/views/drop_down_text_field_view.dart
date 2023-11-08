import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../constants/colors.dart';

class DropDownTextFieldView extends GetView {
  const DropDownTextFieldView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropDownTextFieldView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DropDownTextFieldView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

enum DropDownItem {
  item1(title: 'Item 1'),
  item2(title: 'Item 2'),
  item3(title: 'Item 3'),
  item4(title: 'Item 4'),
  item5(title: 'Item 5');

  final String title;
  const DropDownItem({required this.title});
}

class CommonDropDownButton<T> extends StatelessWidget {
  final String fieldName;
  final List<T> items;
  final T? selectedValue;
  final ValueChanged<T?> onChanged;
  final String Function(T)? itemAsString;
  final bool isRequired;
  final String hint;
  final bool isAddMore;
  final Function()? addMore;

  const CommonDropDownButton({
    super.key,
    required this.fieldName,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.itemAsString,
    this.isRequired = false,
    this.isAddMore = false,
    this.addMore,
    this.hint = 'Select',
  });
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -1.5),
      child: InputDecorator(
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: C.bluishGray50),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: C.bluishGray50),
          ),
          label: RichText(
            text: TextSpan(
              style: const TextStyle(color: C.seconderyText),
              text: fieldName,
              children: isRequired
                  ? const [
                      TextSpan(text: '*', style: TextStyle(color: C.error))
                    ]
                  : [],
            ),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
              hint: Text(
                hint,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: C.primaryText),
              ),
              isExpanded: true,
              isDense: true,
              focusColor: Colors.transparent,
              value: selectedValue,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: C.seconderyText,
              ),
              onChanged: onChanged,
              // items: items.map<DropdownMenuItem<T>>(
              //   (T value) {
              //     return DropdownMenuItem<T>(
              //       value: value,
              //       child: Text(
              //         itemAsString?.call(value) ?? value.toString(),
              //         overflow: TextOverflow.ellipsis,
              //       ),
              //     );
              //   },
              // ).toList(),
              items: List.generate(items.length, (index) {
                if (isAddMore && index == 0) {
                  return DropdownMenuItem<T>(
                    value: items[index],
                    child: TextButton(
                      onPressed: () {
                        addMore!();
                      },
                      child: const Text('+ Add Designation'),
                    ),
                  );
                } else {
                  return DropdownMenuItem<T>(
                    value: items[index],
                    child: Text(
                      itemAsString?.call(items[index]) ??
                          items[index].toString(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }
              })),
        ),
      ),
    );
  }
}
