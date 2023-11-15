import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcu_monitor/features/connection/bloc/connection_bloc.dart';
import 'package:mcu_monitor/features/connection/bloc/connection_state.dart';
import 'package:mcu_monitor/features/connection/widget/baud_rate.dart';
import 'package:mcu_monitor/features/connection/widget/com_port.dart';
import 'package:mcu_monitor/features/connection/widget/connect_button.dart';
import 'package:mcu_monitor/features/connection/widget/data_bit.dart';
import 'package:mcu_monitor/features/connection/widget/parity_bit.dart';
import 'package:mcu_monitor/features/connection/widget/stop_bit.dart';
import 'package:side_navigation/side_navigation.dart';


class NavBarItem {
  final Icon icon;
  final String label;
  const NavBarItem(this.icon, this.label);
}

class NavBar extends StatefulWidget {

  final int index;

  const NavBar({Key? key, this.index = 0}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  final List<NavBarItem> navBarItems = [
    NavBarItem(Icons.link)"Connect", // todo
    "Info",
    "Digital",
    "Analog",
    "Protocols"
  ];

  @override
  Widget build(BuildContext context) {
    const List<Widget> list = [
      ComPort(),
      BaudRate(),
      DataBit(),
      StopBit(),
      ParityBit(),
      ConnectButton(),
    ];

    return BlocBuilder<ConnectionBloc, ConnectionStateMCU>(
      builder: (context, state) {
        return Visibility(
          visible: (state is ConnectedMCU) ? true : false, // if connected, show navigation bar
          child: SideNavigationBar(
            header: const SideNavigationBarHeader(
                image: Icon(Icons.home),
                title: Text("2BiTS"),
                subtitle: Text("Monitoring")),
            selectedIndex: widget.index,
            items: navBarItems
                .map((e) =>
                    SideNavigationBarItem(icon: Icons.arrow_back_ios, label: e))
                .toList(),
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        );
      },
    );
  }
}
