import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcu_monitor/features/connection/bloc/connection_bloc.dart';
import 'package:mcu_monitor/features/connection/bloc/connection_state.dart';
import 'package:mcu_monitor/features/connection/screen/connection_page.dart';
import 'package:mcu_monitor/features/core/app_style.dart';
import 'package:mcu_monitor/features/core/widget/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        drawer: const MonitoringDrawer(),
        body: const ConnectionPage(),
        );
  }
}
