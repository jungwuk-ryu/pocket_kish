import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

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
                const SizedBox(height: 30),
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
                    const SizedBox(width: 20),
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
                            Obx(() =>                             Text(
                              "오늘의 급식${controller.menuName}",
                              style: const TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            )),
                            Expanded(child: Text(controller.menu)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(() => Column(children: controller.postsBoardList))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
