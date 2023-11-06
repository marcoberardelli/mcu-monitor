import 'package:flutter/material.dart';
import 'package:mcu_monitor/features/core/widget/drawer_item.dart';

/// Get implemented app pages as drawer elements
List<DrawerItem> getDrawerItems() {
  const List<DrawerItem> list = [
    DrawerItem(name: "Connect"),
    DrawerItem(name: "Info"),
    DrawerItem(name: "Digital"),
    DrawerItem(name: "Analog"),
    DrawerItem(name: "Protocols")
  ];

  return list;
}

/// Main App drawer
class MonitoringDrawer extends StatelessWidget {
  const MonitoringDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DrawerItem> list = getDrawerItems();

    return Drawer(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: list.length,
        itemBuilder: (context, index) {
            return list[index];
          },
        ));
  }
}
