import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starbucks/common/const/color.dart';
import 'package:starbucks/data/repository/repository.dart';

import 'common/const/network.dart';
import 'common/router/router.dart';
import 'data/network/local_network.dart';
import 'data/repository/database_source_impl.dart';
import 'data/repository/datastore_source_impl.dart';
import 'data/repository/network_source_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      lazy: false,
      create: (context) {
        final databaseSource = DatabaseSourceImpl();
        final dataStoreSource = DataStoreSourceImpl();
        final networkSource = NetworkSourceImpl(
          LocalNetwork.dio,
          baseUrl: kNetworkBaseUrl,
        );
        return Repository(
          databaseSource: databaseSource,
          dataStoreSource: dataStoreSource,
          networkSource: networkSource,
        );
      },
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          primaryColor: primaryColor,
          fontFamily: 'NotoSansKR',
        ),
        routerConfig: routerConfig,
      ),
    );
  }
}
