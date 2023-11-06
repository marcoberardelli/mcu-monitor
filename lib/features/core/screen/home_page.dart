import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcu_monitor/features/connection/bloc/connection_bloc.dart';
import 'package:mcu_monitor/features/connection/screen/connection_page.dart';
import 'package:mcu_monitor/features/core/app_style.dart';
import 'package:mcu_monitor/features/core/widget/left_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.background,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 197, 18, 5),
          title: const Text(
            "2BiTS Monitoring",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => ConnectionBloc(),
          child: const Row(
            children: [
              LeftBar(),
              ConnectionPage(),
            ],
          ),
        ));
  }
}
