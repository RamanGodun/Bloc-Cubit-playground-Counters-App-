import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/core_config_export.dart';
import '../counter/counter_on_cubit/counter_cubit.dart';
import '../../presentation/widgets/text_widget.dart';

/// 🟢 `ShowMeCounter` displays the current counter value using Cubit state management.
class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
            AppStrings.appBarTitleForContextAccessPage, TextType.titleSmall),
      ),
      body: Center(
        child: BlocBuilder<CounterOnCubit, CounterOnCubitState>(
          buildWhen: (previous, current) => previous.counter != current.counter,
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              spacing: AppConstants.largePadding,
              children: [
                const TextWidget(
                  AppStrings.counterSerOnPreviousPage,
                  TextType.smallHeadline,
                ),
                TextWidget('${state.counter}', TextType.headline),
              ],
            );
          },
        ),
      ),
    );
  }
}
