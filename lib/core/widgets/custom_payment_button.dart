import 'package:flutter/material.dart';
import 'package:nawrt/core/utils/extensions.dart';

class CustomPaymentButton extends StatelessWidget {
  const CustomPaymentButton({
    super.key,
    this.onTap,
    required this.icon,
    required this.label,
    this.isAddress = false,
  });
  final void Function()? onTap;
  final IconData icon;
  final String label;
  final bool isAddress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2), // لتحديد اتجاه الظل
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.grey[600],
                    size: 20.0,
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      label,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: context.width * .04,
                      ),
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            if (isAddress) const SizedBox(width: 8.0),
            if (isAddress)
              const Text(
                "تغيير ",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
