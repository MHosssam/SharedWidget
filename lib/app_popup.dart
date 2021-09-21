import 'package:flutter/material.dart';

class AppPopUp extends StatelessWidget {
  const AppPopUp({
    Key? key,
    required this.popUpList,
    required this.mainColor,
  }) : super(key: key);
  final List popUpList;
  final Color mainColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: PopupMenuButton(
        elevation: 20,
        color: mainColor,
        icon: Icon(
          Icons.more_vert_outlined,
          color: mainColor,
          size: 34,
        ),
        itemBuilder: (context) {
          return List.generate(
            popUpList.length,
            (index) {
              final item = popUpList[index];
              return PopupMenuItem(
                onTap: item.onTap,
                child: Text(
                  item.title,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
