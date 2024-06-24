import 'package:cinepedia/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//DarkMode
//Un simple bool

final isDarkModeProvider = StateProvider(
  (ref) => false,
);

//Un objero de tipo AppTheme (Cuastom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
}
