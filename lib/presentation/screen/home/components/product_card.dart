import 'package:flutter/material.dart';
import 'package:starbucks/domain/model/item_data.dart';

class ProductCard extends StatelessWidget {
  final ItemData itemData;
  final bool isFirst;
  final bool isLast;
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.itemData,
    required this.isFirst,
    required this.isLast,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: isFirst ? 32 : 20, right: isLast ? 32 : 0),
      width: 150,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
              child: Image.asset(
                itemData.image,
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              itemData.title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
