import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorScreen extends ConsumerWidget {
  const ErrorScreen({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.color,
  });
  static const path = 'error';
  static const name = path;

  final String text;

  /// Color of icon and text
  final Color color;

  final Color backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: ErrorView(
          text: text,
          color: color,
        ),
      ),
    );
  }
}

/// [ErrorView] Should be displayed under Scaffold,
/// Example
/// Scaffold(
///       body: value.when(
///           data: SomeWidget(),
///           loading: SomeWidget(),
///           error: (e, __) => ErrorScreen(
///                 text: e.toString(),
///                 color: Colors.white,
///                 ),
///       ),
/// )
///

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.text, this.color});

  final String text;

  /// Color of icon and text
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Icon(
              Icons.error,
              color: color ?? Colors.black,
            ),
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.loose,
          child: RichText(
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            text: TextSpan(
              text: text,
              style: TextStyle(
                color: color ?? Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
