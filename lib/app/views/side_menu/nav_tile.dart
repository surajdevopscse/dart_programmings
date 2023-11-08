import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';

class NavParentTile extends StatelessWidget {
  final bool isSelected;
  final String image;
  final String title;
  final bool isExpended;
  final void Function()? onTap;

  const NavParentTile(
      {super.key,
      required this.title,
      required this.image,
      required this.isSelected,
      this.isExpended = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      dense: true,
      horizontalTitleGap: 8,
      minLeadingWidth: 25,
      selectedColor: C.pureWhite,
      selectedTileColor: C.primary700,
      tileColor: isExpended ? C.primary700 : null,
      titleTextStyle: TextStyle(
          color: C.bluishGray400,
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400),
      selected: isSelected,
      contentPadding: const EdgeInsets.only(left: 8),
      minVerticalPadding: 0,
      leading: SvgPicture.asset(image),
      title: Text(title),
      trailing: isExpended
          ? Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SvgPicture.asset(I.icMinus),
            )
          : null,
    );
  }
}

class NavTileChild extends StatelessWidget {
  final bool isSelected;
  final String title;
  final void Function()? onTap;
  const NavTileChild(
      {required this.isSelected, required this.title, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      dense: true,
      horizontalTitleGap: 0,
      minLeadingWidth: 16,
      selectedColor: C.primary700,
      selectedTileColor: C.primary50,
      titleTextStyle: TextStyle(
          color: C.bluishGray300,
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400),
      selected: isSelected,
      contentPadding: const EdgeInsets.only(left: 8),
      leading: SizedBox(
        width: 6,
        child: Text(
          '•',
          style: TextStyle(
              color: isSelected ? C.primary700 : C.bluishGray300, fontSize: 16),
        ),
      ),
      title: Text(
        title,
      ),
    );
  }
}
