import 'dart:async';

class NotificationService {
  static final StreamController<String> _controller =
      StreamController<String>.broadcast();
  static Stream<String> get onMessage => _controller.stream;

  static void sendNotification(String message) {
    _controller.add(message);
  }
}
