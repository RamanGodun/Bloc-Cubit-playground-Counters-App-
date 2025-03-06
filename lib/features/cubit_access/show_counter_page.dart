import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* Config */
import '../../core/config/constants/app_strings.dart';
import '../../core/config/constants/app_constants.dart';
import '../../core/utils/helpers.dart';

/* UI Components */
import '../../presentation/widgets/text_widget.dart';

/* State Management */
import '../counter/counter_on_cubit/counter_cubit.dart';

/// 🟢 `ShowMeCounter` displays the current counter value using Cubit state management.
class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          AppStrings.appBarTitleForContextAccessPage,
          TextType.titleSmall,
        ),
      ),
      body: Center(
        child: BlocBuilder<CounterOnCubit, CounterOnCubitState>(
          buildWhen: (previous, current) => previous.counter != current.counter,
          builder: (context, state) {
            print('[UI REBUILD] Counter Value: ${state.counter}');
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextWidget(
                  AppStrings.counterSerOnPreviousPage,
                  TextType.titleMedium,
                  color: Helpers.getColorScheme(context).onSurface,
                ),
                const SizedBox(height: AppConstants.largePadding),
                TextWidget(
                  '${state.counter}',
                  TextType.headline,
                  color: Helpers.getColorScheme(context).onSurface,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
