import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_app_test/app/routes/app_pages.dart';

import 'header_title_widget.dart';

class InterestWidget extends StatelessWidget {
  const InterestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0E191F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitleWidget(
            title: 'Interests',
            onEdit: () {
              Get.toNamed(Routes.EDIT_INTEREST);
            },
          ),
          const SizedBox(height: 12),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              LabelInterestWidget(label: 'Travel'),
              LabelInterestWidget(label: 'Music'),
              LabelInterestWidget(label: 'Movies'),
              LabelInterestWidget(label: 'Sports'),
              LabelInterestWidget(label: 'Cooking'),
              LabelInterestWidget(label: 'Reading'),
              LabelInterestWidget(label: 'Gaming'),
              LabelInterestWidget(label: 'Fitness'),
            ],
          ),
        ],
      ),
    );
  }
}

class LabelInterestWidget extends StatelessWidget {
  const LabelInterestWidget({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: const BoxDecoration(
        color: Color(0xFF1C272C),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
