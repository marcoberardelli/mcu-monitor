import 'package:flutter/material.dart';

class DataBitEntry {
  final String name;
  final int value;

  DataBitEntry(this.name, this.value);
}

class DataBit extends StatefulWidget {
  const DataBit({Key? key}) : super(key: key);

  @override
  _ParityBitState createState() => _ParityBitState();
}

class _ParityBitState extends State<DataBit> {
  final TextEditingController dataBitController = TextEditingController();

  final List<DataBitEntry> dataBits = [
    DataBitEntry("7", 7),
    DataBitEntry("8", 8),
    DataBitEntry("9", 9)
  ];
  DataBitEntry? pairitySelected;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<DataBitEntry>> dataBitsList =
        <DropdownMenuEntry<DataBitEntry>>[];
    for (final DataBitEntry dataBit in dataBits) {
      dataBitsList.add(DropdownMenuEntry<DataBitEntry>(
          value: dataBit, label: dataBit.name));
    }

    return Container(
      alignment: Alignment.center,
      child: DropdownMenu<DataBitEntry>(
        initialSelection: dataBits[0],
        controller: dataBitController,
        label: const Text('Parity Bit'),
        dropdownMenuEntries: dataBitsList,
        onSelected: (DataBitEntry? bits) {
          setState(() {
            pairitySelected = bits;
          });
        },
      ),
    );
  }
}
