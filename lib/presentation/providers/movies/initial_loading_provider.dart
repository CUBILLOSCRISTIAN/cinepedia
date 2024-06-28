import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_providers.dart';

final initialLoadingProvider = Provider<bool>(
  (ref) {
    final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
    final step2 = ref.watch(popularMoviesProvider).isEmpty;
    final step3 = ref.watch(topRatedMoviesProvider).isEmpty;
    final step4 = ref.watch(upcomingMoviesProvider).isEmpty;

    // Asegurarte de que tarda al menos 5 segundos

    if (step1 || step2 || step3 || step4) {
      Future.delayed(const Duration(minutes: 2));
      return true;
    }
    Future.delayed(const Duration(minutes: 2));
    return false; // Terminamos de cargar
  },
);
