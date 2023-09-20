import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonLoadingScreen extends ConsumerWidget {
  const CommonLoadingScreen({super.key});
  static const path = '/loading';
  static const name = 'loading';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class InitialLoadingScreen extends CommonLoadingScreen {
  const InitialLoadingScreen({super.key});
  static const path = '/initial_loading';
  static const name = 'initial_loading';
}
