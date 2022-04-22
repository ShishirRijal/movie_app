import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
          horizontal: kPadding, vertical: kPadding / 2),
      width: double.infinity,
      height: 60.0,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        boxShadow: [
          kAppBarShadow,
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(width: kPadding),
          const CustomIconButton(icon: Icons.menu),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              CustomIconButton(icon: Icons.search),
              CustomIconButton(icon: Icons.notifications_rounded),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
                radius: 15.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        size: 25,
        color: Colors.white,
      ),
      onPressed: () {
        // open the drawer, if any
      },
    );
  }
}
