class AppConstant {
  static getTabBar(int value) {
    String tabBarValue = '';
    for (int i = 0; i <= value * 2.4; i++) {
      tabBarValue += '\t';
    }
    return tabBarValue;
  }

  static getBullet() {
    return '• ';
  }

  static String dartWhy = 'Why Should You Learn Dart?';
  static String summaryTitle = 'Summary';

  static String summary =
      'In summary, learning Dart can be a strategic decision if you\'re interested in mobile app development, web development, or concurrent programming. It\'s a versatile language that offers good performance, developer-friendly features, and a growing ecosystem. Additionally, Dart\'s strong ties to Flutter make it an excellent choice for cross-platform mobile app development.';
}
