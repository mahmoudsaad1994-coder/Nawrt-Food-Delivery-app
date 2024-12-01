import 'package:flutter/material.dart';

import '../utils/assets.dart';

class DeliveryPersonCard extends StatelessWidget {
  final String name;
  final double rating;
  final String imageUrl;
  final int number;

  const DeliveryPersonCard({
    super.key,
    required this.name,
    required this.rating,
    required this.imageUrl,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // صورة المندوب
            const CircleAvatar(
              radius: 30,
              // backgroundImage: NetworkImage(imageUrl),
              backgroundImage: AssetImage(AssetsData.deliveryPic),
            ),
            const SizedBox(width: 12),
            // البيانات النصية
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // اسم المندوب
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // التقييم
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // الأيقونات
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    print("اتصال بالمندوب");
                  },
                  icon: const Icon(Icons.phone, color: Colors.orange),
                ),
                IconButton(
                  onPressed: () {
                    print("مراسلة المندوب");
                  },
                  icon: const Icon(Icons.chat, color: Colors.orange),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
