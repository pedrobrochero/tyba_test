import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injector.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/presentation/widgets/logout_button.dart';
import '../bloc/home_cubit.dart';
import 'history_body.dart';
import 'search_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sl<HomeCubit>(),
        child: Scaffold(
          appBar: AppBar(actions: const [LogOutButton()]),
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              switch (state.currentTab) {
                case Tabs.search:
                  return const SearchBody();
                case Tabs.history:
                  return const HistoryBody();
              }
            },
          ),
          bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) => BottomNavigationBar(
              currentIndex: Tabs.values.indexOf(state.currentTab),
              onTap: (value) {
                if (value < Tabs.values.length) {
                  context
                      .read<HomeCubit>()
                      .selectTab(Tabs.values.elementAt(value));
                }
              },
              items: [
                BottomNavigationBarItem(
                  label: S.of(context).searching,
                  icon: const Icon(Icons.search),
                ),
                BottomNavigationBarItem(
                  label: S.of(context).history,
                  icon: const Icon(Icons.restore),
                ),
              ],
            ),
          ),
        ),
      );
}
