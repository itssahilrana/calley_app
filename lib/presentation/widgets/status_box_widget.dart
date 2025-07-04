import 'package:calley_app/config/themes/extensions/theme_extension.dart';
import 'package:flutter/cupertino.dart';

class StatusBox extends StatelessWidget {
  final String title;
  final int count;
  final Color color;

  const StatusBox({
    super.key,
    required this.title,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(width: 4, height: 20, color: color),
                const SizedBox(width: 6),
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            Text('$count Calls', style: context.typography.textSemiBoldXLarge),
          ],
        ),
      ),
    );
  }
}
