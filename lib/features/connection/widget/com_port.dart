import 'package:flutter/material.dart';

class ComPortEntry {
  final String name;
  final int id;

  ComPortEntry(this.name, this.id);
}

class ComPort extends StatefulWidget {
  const ComPort({Key? key}) : super(key: key);

  @override
  _ComPortState createState() => _ComPortState();
}

class _ComPortState extends State<ComPort> {
  final TextEditingController portController = TextEditingController();

  final List<ComPortEntry> comPorts = [
    ComPortEntry("COM1", 0),
    ComPortEntry("COM3", 1)
  ];
  ComPortEntry? portSelected;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<ComPortEntry>> ports =
        <DropdownMenuEntry<ComPortEntry>>[];
    for (final ComPortEntry port in comPorts) {
      ports.add(DropdownMenuEntry<ComPortEntry>(value: port, label: port.name));
    }

    return Container(
      alignment: Alignment.center,
      child: DropdownMenu<ComPortEntry>(
        initialSelection: comPorts[0],
        controller: portController,
        label: const Text('COM Ports'),
        dropdownMenuEntries: ports,
        onSelected: (ComPortEntry? port) {
          setState(() {
            portSelected = port;
          });
        },
      ),
    );
  }
}
