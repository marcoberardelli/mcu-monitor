import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mcu_monitor/features/core/app_style.dart';


class _DrawerItem extends StatelessWidget {
  final String name;
  const _DrawerItem({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // color: Colors.red,
          border: Border(bottom: BorderSide(color: AppTheme.accent))),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.all(30),
          child: Text(name,
              style: const TextStyle(fontSize: 20), textAlign: TextAlign.center),
        ),
      ),
    );
  }
}


class DrawerItem extends StatelessWidget {
  final String name;
  final bool enabled;

  const DrawerItem({Key? key, required this.name, this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget entry;
    if (enabled) {
      entry = _DrawerItem(name: name);
    } else {
      double sigmaX = enabled ? 0 : 5;
      double sigmaY = enabled ? 0 : 5;
      entry = ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: _DrawerItem(name: name)
        );
    }

    return entry;
  }
}