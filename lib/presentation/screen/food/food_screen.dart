import 'dart:math';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:starbucks/common/const/color.dart';
import 'package:starbucks/domain/bloc/bloc_event.dart';
import 'package:starbucks/domain/bloc/bloc_scaffold.dart';
import 'package:starbucks/domain/model/item_data.dart';
import 'package:starbucks/domain/model/pair_data.dart';
import 'package:starbucks/presentation/screen/food/bloc/food_bloc.dart';
import 'package:starbucks/presentation/screen/food/bloc/food_event.dart';
import 'package:starbucks/presentation/screen/food/bloc/food_state.dart';
import 'package:starbucks/presentation/screen/food/component/food_card.dart';

class FoodScreen extends StatelessWidget {
  static String get routeName => 'food';

  final ItemData itemData;

  const FoodScreen({
    Key? key,
    required this.itemData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocScaffold<FoodBloc, FoodState>(
      create: (context) => FoodBloc(context, FoodState(), itemData),
      builder: (context, bloc, state) {
        final foodData = state.foodData;
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            if (state.sheetState == SheetState.open) {
              showBottomSheet(
                context,
                () => bloc.add(
                  BlocEvent(FoodEventType.close),
                ),
                foodData.nutrition,
              );
            }
          },
        );
        return CustomScrollView(
          slivers: [
            SliverLayoutBuilder(
              builder: (context, constraints) {
                final thresholdScroll =
                    300 - MediaQuery.of(context).padding.top - 16;
                var scrollHeight = constraints.scrollOffset - thresholdScroll;
                var opacity = scrollHeight < 0 ? 0 : min(1, scrollHeight / 16);
                // print('$opacity :: $thresholdScroll ::$scrollHeight :: ${constraints.scrollOffset}' );
                return SliverAppBar(
                  pinned: true,
                  floating: true,
                  expandedHeight: 300,
                  foregroundColor: Colors.black,
                  flexibleSpace: FlexibleSpaceBar(
                    title: opacity == 0
                        ? null
                        : Text(
                            itemData.title,
                            style: TextStyle(
                              color: Colors.black87
                                  .withOpacity(opacity.toDouble()),
                              fontSize: 16,
                            ),
                          ),
                    background: Container(
                      alignment: Alignment.topCenter,
                      color: Colors.green,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/img_food_01_big.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          Positioned(
                            bottom: 8,
                            right: 4,
                            child: IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/icons/ic_photo.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Share.share(foodData.site);
                      },
                      icon: renderShareIcon(opacity.toDouble()),
                    ),
                  ],
                );
              },
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          foodData.title,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 4),
                        if (foodData.isNew)
                          Image.asset(
                            'assets/icons/img_new.png',
                            width: 24,
                          ),
                        if (foodData.isBest)
                          Image.asset(
                            'assets/icons/img_best.png',
                            width: 24,
                          ),
                      ],
                    ),
                    // const SizedBox(height: 6),
                    Text(
                      foodData.titleEng,
                      style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 14,
                          fontWeight: FontWeight.w200),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      foodData.description,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      color: Colors.black.withOpacity(0.05),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      child: const Text(
                        '※ 원물(감자)의 특성상 메쉬드 포테이토가 쉽게 변질될 수 있사오니, 구매 즉시 바로 드시기 바랍니다.\n※ 감자와 양파의 원물을 가공하여 만든 제품 특성상 원물에서 유래된 껍질이 함유될 수 있습니다.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const Divider(height: 16, indent: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 24),
                    child: ListTile(
                      onTap: () => bloc.add(BlocEvent(FoodEventType.nurition)),
                      title: const Text(
                        '제품 영양 정보',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const Divider(height: 16, indent: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 24),
                    child: ListTile(
                      title: const Text(
                        '알레르기 유발 요인',
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        foodData.allergy.join(','), // '대두,우유,달걀,밀,쇠소기,아황산류',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 16, indent: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 24),
                    child: ListTile(
                      onTap: () {},
                      title: const Text(
                        '상품 정보 제공 고시',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.black.withOpacity(0.02),
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 24.0, bottom: 16),
                      child: Text(
                        '비슷한 다른 메뉴',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 123,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          FoodCard(
                              itemData: itemData,
                              isFirst: true,
                              isLast: false,
                              onTap: () {}),
                          FoodCard(
                              itemData: itemData,
                              isFirst: false,
                              isLast: false,
                              onTap: () {}),
                          FoodCard(
                              itemData: itemData,
                              isFirst: false,
                              isLast: false,
                              onTap: () {}),
                          FoodCard(
                              itemData: itemData,
                              isFirst: false,
                              isLast: true,
                              onTap: () {}),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        );
      },
      bottomBuilder: (context, bloc, state) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(24, 15, 24, 32),
          child: FilledButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
              ),
              onPressed: () {
                bloc.add(BlocEvent(FoodEventType.order, extra: itemData));
              },
              child: const Text('주문하기',
                  style: TextStyle(
                    color: Colors.white,
                  ))),
        );
      },
    );
  }

  void showBottomSheet(
    BuildContext context,
    VoidCallback onClose,
    List<PairData> nutritionList,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8, bottom: 32),
                width: 70,
                height: 3,
                decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
              const Text(
                '제품 영양 정보',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 48),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      if (index == nutritionList.length) {
                        return null;
                      }
                      final pairData = nutritionList[index];
                      return Row(
                        children: [
                          Text(pairData.key),
                          const Spacer(),
                          Text(
                            pairData.value,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return index == nutritionList.length - 1
                          ? const Divider(
                              height: 34,
                              thickness: 2,
                              color: Colors.black12,
                            )
                          : const Divider(height: 34);
                    },
                    itemCount: nutritionList.length + 1,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ).whenComplete(() => onClose());
  }

  Widget renderShareIcon(double opacity) {
    return opacity == 1
        ? Image.asset(
            'assets/icons/ic_share.png',
            color: Colors.black54,
          )
        : CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.4 * (1 - opacity)),
            child: Image.asset(
              'assets/icons/ic_share.png',
              color: Colors.white,
            ),
          );
  }
}
