import 'package:flutter/material.dart';

import '../../core/config/app_strings.dart';
import '../widgets/text_widget.dart';

/// 📄 [OtherPage] displays a simple screen with page text.
/// This page can be used as a placeholder or a separate feature screen.
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
        centerTitle: true,
      ),
      body: const Center(
        child: TextWidget(
          AppStrings.otherPageBody,
          TextType.titleMedium,
        ),
      ),
    );
  }
}
