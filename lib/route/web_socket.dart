import 'package:vania/vania.dart';
import 'package:vania_sample/app/http/controllers/ws/chat_web_socket_controller.dart';

class WebSocketRoute implements Route {
  @override
  void register() {
    // Register a WebSocket route for handling chat messages
    Router.websocket('/ws', (WebSocketEvent event) {
      // Delegate message handling to the chat controller
      event.on('message', chatController.newMessage);
    });
  }
}
