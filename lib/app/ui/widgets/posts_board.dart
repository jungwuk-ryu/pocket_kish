
import 'package:flutter/material.dart';

import '../../data/models/post.dart';

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
