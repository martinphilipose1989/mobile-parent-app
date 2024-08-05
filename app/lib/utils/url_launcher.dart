import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  // Private constructor to prevent instantiation.
  UrlLauncher._();

  // Launches a URL in the default browser.
  static Future<void> launchURL(String url, {BuildContext? context}) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $url')),
        );
      } else {
        print('Could not launch $url');
      }
    }
  }

  // Launches a URL in a webview.
  static Future<void> launchURLInWebView(String url,
      {BuildContext? context}) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.inAppWebView,
      );
    } else {
      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $url')),
        );
      } else {
        print('Could not launch $url');
      }
    }
  }

  // Launches an email.
  static Future<void> launchEmail(String email, {BuildContext? context}) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $email')),
        );
      } else {
        print('Could not launch $email');
      }
    }
  }

  // Launches a phone number.
  static Future<void> launchPhone(String phoneNumber,
      {BuildContext? context}) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunchUrl(phoneLaunchUri)) {
      await launchUrl(phoneLaunchUri);
    } else {
      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $phoneNumber')),
        );
      } else {
        print('Could not launch $phoneNumber');
      }
    }
  }
}
