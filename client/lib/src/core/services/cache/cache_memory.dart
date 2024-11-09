import 'dart:async';

import 'package:flutter/foundation.dart';

abstract class CachedMemory<T> {
  CachedMemory({
    this.keepCachedByDuration,
    this.requestTimeout,
  });

  final Duration? keepCachedByDuration;
  final Duration? requestTimeout;

  Completer<T>? _completer;

  Timer? _timer;

  void _setTimer() {
    _timer?.cancel();

    if (keepCachedByDuration != null) {
      _timer = Timer(keepCachedByDuration!, _setDataToNull);
    }
  }

  void _setDataToNull() => _completer = null;

  @protected
  Future<T> request();

  Future<T> _requestErrorHandler() {
    final Future<T> future;

    if (requestTimeout == null) {
      future = request();
    } else {
      future = request().timeout(requestTimeout!);
    }

    return future.onError(
      (error, stackTrace) {
        error ??= Exception('CachedMemory<$T>: error on request in $runtimeType.');

        clearData();

        debugPrint('CachedMemory<$T> error ($runtimeType): $error');

        throw error;
      },
    );
  }

  Future<T> getData() async {
    if (_completer != null) return await _completer!.future;

    _completer = Completer<T>()..complete(_requestErrorHandler());

    _setTimer();

    return await _completer!.future;
  }

  /// Use this method to clear the cached data.
  void clearData() {
    _timer?.cancel();
    _setDataToNull();
  }

  @override
  String toString() => 'CachedMemory<$T>($runtimeType)';
}

class CachedMemoryException implements Exception {
  const CachedMemoryException({
    required this.cachedMemory,
    required this.exception,
  });

  final CachedMemory cachedMemory;
  final Object exception;

  @override
  String toString() => '$CachedMemoryException(cachedMemory: $cachedMemory, exception: $exception)';
}
