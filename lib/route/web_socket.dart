import 'package:vania/vania.dart';

class WebSocketRoute implements Route{
  @override
  void register() {
    Router.websocket('/ws',(WebSocketEvent event){
      event.on('message', (WebSocketClient client,dynamic message){
        client.toRoom('message',"MyRoom",message);
      });
    });
  }
}