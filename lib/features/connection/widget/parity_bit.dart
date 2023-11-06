import 'package:flutter/material.dart';

class ParityBitEntry {
  final String name;
  final int value;

  ParityBitEntry(this.name, this.value);
}

class ParityBit extends StatefulWidget {
  const ParityBit({Key? key}) : super(key: key);

  @override
  _ParityBitState createState() => _ParityBitState();
}

class _ParityBitState extends State<ParityBit> {
  final TextEditingController portController = TextEditingController();

  final List<ParityBitEntry> parityBits = [
    ParityBitEntry("7", 7),
    ParityBitEntry("8", 8),
    ParityBitEntry("9", 9)
  ];
  ParityBitEntry? pairitySelected;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<ParityBitEntry>> parityBitsList =
        <DropdownMenuEntry<ParityBitEntry>>[];
    for (final ParityBitEntry pairity in parityBits) {
      parityBitsList.add(DropdownMenuEntry<ParityBitEntry>(
          value: pairity, label: pairity.name));
    }

    return DropdownMenu<ParityBitEntry>(
      initialSelection: parityBits[0],
      controller: portController,
      label: const Text('Parity Bit'),
      dropdownMenuEntries: parityBitsList,
      onSelected: (ParityBitEntry? bits) {
        setState(() {
          pairitySelected = bits;
        });
      },
    );
  }
}
