import 'package:cat_app_flutter/core/utils/constants/core_constants.dart';

class HttpTimeouts {
  const HttpTimeouts({
    this.connectionTimeout = CoreConstants.defaultRequestConnectionTimeout,
    this.sendTimeout = CoreConstants.defaultRequestSendTimeout,
    this.receiveTimeout =  CoreConstants.defaultRequestReceiveTimeout
  });

  final int connectionTimeout;
  final int sendTimeout;
  final int receiveTimeout;
}