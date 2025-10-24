import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF162329),
        // image: const DecorationImage(
        //   image: NetworkImage(
        //     'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80',
        //   ),
        //   fit: BoxFit.cover,
        // ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "@Jhondoe's Profile Banner, 28",
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Male", style: TextStyle(color: Colors.white, fontSize: 14)),
            Row(
              children: [
                LabelWidget(
                  icon: Icon(
                    Icons.outlet_outlined,
                    color: Colors.white,
                    size: 14,
                  ),
                  label: 'Virgo',
                ),
                LabelWidget(
                  icon: Icon(
                    Icons.outlet_outlined,
                    color: Colors.white,
                    size: 14,
                  ),
                  label: 'Pig',
                ),
              ],
            ),
          ],
        ),
      ),
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
