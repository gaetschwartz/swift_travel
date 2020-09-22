import 'package:connectivity/connectivity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _connectivityProvider = StreamProvider<ConnectivityResult>(
    (ref) => Connectivity().onConnectivityChanged);

enum NetworkStatus { notDetermined, on, off }

final networkAwareProvider = Provider<NetworkStatus>((ref) {
  final connectivity = ref.watch(_connectivityProvider);
  return connectivity.when(
    loading: () => NetworkStatus.notDetermined,
    error: (err, stack) => NetworkStatus.notDetermined,
    data: (status) {
      switch (status) {
        case ConnectivityResult.mobile:
        case ConnectivityResult.wifi:
          return NetworkStatus.on;
        case ConnectivityResult.none:
          return NetworkStatus.off;
      }
      return NetworkStatus.notDetermined;
    },
  );
});
