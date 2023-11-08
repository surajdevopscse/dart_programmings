// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// class CommonTextFieldView extends GetView {
//   const CommonTextFieldView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CommonTextFieldView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'CommonTextFieldView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';

class CommonTextFieldController {
  final textController = TextEditingController();
  final focusNode = FocusNode();

  String get text => textController.text;
  set text(String value) => textController.text = value;
}

class CommonTextField extends StatefulWidget {
  final String fieldName;
  final CommonTextFieldController? controller;
  final FocusNode? previousFocusNode;
  final FocusNode? nextFocusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool readOnly;
  final int? maxLine;
  final bool autoFocus;
  final bool isRequired;
  final bool isObscureText;
  final Function()? onTap;
  final String? Function(String? text)? validator;
  const CommonTextField(
      {super.key,
      required this.fieldName,
      this.controller,
      this.hintText,
      this.hintStyle,
      this.labelText,
      this.labelStyle,
      this.prefixIcon,
      this.suffixIcon,
      this.previousFocusNode,
      this.nextFocusNode,
      this.autoFocus = false,
      this.onTap,
      this.maxLine,
      this.readOnly = false,
      this.validator,
      this.isRequired = false,
      this.isObscureText = false});

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: C.primaryText,
      onTap: widget.onTap,
      controller: widget.controller?.textController,
      focusNode: widget.controller?.focusNode,
      autofocus: widget.autoFocus,
      autocorrect: false,
      obscureText: widget.isObscureText,
      onTapOutside: (event) {
        widget.controller?.focusNode.unfocus();
      },
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            style: const TextStyle(color: C.seconderyText),
            text: widget.fieldName,
            children: widget.isRequired
                ? const [TextSpan(text: '*', style: TextStyle(color: C.error))]
                : [],
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: C.bluishGray50),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: C.bluishGray50),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
      ),
      onFieldSubmitted: (value) {
        widget.nextFocusNode?.requestFocus();
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      readOnly: widget.readOnly,
      maxLines: widget.maxLine,
    );
  }
}

/// Vikash
class CommonTextFormField extends StatefulWidget {
  final TextEditingController? textController;
  final String title;
  final bool readOnly;

  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? initialValue;
  final Icon? suffixIcon;

  const CommonTextFormField({
    this.textController,
    required this.title,
    this.textInputAction,
    this.suffixIcon,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.initialValue,
    Key? key,
  }) : super(key: key);

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    int n = ((MediaQuery.of(context).size.width - 64) / 200).ceil();
    double size = (MediaQuery.of(context).size.width - (n - 1) * 24) / n;

    return SizedBox(
      width: size > 200 ? size : 200,
      child: TextFormField(
          controller: widget.textController,
          initialValue: widget.initialValue,
          readOnly: widget.readOnly,
          cursorColor: const Color(0xFF140F29),
          style: const TextStyle(fontSize: 16, color: Color(0xFF140F29)),
          decoration: InputDecoration(
            label: Text(
              widget.title,
              style: const TextStyle(color: Color(0xFF93919D)),
            ),
            contentPadding: EdgeInsets.zero,
            suffix: widget.suffixIcon,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: widget.readOnly
                      ? Colors.transparent
                      : const Color(0xFF140F29)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: widget.readOnly
                      ? Colors.transparent
                      : const Color(0xFF140F29)),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: widget.readOnly
                      ? Colors.transparent
                      : const Color(0xFF140F29)),
            ),
          )),
    );
  }
}
