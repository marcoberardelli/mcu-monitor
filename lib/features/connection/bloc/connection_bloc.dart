import 'package:flutter_bloc/flutter_bloc.dart';

import './connection_event.dart';
import './connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionStateMCU> {
  ConnectionBloc() : super(DisconnectedMCU()) {
    on<ConnectionDisconnect>((event, emit) => emit(DisconnectedMCU()));
    on<ConnectionConnect>((event, emit) => emit(ConnectedMCU()));
  }
}
