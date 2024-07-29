import 'package:get/get.dart';

import '../../../../api_manager.dart';
import '../../../data/models/lunch_info.dart';
import '../../../data/models/posts.dart';

class HomeController extends GetxController {
  final RxString _menuName = RxString("");
  final RxString _menu = RxString("");
  final RxList<Posts> _postsList = RxList([]);
  final Rxn<Posts> _selectedPost = Rxn();

  String get menuName => _menuName.value;
  String get menu => _menu.value;
  List<Posts> get postsList => _postsList.value;
  Posts? get selectedPosts => _selectedPost.value;

  set selectedPosts(Posts? posts) => _selectedPost.value = posts;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetch() async {
    DateTime now = DateTime.now();
    List<LunchInfo> liList = await ApiManager().getLunch(now.year, now.month);
    String keyword = "${now.day}일";

    for (LunchInfo li in liList) {
      if (li.day.startsWith(keyword)) {
        _menuName.value = " - ${li.menuName}";
        _menu.value = li.menu;
        break;
      }
    }

    if (_menu == "") {
      _menu.value = "정보가 없어요!";
    }

    List<Posts> tmpList = await ApiManager().getLatestPosts() as List<Posts>;
    _selectedPost.value = tmpList[0];
    _postsList.clear();
    _postsList.addAll(tmpList);
  }


}
