import 'package:flutter/material.dart';

class TileUser extends StatelessWidget {
  final String name;
  final Widget? trailing;
  final Function()? onTap;
  const TileUser({super.key, required this.name, this.trailing, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(name[0])),
      title: Text(name),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
