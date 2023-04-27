import 'package:flutter/material.dart';
import 'package:starbucks/domain/bloc/bloc_scaffold.dart';
import 'package:starbucks/presentation/screen/alarm/bloc/alarm_state.dart';

import 'bloc/alarm_bloc.dart';

class AlarmScreen extends StatelessWidget {
  static String get routeName => 'alarm';

  const AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocScaffold<AlarmBloc, AlarmState>(
        create: (context) => AlarmBloc(context, AlarmState()),
        builder: (context, bloc, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                snap: true,
                pinned: true,
                floating: true,
                expandedHeight: 105,
                elevation: 4,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    var threshold =
                        kToolbarHeight + MediaQuery.of(context).padding.top;
                    return FlexibleSpaceBar(
                      centerTitle: true,
                      title: constraints.biggest.height > threshold
                          ? null
                          : const Text(
                              '알림',
                              style: TextStyle(color: Colors.black),
                            ),
                      background: Container(
                        alignment: Alignment.bottomLeft,
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            '알림',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 28,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  color: Colors.redAccent,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  color: Colors.blue,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  color: Colors.redAccent,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  color: Colors.blue,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  color: Colors.redAccent,
                ),
              ),
            ],
          );
        });
  }
}