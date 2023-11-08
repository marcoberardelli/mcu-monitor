import 'package:flutter/material.dart';
import 'package:mcu_monitor/features/connection/widget/baud_rate.dart';
import 'package:mcu_monitor/features/connection/widget/com_port.dart';
import 'package:mcu_monitor/features/connection/widget/connect_button.dart';
import 'package:mcu_monitor/features/connection/widget/data_bit.dart';
import 'package:mcu_monitor/features/connection/widget/parity_bit.dart';
import 'package:mcu_monitor/features/connection/widget/stop_bit.dart';
import 'package:side_navigation/side_navigation.dart';


class NavBar extends StatefulWidget {
const NavBar({ Key? key }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int selectedIndex = 0;

  final List<String> navBarItems = [
    "Connect",
    "Info",
    "Digital",
    "Analog",
    "Protocols"
  ];

  @override
  Widget build(BuildContext context){
    const List<Widget> list = [
      ComPort(),
      BaudRate(),
      DataBit(),
      StopBit(),
      ParityBit(),
      ConnectButton(),
    ];

    return SideNavigationBar(
      header: const SideNavigationBarHeader(
        image: Icon(Icons.home), title: Text("2BiTS"), subtitle: Text("Monitoring")),
      selectedIndex: selectedIndex, 
      items: navBarItems.map((e) => SideNavigationBarItem(
        icon: Icons.arrow_back_ios, 
        label: e)).toList(), 
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      toggler: SideBarToggler(
        expandIcon: Icons.keyboard_arrow_left,
        shrinkIcon: Icons.keyboard_arrow_right,
        onToggle: () {
          print('Toggle');
        }),
      );
  }
}