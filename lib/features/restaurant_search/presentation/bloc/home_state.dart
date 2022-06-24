part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(Tabs.search) Tabs currentTab,
  }) = _Initial;
}

enum Tabs {
  search,
  history,
}
