import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcu_monitor/features/connection/bloc/connection_bloc.dart';
import 'package:mcu_monitor/features/connection/bloc/connection_event.dart';
import 'package:mcu_monitor/features/connection/widget/baud_rate.dart';
import 'package:mcu_monitor/features/connection/widget/com_port.dart';
import 'package:mcu_monitor/features/connection/widget/data_bit.dart';
import 'package:mcu_monitor/features/connection/widget/parity_bit.dart';
import 'package:mcu_monitor/features/connection/widget/stop_bit.dart';

class ConnectionPage extends StatelessWidget {
  const ConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final connectionBloc = BlocProvider.of<ConnectionBloc>(context);

    final List<Widget> list = [
      const ComPort(),
      const BaudRate(),
      const DataBit(),
      const StopBit(),
      const ParityBit(),
      Container(
        alignment: Alignment.center,
        child: MaterialButton(
              height: 100,
              minWidth: 200,
              onPressed: () => connectionBloc.add(ConnectionConnect()),
              child: const Text("Connect"),
            ),
      )];
    return Container(
      alignment: Alignment.center,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.shortestSide < 700 ? 1 : 3, 
            childAspectRatio: 2,
            crossAxisSpacing: 1, 
            mainAxisSpacing: 1),
        padding: const EdgeInsets.all(30),
        // shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return list[index];
        }),
    );
  }
}
