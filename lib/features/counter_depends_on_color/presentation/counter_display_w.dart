part of 'counter_depends_on_color_page.dart';

/// 🔢 Displays the counter value with optimized UI rebuilds using `BlocBuilder`
class CounterDisplayWidget extends StatelessWidget {
  const CounterDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔍 Determines if BLoC or Cubit is being used based on the current app state
    final isUsingBloc = AppConfig.isAppSettingsOnBlocStateShape
        ? context.select<AppSettingsOnBloc, bool>(
            (bloc) => bloc.state.isUsingBlocForAppFeatures)
        : context.select<AppSettingsOnCubit, bool>(
            (cubit) => cubit.state.isUsingBlocForAppFeatures);

    // 🛠️ Chooses the appropriate BlocBuilder or CubitBuilder based on the state management choice
    return isUsingBloc
        ? BlocBuilder<CounterBlocWhichDependsOnColorBLoC,
            CounterStateWhichDependsOnColorBloc>(
            buildWhen: (previous, current) =>
                previous.counter != current.counter,
            builder: (context, state) {
              return TextWidget(
                '${state.counter}', TextType.headline,
                // color: Helpers.getColorScheme(context).onPrimary,
                color: AppConstants.lightScaffoldBackgroundColor,
              );
            },
          )
        : BlocBuilder<CounterCubitWhichDependsOnColorCubit,
            CounterCubitStateWhichDependsOnColorCubit>(
            buildWhen: (previous, current) =>
                previous.counter != current.counter,
            builder: (context, state) {
              return TextWidget('${state.counter}', TextType.headline);
            },
          );
  }
}
