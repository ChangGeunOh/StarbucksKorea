import 'dart:async';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:starbucks/domain/bloc/bloc_event.dart';
import 'package:starbucks/domain/bloc/custom_bloc.dart';
import 'package:starbucks/presentation/screen/webview/bloc/webview_event.dart';
import 'package:starbucks/presentation/screen/webview/bloc/webview_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewBloc
    extends CustomBloc<BlocEvent<WebViewEventType>, WebViewState> {
  late WebViewController controller;
  final String site;

  WebViewBloc(this.site, super.context, super.initialState) {
    _init();
  }

  void _init() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            _webState(isLoading: true);
          },
          onPageStarted: (String url) {
            _webState(isCanReload: false);
          },
          onPageFinished: (String url) {
            _webState(isCanReload: true);
          },
          onWebResourceError: (WebResourceError error) {
            _webState(isCanReload: false, isLoading: true);
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(site));
  }

  Future<void> _webState({
    bool? isCanReload,
    bool? isLoading,
  }) async {
    final isCanGoBack = await controller.canGoBack();
    final isCanGoForward = await controller.canGoForward();
    final webViewState = WebViewState(
      isCanReload: isCanReload,
      isCanBackward: isCanGoBack,
      isCanForward: isCanGoForward,
      isLoading: isLoading,
    );
    add(BlocEvent(WebViewEventType.state, extra: webViewState));
  }

  @override
  FutureOr<void> onBlocEvent(
      BlocEvent<WebViewEventType> event, Emitter<WebViewState> emit) {
    switch (event.type) {
      case WebViewEventType.init:
        // TODO: Handle this case.
        break;
      case WebViewEventType.refresh:
        controller.reload();
        break;
      case WebViewEventType.close:
        if (context.canPop()) {
          context.pop();
        }
        break;
      case WebViewEventType.forward:
        controller.goForward();
        break;
      case WebViewEventType.backward:
        controller.goBack();
        break;
      case WebViewEventType.loading:
        break;
      case WebViewEventType.state:
        emit(event.extra as WebViewState);
        break;
    }
  }
}
