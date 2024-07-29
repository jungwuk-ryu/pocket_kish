import 'package:cp949_dart/cp949_dart.dart';
import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

import 'app/data/models/lunch_info.dart';
import 'app/data/models/post.dart';
import 'app/data/models/posts.dart';

class ApiManager {
  static const String host = "http://www.hanoischool.net";

  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 1),
    responseDecoder: (responseBytes, options, responseBody) =>
        decode(responseBytes),
  ));

  Future<Response> getRequest(String url) async {
    Response rp = await dio.get(url);
    return rp;
  }

  Future<List> getLatestPosts() async {
    Response rp = await getRequest(host);
    List<Posts> postsList = [];
    if (rp.statusCode == 200) {
      Document doc = parse(rp.data);
      List<Element> eleList =
          doc.querySelector("#m_board_area")!.querySelectorAll(".mboard01");

      for (Element ele in eleList) {
        String title = ele.querySelector(".ti_bg.notosans")!.text;
        Posts posts = Posts(title);

        for (Element postElement in ele.querySelectorAll("li")) {
          String postTitle;
          String postDate;

          postTitle = postElement.querySelector("a")!.text;
          postDate = postElement.querySelector("span")!.text;

          Post post = Post(
              title: postTitle,
              date: postDate,
              url:
                  '$host${postElement.querySelector("a")!.attributes['href']}');
          posts.addPost(post);
        }

        postsList.add(posts);
      }
    }

    return postsList;
  }

  Future<List<LunchInfo>> getLunch(int year, int month) async {
    Response rp = await getRequest(
        "$host/?menu_no=47&ChangeDate=$year-$month-1");
    List<LunchInfo> liList = [];

    if (rp.statusCode == 200) {
      String data = rp.data;
      List<Element> days = parse(data)
          .querySelectorAll(".h_board2")[1]
          .querySelectorAll(".h_line_dot");

      for (Element day in days) {
        String dayName = day.querySelector("span")!.text;
        Element? data = day.querySelector(".mm_to");
        String menuName = '';
        String menu = '';
        if (data != null) {
          List<Element> strList = data.querySelectorAll("a");
          menuName = strList[0].text.trim();
          menu = strList[1].text.trim();
        }
        LunchInfo li = LunchInfo(day: dayName, menuName: menuName, menu: menu);
        liList.add(li);
      }
    }
    return liList;
  }
}