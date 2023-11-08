import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcu_monitor/features/connection/bloc/connection_bloc.dart';
import 'package:mcu_monitor/features/connection/bloc/connection_event.dart';


class ConnectButton extends StatelessWidget {
  const ConnectButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final connectionBloc = BlocProvider.of<ConnectionBloc>(context);
    
    return MaterialButton(
              height: 100,
              minWidth: 200,
              onPressed: () => connectionBloc.add(ConnectionConnect()),
              child: const Text("Connect"));
  }
}