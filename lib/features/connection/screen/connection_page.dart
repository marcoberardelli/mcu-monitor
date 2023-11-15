import 'package:flutter/material.dart';
import 'package:mcu_monitor/features/connection/widget/baud_rate.dart';
import 'package:mcu_monitor/features/connection/widget/com_port.dart';
import 'package:mcu_monitor/features/connection/widget/connect_button.dart';
import 'package:mcu_monitor/features/connection/widget/data_bit.dart';
import 'package:mcu_monitor/features/connection/widget/parity_bit.dart';
import 'package:mcu_monitor/features/connection/widget/stop_bit.dart';
import 'package:mcu_monitor/features/core/host_details.dart';

class ConnectionPage extends StatelessWidget {
  const ConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double horizontalPadding =  isHostDesktop() ? 50 : 0;
    double verticalPadding =  isHostDesktop() ? 30 : 0;

    List<Widget> list = [
      const ComPort(),
      const BaudRate(),
      const DataBit(),
      const StopBit(),
      const ParityBit(),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding), // todo responsive
        child: const ConnectButton(),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(100, 10, 150, 0), // todo responsive
      child: Container(
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
      ),
    );
  }
}
