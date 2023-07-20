import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pocket_kish/api_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
          fontFamily: "NanumSquare"),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String menuName = "";
  String menu = "";

  List<PostsBoard> postsList = [];

  Future<void> fetch() async {
    DateTime now = DateTime.now();
    List<LunchInfo> liList = await ApiManager().getLunch(now.year, now.month);
    String keyword = "${now.day}일";

    for (LunchInfo li in liList) {
      if (li.day.startsWith(keyword)) {
        menuName = " - ${li.menuName}";
        menu = li.menu;
        setState(() {});
        break;
      }
    }

    if (menu == "") {
      menu = "정보가 없어요!";
    }

    for (Posts ps in await ApiManager().getLatestPosts()) {
      postsList.add(PostsBoard(name: ps.name, postList: ps.getPostList()));
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE7EAEC),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 20 - 20) / 2 -
                          10,
                      height: 200,
                      decoration: BoxDecoration(
                          color: const Color(0xCCFFFFFF),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 20,
                                spreadRadius: 1,
                                blurStyle: BlurStyle.normal,
                                offset: Offset(0, 20))
                          ]),
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              "Welcome to",
                              minFontSize: 30,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            AutoSizeText(
                              'KISH',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF003470)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width - 20 - 20) / 2 -
                          10,
                      height: 200,
                      decoration: BoxDecoration(
                          color: const Color(0xCCFFFFFF),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 20,
                                spreadRadius: 1,
                                blurStyle: BlurStyle.normal,
                                offset: Offset(0, 20))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "오늘의 급식$menuName",
                              style: const TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                            Expanded(child: Text(menu)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ...postsList
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostsBoard extends StatelessWidget {
  final String name;
  final List<Post> postList;

  const PostsBoard({super.key, required this.name, required this.postList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                //height: 200,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: const Color(0xCCFFFFFF),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          spreadRadius: 1,
                          blurStyle: BlurStyle.normal,
                          offset: Offset(0, 20))
                    ]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: postList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          Post post = postList[index];
                          return TextButton(
                            onPressed: () {},
                            style: const ButtonStyle(
                                padding:
                                    MaterialStatePropertyAll(EdgeInsets.zero)),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  post.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Color(0xFF000000)),
                                )),
                                Text(
                                  post.date,
                                  style: const TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.orange, blurRadius: 10)
                ]),
            child: Text(
              name,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}
