import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcu_monitor/features/connection/bloc/connection_bloc.dart';
import 'package:mcu_monitor/features/connection/bloc/connection_state.dart';
import 'package:mcu_monitor/features/connection/screen/connection_page.dart';
import 'package:mcu_monitor/features/core/app_style.dart';
import 'package:mcu_monitor/features/core/host_details.dart';
import 'package:mcu_monitor/features/core/widget/drawer.dart';
import 'package:mcu_monitor/features/core/widget/navigation_bar.dart';
import 'package:side_navigation/side_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
    Widget? drawer;
    Widget navBar = Container();

    if(isHostDesktop())
    {
      navBar = const NavBar();
    } else {
      drawer = const MonitoringDrawer();
    }

    return Scaffold(
        backgroundColor: AppTheme.background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: BlocBuilder<ConnectionBloc, ConnectionStateMCU>(
            builder: (context, state) {
              bool drawerEnabled = (state is ConnectedMCU) ? true : false;
              return AppBar(
                      automaticallyImplyLeading: drawerEnabled,
                      backgroundColor: AppTheme.accent,
                      title: const Text(
                        "2BiTS Monitoring",
                        style: TextStyle(color: Colors.black),
                      ),
                      centerTitle: true,
                    );
              },
            ),
          ),
        drawer: drawer,
        body: Row(
          children: [
            navBar,
            const Expanded(child: const ConnectionPage()),
          ],
        ),
        );
  }
}
