import 'remote_notification.dart';

class AmpersandRemoteMessage {
  /// The collapse key a message was sent with. Used to override existing messages with the same key.
  final String? collapseKey;

  /// Any additional data sent with the message.
  final Map<String, dynamic>? data;

  /// The topic name or message identifier.
  final String? from;

  /// A unique ID assigned to every message.
  final String? messageId;

  /// The message type of the message.
  final String? messageType;

  /// Additional Notification data sent with the message.
  final AmpersandRemoteNotification? notification;

  /// The time to live for the message in seconds.
  final int? ttl;

  AmpersandRemoteMessage(
      {this.collapseKey,
      this.data,
      this.from,
      this.messageId,
      this.messageType,
      this.notification,
      this.ttl});
}
