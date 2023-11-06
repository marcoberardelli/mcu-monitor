import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcu_monitor/features/connection/bloc/connection_bloc.dart';
import 'package:mcu_monitor/features/connection/bloc/connection_state.dart';
import 'package:mcu_monitor/features/core/app_style.dart';

class Entry extends StatelessWidget {
  final String name;
  const Entry({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // color: Colors.red,
          border: Border(bottom: BorderSide(color: AppTheme.accent))),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Text(name,
            style: const TextStyle(fontSize: 20), textAlign: TextAlign.center),
      ),
    );
  }
}

class LefBarEntry extends StatelessWidget {
  final String name;
  final bool enabled;
  const LefBarEntry({Key? key, required this.name, this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget entry;
    if (enabled) {
      entry = Entry(name: name);
    } else {
      double sigmaX = enabled ? 0 : 5;
      double sigmaY = enabled ? 0 : 5;
      entry = ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: Entry(name: name),
      );
    }

    return entry;
  }
}

/* =========================================================================================== */

Widget _createBar() {
  return BlocBuilder<ConnectionBloc, ConnectionStateMCU>(
    builder: (context, state) {
      bool connected = false;
      if (state is ConnectedMCU) {
        connected = true;
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LefBarEntry(name: "Info", enabled: connected),
          LefBarEntry(name: "Digital input", enabled: connected),
          LefBarEntry(name: "Analog Input", enabled: connected),
          LefBarEntry(name: "Digital output", enabled: connected),
          LefBarEntry(name: "Protocol", enabled: connected)
        ],
      );
    },
  );
}

List<String> _getList() {
  final list = <String>[
    "Info",
    "Digital input",
    "Analog Input",
    "Digital output",
    "Protocol"
  ];
  return list;
}

class LeftBar extends StatefulWidget {
  const LeftBar({Key? key}) : super(key: key);

  @override
  _LeftBarState createState() => _LeftBarState();
}

class _LeftBarState extends State<LeftBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: const BoxDecoration(
          border:
              Border(right: BorderSide(color: Color.fromARGB(255, 255, 0, 0)))),
      child: Container(
        child: _createBar(),
      ),
    );
  }
}
