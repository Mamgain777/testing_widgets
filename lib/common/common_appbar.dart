import 'package:flutter/material.dart';

class CommonAppbar extends StatelessWidget {

  final String appbarTitle;
  
  const CommonAppbar({
    required this.appbarTitle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      title: Text(appbarTitle),
    );
  }
}