import 'package:flutter/material.dart';
import 'package:starbucks/domain/bloc/bloc_event.dart';
import 'package:starbucks/domain/bloc/bloc_scaffold.dart';
import 'package:starbucks/presentation/components/circle_loading.dart';
import 'package:starbucks/presentation/screen/webview/bloc/webview_bloc.dart';
import 'package:starbucks/presentation/screen/webview/bloc/webview_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'component/webview_bottom_sheet.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  static String get routeName => 'webView';

  const WebViewScreen({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocScaffold<WebViewBloc, WebViewState>(
      create: (context) => WebViewBloc(
        url,
        context,
        WebViewState(),
      ),
      bottomBuilder: (context, bloc, state) {
        return WebViewBottomSheet(
          state: state,
          onClick: (type) => bloc.add(BlocEvent(type)),
        );
      },
      appBar: AppBar(
        title: const Text('이벤트&뉴스'),
      ),
      builder: (context, bloc, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            WebViewWidget(controller: bloc.controller),
            if (state.isLoading) const CircleLoading(),
          ],
        );
      },
    );
  }
}
