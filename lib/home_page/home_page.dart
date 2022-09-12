import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practical_introduction/home_page/home_page_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // HomePageState
    final pageState = ref.watch(homePageStateProvider);
    // HomePageNotifier
    final pageNotifier = ref.read(homePageStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Main Count ${pageState.mainCount}'),
            onTap: pageNotifier.increaseMainCount,
          ),
          ListTile(
            title: Text('Sub Count ${pageState.subCount}'),
            onTap: pageNotifier.increaseSubCount,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pageNotifier.resetAllCount,
        child: const Icon(Icons.exposure_zero),
      ),
    );
  }
}
