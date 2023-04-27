import 'package:flutter/material.dart';
import 'package:starbucks/domain/model/item_data.dart';

class NewCard extends StatelessWidget {
  final ItemData itemData;
  final bool isLast;
  final VoidCallback onClick;

  const NewCard({
    Key? key,
    required this.itemData,
    required this.isLast,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: isLast ? 32 : 0),
      width: 235,
      child: InkWell(
        onTap: onClick,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
              child: Image.asset(itemData.image),
            ),
            const SizedBox(height: 8),
            Text(
              itemData.title,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              itemData.description,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 14,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}