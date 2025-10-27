import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:you_app_test/app/modules/home/controllers/home_controller.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF162329),
        image: const DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Obx(() {
        var data = controller.profileModel.value?.data;

        return Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data?.name ?? '',
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Male",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Row(
                children: [
                  (data?.horoscope == null || data!.horoscope!.isEmpty)
                      ? const SizedBox.shrink()
                      : LabelWidget(
                          icon: const Icon(
                            Icons.android_outlined,
                            color: Colors.white,
                            size: 14,
                          ),
                          label: data.horoscope ?? '',
                        ),
                  (data?.zodiac == null || data!.zodiac!.isEmpty)
                      ? const SizedBox.shrink()
                      : LabelWidget(
                          icon: const Icon(
                            Icons.android_outlined,
                            color: Colors.white,
                            size: 14,
                          ),
                          label: data.zodiac ?? '',
                        ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

class LabelWidget extends StatelessWidget {
  const LabelWidget({super.key, required this.icon, required this.label});

  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4, right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
