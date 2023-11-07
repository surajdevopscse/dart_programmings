import 'package:flutter/material.dart';
import 'package:dart_programing/constants/colors.dart';

class DeshboardHeader extends StatelessWidget {
  const DeshboardHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            flex: 1,
            child: Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 24,
                color: C.primaryText,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Spacer(flex: 2),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      suffixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      fillColor: C.backgroundColor,
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: C.backgroundColor,
                  child:
                      Icon(Icons.notifications_outlined, color: C.primaryText),
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Store Name',
                      style: TextStyle(
                          fontSize: 18,
                          color: C.primaryText,
                          fontWeight: FontWeight.w700),
                    ),
                    Text('Admin')
                  ],
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: C.backgroundColor,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200/300'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
