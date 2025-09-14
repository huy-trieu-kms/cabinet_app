import 'package:flutter/material.dart';

class HomeSchedule extends StatelessWidget {
  const HomeSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock for now
    final hours = List.generate(8, (i) => 8 + i); // 08:00 → 15:00

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: hours.length,
      itemBuilder: (context, index) {
        final hour = hours[index];
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 60,
                  child: Text(
                    '${hour.toString().padLeft(2, '0')}:00',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                const Expanded(child: Divider(height: 1)),
              ],
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
