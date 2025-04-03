import 'package:flutter/material.dart';
import '../../core/app_constants/app_strings.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/text_widget.dart';

/// 📄 [OtherPage] Page-Placeholder, displays a simple screen with page text.
class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: AppStrings.otherPageTitle),
      body: Center(
        child: TextWidget(AppStrings.otherPageBody, TextType.headlineSmall),
      ),
    );
  }
}
