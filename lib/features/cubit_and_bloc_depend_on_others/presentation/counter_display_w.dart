part of 'counter_depends_on_color_page.dart';

/// 🔢 Displays the counter value with optimized UI rebuilds using `BlocSelector`
/// and `RepaintBoundary` for performance boost.
class CounterDisplayWidget extends StatelessWidget {
  const CounterDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔍 Determines if BLoC or Cubit is being used based on the current app state
    final isUsingBlocForThisFeature = AppConfig.isAppSettingsOnBlocStateShape
        ? context.select<AppSettingsOnBloc, bool>(
            (bloc) => bloc.state.isUsingBlocForAppFeatures)
        : context.select<AppSettingsOnCubit, bool>(
            (cubit) => cubit.state.isUsingBlocForAppFeatures);

    return isUsingBlocForThisFeature
        ? BlocSelector<CounterBlocWhichDependsOnColorBLoC,
            CounterStateWhichDependsOnColorBloc, int>(
            selector: (state) => state.counter,
            builder: (context, counter) {
              return TextWidget(
                '$counter',
                TextType.headline,
                color: AppConstants.lightScaffoldBackgroundColor,
              );
            },
          )
        : BlocSelector<CounterCubitWhichDependsOnColorCubit,
            CounterCubitStateWhichDependsOnColorCubit, int>(
            selector: (state) => state.counter,
            builder: (context, counter) {
              return TextWidget(
                '$counter',
                TextType.headline,
                color: AppConstants.lightScaffoldBackgroundColor,
              );
            },
          );
  }
}
