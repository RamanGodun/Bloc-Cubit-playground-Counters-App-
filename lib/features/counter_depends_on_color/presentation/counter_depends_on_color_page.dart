import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* Config */
import '../../../core/config/app_config.dart';
import '../../../core/app_constants/app_strings.dart';
import '../../../core/app_constants/app_constants.dart';

/* State Management */
import '../../../core/app_settings_state_management/app_settings_on_cubit/app_settings_cubit.dart';
import '../../../core/app_settings_state_management/app_settings_on_bloc/app_settings_bloc.dart';
import '../_state_switching_of_counter_which_depends_on_color/factory_for_counter_which_depends_on_color.dart';
import '../color_on_bloc/color_bloc.dart';
import '../color_on_cubit/color_cubit.dart';
import '../counter_on_bloc/counter_bloc.dart';
import '../counter_on_cubit/counter_which_depends_on_color_cubit.dart';

/* UI components */
import '../../../presentation/widgets/custom_elevated_button.dart';
import '../../../presentation/widgets/text_widget.dart';
part 'counter_display_w.dart';

/// 🟢 [CounterDependsOnColorPage] dynamically handles counter and color states using BLoC or Cubit.
class CounterDependsOnColorPage extends StatelessWidget {
  const CounterDependsOnColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🛠️ Creates a manager for handling counter and color logic.
    final counterManager = CounterDependsOnColorFactory.create(context);

    // 🔍 Determines if the app uses BLoC or Cubit for state management.
    final isUsingBloc = AppConfig.isAppSettingsOnBlocStateShape
        ? context.select<AppSettingsOnBloc, bool>(
            (bloc) => bloc.state.isUsingBlocForAppFeatures,
          )
        : context.select<AppSettingsOnCubit, bool>(
            (cubit) => cubit.state.isUsingBlocForAppFeatures,
          );

    // 🎨 Retrieves the current background color from the active state manager.
    final backgroundColor = isUsingBloc
        ? context.select<ColorOnBloc, Color>((bloc) => bloc.state.color)
        : context.select<ColorOnCubit, Color>((cubit) => cubit.state.color);

    // 📄 Sets the app bar title based on the state management strategy.
    final appBarText = isUsingBloc
        ? AppStrings.counterPageTitleOnBloc
        : AppStrings.counterPageTitleOnCubit;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: TextWidget(
          appBarText,
          TextType.titleSmall,
          color: AppConstants.darkForegroundColor,
        ),
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
  }
}
