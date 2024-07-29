import 'package:get/get.dart';

import '../../../../api_manager.dart';
import '../../../data/models/lunch_info.dart';
import '../../../data/models/posts.dart';
import '../../../ui/widgets/posts_board.dart';

class HomeController extends GetxController {
  final RxString _menuName = RxString("");
  final RxString _menu = RxString("");
  final RxList<PostsBoard> _postsList = RxList([]);

  String get menuName => _menuName.value;
  String get menu => _menu.value;
  List<PostsBoard> get postsBoardList => _postsList.value;

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

    List<PostsBoard> tmpList = [];
    for (Posts ps in await ApiManager().getLatestPosts()) {
      tmpList.add(PostsBoard(name: ps.name, postList: ps.getPostList()));
    }
    _postsList.clear();
    _postsList.addAll(tmpList);
  }


}
