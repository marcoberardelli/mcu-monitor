import 'package:flutter/material.dart';

class StopBitEntry {
  final String name;
  final int value;

  StopBitEntry(this.name, this.value);
}

class StopBit extends StatefulWidget {
  const StopBit({Key? key}) : super(key: key);

  @override
  _ParityBitState createState() => _ParityBitState();
}

class _ParityBitState extends State<StopBit> {
  final TextEditingController stopBitController = TextEditingController();

  final List<StopBitEntry> stopBits = [
    StopBitEntry("0", 0),
    StopBitEntry("1", 1),
    StopBitEntry("2", 2)
  ];
  StopBitEntry? pairitySelected;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<StopBitEntry>> stopBitsList =
        <DropdownMenuEntry<StopBitEntry>>[];
    for (final StopBitEntry stopBit in stopBits) {
      stopBitsList.add(DropdownMenuEntry<StopBitEntry>(
          value: stopBit, label: stopBit.name));
    }

    return Container(
      alignment: Alignment.center,
      child: DropdownMenu<StopBitEntry>(
        initialSelection: stopBits[0],
        controller: stopBitController,
        label: const Text('Stop Bit'),
        dropdownMenuEntries: stopBitsList,
        onSelected: (StopBitEntry? bits) {
          setState(() {
            pairitySelected = bits;
          });
        },
      ),
    );
  }
}
