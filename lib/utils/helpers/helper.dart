import 'package:flutter/material.dart';

class Helper {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void showAlertDialog(
      BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void showBottomSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return child;
      },
    );
  }

  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  static void navigateTo(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static String truncateText(String text, int length) {
    if (text.length > length) {
      return '${text.substring(0, length)}...';
    }
    return text;
  }

  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static Color? getColorFromText(String text) {
    // Convert text to lowercase for case-insensitive comparison
    final colorName = text.toLowerCase();

    // Map of color names to MaterialColor or Color objects
    final Map<String, Color> colorMap = {
      'red': Colors.red,
      'blue': Colors.blue,
      'green': Colors.green,
      'yellow': Colors.yellow,
      'purple': Colors.purple,
      'pink': Colors.pink,
      'orange': Colors.orange,
      'brown': Colors.brown,
      'grey': Colors.grey,
      'black': Colors.black,
      'white': Colors.white,
      'cyan': Colors.cyan,
      'teal': Colors.teal,
      'indigo': Colors.indigo,
      'lime': Colors.lime,
      'amber': Colors.amber,
      'black/red': Colors.red[900] ?? Colors.red,
      'white/magenta': Colors.pink[100] ?? Colors.pink,
      'white/red': Colors.red[100] ?? Colors.red,
      'silver': Colors.grey[300] ?? Colors.grey,
      'space black': Colors.black,
      'light blue': Colors.lightBlue,
      'dark brown': Colors.brown[800] ?? Colors.brown,
      'green/black': Colors.green[900] ?? Colors.green,
      'grey/black': Colors.grey[800] ?? Colors.grey,
      'blue/white': Colors.blue[100] ?? Colors.blue,
      'tan': Colors.brown[300] ?? Colors.brown,
      'gold': Colors.amber[700] ?? Colors.amber,
    };

    // Return the color if it exists in the map, otherwise return null
    return colorMap[colorName];
  }
}
