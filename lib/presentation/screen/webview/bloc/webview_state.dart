class WebViewState {
  final bool isCanBackward;
  final bool isCanForward;
  final bool isCanReload;
  final bool isLoading;

  WebViewState({
    bool? isCanBackward,
    bool? isCanForward,
    bool? isCanReload,
    bool? isLoading,
  })  : isCanBackward = isCanBackward ?? false,
        isCanForward = isCanForward ?? false,
        isCanReload = isCanReload ?? true,
        isLoading = isLoading ?? false;

  WebViewState copyWith({
    bool? isCanBackward,
    bool? isCanForward,
    bool? isCanReload,
    bool? isLoading,
  }) {
    return WebViewState(
      isLoading: isLoading ?? this.isLoading,
      isCanBackward: isCanBackward ?? this.isCanBackward,
      isCanForward: isCanForward ?? this.isCanForward,
      isCanReload: isCanReload ?? this.isCanReload,
    );
  }
}
