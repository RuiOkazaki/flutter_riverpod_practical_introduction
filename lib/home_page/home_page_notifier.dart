import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_page_state.dart';

// Reader を渡しています（不要なら省略可能）
final homePageStateProvider =
    StateNotifierProvider.autoDispose<HomePageNotifier, HomePageState>((ref) {
  return HomePageNotifier(ref.read);
});

class HomePageNotifier extends StateNotifier<HomePageState> {
  HomePageNotifier(this._read) : super(const HomePageState());

  // Reader 型をフィールドに持っておくことで、HomePageNotifierから他のProviderを読み取ることができるようになります
  final Reader _read;

  void increaseMainCount() {
    state = state.copyWith(mainCount: state.mainCount + 1);
  }

  void increaseSubCount() {
    state = state.copyWith(subCount: state.subCount + 1);
  }

  void resetAllCount() async {
    state = state.copyWith(
      mainCount: 0,
      subCount: 0,
    );
  }
}
