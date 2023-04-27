import 'package:flutter/material.dart';
import 'package:starbucks/domain/model/item_data.dart';

class FoodCard extends StatelessWidget {
  final ItemData itemData;
  final bool isFirst;
  final bool isLast;
  final VoidCallback onTap;

  const FoodCard({
    Key? key,
    required this.itemData,
    required this.isFirst,
    required this.isLast,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: isFirst ? 24 : 16, right: isLast ? 24 : 0),
      width: 80,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
                child: Image.asset(itemData.image)
            ),
            const SizedBox(height: 10),
            Text(
              itemData.title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 1.3,
                fontSize: 12,
                color: Colors.black87,
                fontWeight: FontWeight.w200,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
