import 'dart:developer';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket = IO.io('http://10.10.18.99:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    var s = socket!.connect();
    log('function called');
    print(s.connected);
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
