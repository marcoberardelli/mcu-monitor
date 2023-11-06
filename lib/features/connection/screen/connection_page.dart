import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcu_monitor/features/connection/bloc/connection_bloc.dart';
import 'package:mcu_monitor/features/connection/bloc/connection_event.dart';
import 'package:mcu_monitor/features/connection/widget/baud_rate.dart';
import 'package:mcu_monitor/features/connection/widget/com_port.dart';
import 'package:mcu_monitor/features/connection/widget/parity_bit.dart';

class ConnectionPage extends StatelessWidget {
  const ConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final connectionBloc = BlocProvider.of<ConnectionBloc>(context);

    return Expanded(
      child: GridView.count(
        // childAspectRatio: 2 / 3,
        crossAxisCount: 2,
        mainAxisSpacing: 100,
        // crossAxisSpacing: 10,
        // mainAxisSpacing: 10,
        padding: const EdgeInsets.all(50),
        children: [
          const ComPort(),
          const BaudRate(),
          const ParityBit(),
          MaterialButton(
            height: 50,
            onPressed: () => connectionBloc.add(ConnectionConnect()),
            child: const Text("Connect"),
          ),
        ],
      ),
    );
    // return Expanded(
    //   child: Column(
    //     // mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       const SizedBox(height: 50),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           const ComPort(),
    //           const BaudRate(),
    //           MaterialButton(
    //             onPressed: () => connectionBloc.add(ConnectionConnect()),
    //             child: const Text("Connect"),
    //           ),
    //         ],
    //       ),
    //       const Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [ParityBit()],
    //       )
    //     ],
    //   ),
    // );
  }
}
