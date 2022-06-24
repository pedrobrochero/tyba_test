import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/control_classes/status.dart';
import '../../../../core/dependency_injector.dart';
import '../bloc/history_cubit.dart';
import '../widgets/empty_list_component.dart';
import '../widgets/error_loading_component.dart';
import '../widgets/loading_overlay.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sl<HistoryCubit>(),
        child: BlocBuilder<HistoryCubit, HistoryState>(
          builder: (context, state) {
            if (state.status is ErrorStatus) {
              return const ErrorLoadingComponent();
            }
            return LoadingOverlayComponent(
              isLoading: state.status is LoadingStatus,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Expanded(child: _resultsWidget(context)),
                  ],
                ),
              ),
            );
          },
        ),
      );

  Widget _resultsWidget(BuildContext context) {
    final results = context.select((HistoryCubit c) => c.state.logs);
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HistoryCubit>().getInitialData();
      },
      child: results.isEmpty
          ? const EmptyListComponent()
          : ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final item = results.elementAt(index);
                return Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(item.content),
                    subtitle: Text(item.createdAt.toString()),
                  ),
                );
              },
            ),
    );
  }
}
