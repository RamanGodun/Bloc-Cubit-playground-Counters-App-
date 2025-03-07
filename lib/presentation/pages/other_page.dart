import 'package:flutter/material.dart';
import '../../core/config/constants/app_strings.dart';
import '../widgets/text_widget.dart';

/// 📄 [OtherPage] displays a simple screen with page text.
class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          AppStrings.otherPageTitle,
          TextType.titleSmall,
        ),
      ),
      body: const Center(
        child: TextWidget(
          AppStrings.otherPageBody,
          TextType.smallHeadline,
        ),
      ),
    );
  }
}
