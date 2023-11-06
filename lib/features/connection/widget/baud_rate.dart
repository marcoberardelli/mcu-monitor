import 'package:flutter/material.dart';

class BaudRate extends StatefulWidget {
  const BaudRate({Key? key}) : super(key: key);

  @override
  _BaudRateState createState() => _BaudRateState();
}

class _BaudRateState extends State<BaudRate> {
  final TextEditingController baudRateController = TextEditingController();
  static const List<int> baudRateList = [9600, 19200, 115200];
  int? baudRateSelected;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry<int>> entries = [];
    for (int baudRate in baudRateList) {
      entries.add(
          DropdownMenuEntry<int>(value: baudRate, label: baudRate.toString()));
    }

    return Container(
      alignment: Alignment.center,
      child: DropdownMenu<int>(
        initialSelection: baudRateList[0],
        controller: baudRateController,
        label: const Text('Baudrate'),
        dropdownMenuEntries: entries,
        onSelected: (int? baudRate) {
          setState(() {
            baudRateSelected = baudRate;
          });
        },
      ),
    );
  }
}
