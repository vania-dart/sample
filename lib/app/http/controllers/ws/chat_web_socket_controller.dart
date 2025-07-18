import 'package:vania/http/controller.dart';
import 'package:vania/websocket.dart';

class ChatWebSocketController extends Controller {
  Future newMessage(WebSocketClient client, dynamic message) async {
    client.toRoom('message', "MyRoom", message);
  }
}

ChatWebSocketController chatController = ChatWebSocketController();
