import 'package:get/get.dart';

enum RouteName{rich,poor}

class NavigationCotroller extends GetxController{
  static NavigationCotroller get to => Get.find();
  RxInt currentIndex = 0.obs;

  void chageCurrentPage(int index){
    currentIndex(index);
  }
}