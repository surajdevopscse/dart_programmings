class AppConstant {
  static getTabBar(int value) {
    String tabBarValue = '';
    for (int i = 0; i <= value * 2.4; i++) {
      tabBarValue += '\t';
    }
    return tabBarValue;
  }
}
