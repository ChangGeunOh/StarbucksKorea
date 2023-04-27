import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starbucks/common/const/color.dart';
import 'package:starbucks/common/const/database.dart';
import 'package:starbucks/domain/bloc/bloc_event.dart';
import 'package:starbucks/domain/bloc/bloc_scaffold.dart';
import 'package:starbucks/domain/model/item_data.dart';
import 'package:starbucks/presentation/screen/alarm/alarm_screen.dart';
import 'package:starbucks/presentation/screen/home/bloc/home_bloc.dart';
import 'package:starbucks/presentation/screen/home/bloc/home_event.dart';
import 'package:starbucks/presentation/screen/home/bloc/home_state.dart';
import 'package:starbucks/presentation/screen/home/components/greeting_message.dart';
import 'package:starbucks/presentation/screen/home/components/product_card.dart';
import 'package:starbucks/presentation/screen/home/components/whats_news_bell.dart';

import 'components/delivery_fab.dart';
import 'components/login_card.dart';
import 'components/whats_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocScaffold<HomeBloc, HomeState>(
      backgroundColor: Colors.white,
      create: (context) => HomeBloc(context, HomeState()),
      floatingBuilder: (context, bloc, state) => DeliveryFab(
        isExtended: !state.isFab,
        onClick: () => bloc.add(BlocEvent(HomeEventType.delivery)),
      ),
      builder: (context, bloc, state) {
        return SafeArea(
          child: CustomScrollView(
            controller: bloc.controller,
            physics: const BouncingScrollPhysics(),
            slivers: [
              const GreetingMessage(),
              const SliverToBoxAdapter(
                child: SizedBox(height: 23),
              ),
              LoginCard(
                onLogin: () => bloc.add(BlocEvent(HomeEventType.login)),
                onSign: () => bloc.add(BlocEvent(HomeEventType.sign)),
              ),
              WhatsNewsBell(
                onClickBell: () => context.pushNamed(AlarmScreen.routeName),
              ),
              ...renderProgram(
                program: kProgram,
                onClick: (value) =>
                    bloc.add(BlocEvent(HomeEventType.item, extra: value)),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> renderProgram({
    required List<Object> program,
    required ValueChanged<ItemData> onClick,
  }) {
    List<Widget> widgets = [];
    bool isWhatsNews = false;

    for (var element in program) {
      if (element is ItemData) {
        if (element.type == ItemType.title) {
          isWhatsNews = element.title == 'What\'s New' ? true : false;
        }
        widgets.add(
          SliverToBoxAdapter(
            child: element.type == ItemType.title
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(
                      16.0,
                      28.0,
                      22.0,
                      16.0,
                    ),
                    // const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28.0),
                    child: Row(
                      children: [
                        Text(
                          element.title,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => onClick(element),
                          child: Text(
                            element.description,
                            style: const TextStyle(
                              fontSize: 16,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      onClick(element);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Image.asset(element.image),
                    ),
                  ),
          ),
        );
      }
      if (element is List<ItemData>) {
        widgets.add(SliverToBoxAdapter(
          child: SizedBox(
            height: isWhatsNews ? 265 : 230,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: element.length,
              itemBuilder: (context, index) {
                var itemData = element[index];
                return itemData.type == ItemType.news
                    ? NewCard(
                        itemData: itemData,
                        isLast: index == element.length - 1,
                        onClick: () => onClick(itemData),
                      )
                    : ProductCard(
                        itemData: itemData,
                        isFirst: index == 0,
                        isLast: index == element.length - 1,
                        onTap: () => onClick(itemData),
                      );
              },
            ),
          ),
        ));
      }
    }

    return widgets;
  }
}
