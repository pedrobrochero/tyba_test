import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/control_classes/status.dart';
import '../../../../core/dependency_injector.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/presentation/widgets/logout_button.dart';
import '../bloc/restaurants_search_cubit.dart';
import '../widgets/empty_list_component.dart';
import '../widgets/error_loading_component.dart';
import '../widgets/loading_overlay.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sl<RestaurantsSearchCubit>(),
        child: Scaffold(
          appBar: AppBar(actions: const [LogOutButton()]),
          body: BlocBuilder<RestaurantsSearchCubit, RestaurantsSearchState>(
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
                      _searchWidget(context),
                      const SizedBox(height: 8),
                      Expanded(child: _resultsWidget(context)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );

  Widget _searchWidget(BuildContext context) => Row(
        children: [
          Expanded(
              child: TextField(
            onChanged: (value) =>
                context.read<RestaurantsSearchCubit>().updateQueryTerm(value),
            onSubmitted: (_) => _submitSearch(context),
          )),
          const SizedBox(width: 8),
          ElevatedButton.icon(
              onPressed: context.select(
                      (RestaurantsSearchCubit c) => c.state.query.isEmpty)
                  ? null
                  : () => _submitSearch(context),
              icon: const Icon(Icons.search),
              label: Text(S.of(context).search))
        ],
      );

  Widget _resultsWidget(BuildContext context) {
    final results =
        context.select((RestaurantsSearchCubit c) => c.state.restaurants);
    if (results.isEmpty) {
      return const EmptyListComponent();
    }
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results.elementAt(index);
        return Card(
          elevation: 2,
          child: ListTile(title: Text(item.name)),
        );
      },
    );
  }

  void _submitSearch(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    context.read<RestaurantsSearchCubit>().search();
  }
}
