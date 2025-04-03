import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* Config */
import '../../core/app_settings_state_management/ui_settings_state/ui_settings_cubit.dart';
import '../../core/app_constants/app_strings.dart';
import '../../core/app_constants/app_constants.dart';

/* State Management */
import '../../presentation/widgets/custom_app_bar.dart';
import 'domain/_state_switching_of_counter_which_depends_on_color/factory_for_counter_which_depends_on_color.dart';
import 'domain/counter_on_bloc/counter_bloc.dart';
import 'domain/counter_on_cubit/counter_which_depends_on_color_cubit.dart';

/* UI components */
import '../../presentation/widgets/custom_buttons/app_elevated_button.dart';
import '../../presentation/widgets/text_widget.dart';

class PageForCounterThatDependsOnColor extends StatelessWidget {
  const PageForCounterThatDependsOnColor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => UiSettingsCubit(ctx),
      child: const _UIForCounterThatDependsOnColor(),
    );
  }
}

/// 🟢 [_UIForCounterThatDependsOnColor] dynamically handles counter and color states using BLoC or Cubit.
class _UIForCounterThatDependsOnColor extends StatelessWidget {
  const _UIForCounterThatDependsOnColor();

  @override
  Widget build(BuildContext context) {
    final counterManager = CounterDependsOnColorFactory.create(context);

    return BlocBuilder<UiSettingsCubit, UiSettingsState>(
      builder: (context, uiState) {
        return Scaffold(
          backgroundColor: uiState.backgroundColor,
          appBar: CustomAppBar(
            title: uiState.appBarTitle,
            isTransparent: true,
            titleColor: AppConstants.darkForegroundColor,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppConstants.largePadding,
            children: [
              AppElevatedButton(
                label: AppStrings.changeColor,
                onPressed: counterManager.changeColor,
              ),
              const CounterDisplayWidget(),
              AppElevatedButton(
                label: AppStrings.changeCounter,
                onPressed: counterManager.changeCounter,
              ),
            ],
          ),
        );
      },
    );
  }
}

/// 🔢 Displays the counter value with optimized UI rebuilds using `BlocSelector`
/// and `RepaintBoundary` for performance boost.
class CounterDisplayWidget extends StatelessWidget {
  const CounterDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔍 Determines if BLoC or Cubit is being used based on the current app state
    final isUsingBloc = context.select<UiSettingsCubit, bool>(
      (cubit) => cubit.state.isUsingBlocForFeatures,
    );
    return RepaintBoundary(
      child:
          isUsingBloc ? const _CounterTextOnBloc() : const _CounterTextCubit(),
    );
  }
}

class _CounterTextOnBloc extends StatelessWidget {
  const _CounterTextOnBloc();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CounterBlocWhichDependsOnColorBLoC,
        CounterStateWhichDependsOnColorBloc, int>(
      selector: (state) => state.counter,
      builder: (_, counter) => TextWidget(
        '$counter',
        TextType.headlineMedium,
        color: AppConstants.lightScaffoldBackgroundColor,
      ),
    );
  }
}

class _CounterTextCubit extends StatelessWidget {
  const _CounterTextCubit();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CounterCubitWhichDependsOnColorCubit,
        CounterCubitStateWhichDependsOnColorCubit, int>(
      selector: (state) => state.counter,
      builder: (_, counter) => TextWidget(
        '$counter',
        TextType.headlineMedium,
        color: AppConstants.lightScaffoldBackgroundColor,
      ),
    );
  }
}
