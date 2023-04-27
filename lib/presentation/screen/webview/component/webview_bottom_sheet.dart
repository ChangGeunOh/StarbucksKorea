import 'package:flutter/material.dart';
import 'package:starbucks/presentation/screen/webview/bloc/webview_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../bloc/webview_event.dart';

class WebViewBottomSheet extends StatelessWidget {
  final WebViewState state;
  final ValueChanged<WebViewEventType> onClick;



  const WebViewBottomSheet({
    Key? key,
    required this.onClick,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => onClick(WebViewEventType.backward),
            icon:  Icon(
              Icons.chevron_left_rounded,
              size: 34,
              color: state.isCanForward ? Colors.white : Colors.black45,
            ),
          ),
          IconButton(
            onPressed: () => onClick(WebViewEventType.refresh),
            icon: Icon(
              Icons.refresh_rounded,
              size: 34,
              color: state.isCanReload ? Colors.white : Colors.black45,
            ),
          ),
          IconButton(
            onPressed: () => onClick(WebViewEventType.close),
            icon:  const Icon(
              Icons.close_rounded,
              size: 34,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => onClick(WebViewEventType.forward),
            icon:  Icon(
              Icons.chevron_right_rounded,
              size: 34,
              color: state.isCanForward ? Colors.white : Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}