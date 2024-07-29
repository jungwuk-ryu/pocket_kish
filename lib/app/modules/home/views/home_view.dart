import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pocket_kish/app/data/models/posts.dart';
import 'package:pocket_kish/app/ui/widgets/post_info_container.dart';

import '../../../data/models/post.dart';
import '../../../ui/themes/app_colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          SizedBox(height: 12.h),
          _lunchBody(),
          Obx(() {
            if (controller.postsList.isEmpty) {
              return const LinearProgressIndicator();
            }
            return _categoryBoard();
          }),
          Expanded(child: _postTable())
        ],
      ),
    );
  }

  Widget _title() {
    return Text("Welcome to KISH",
        style: TextStyle(
            fontSize: 32.spMin,
            fontWeight: FontWeight.bold,
            color: AppColors.textBlack));
  }

  Widget _lunchBody() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 358 / 201,
            child: Image.asset("assets/images/lunch.png"),
          ),
          SizedBox(height: 16.h),
          Text("오늘의 급식",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.spMin,
                  color: AppColors.textBlack)),
          SizedBox(height: 4.h),
          Obx(() => Text(
                "${controller.menu}",
                style:
                    TextStyle(color: AppColors.textBrown, fontSize: 16.spMin),
              )),
        ],
      ),
    );
  }

  Widget _categoryBoard() {
    Widget _categorySelectButton(Posts posts) {
      return Expanded(
          child: GestureDetector(
        onTap: () {
          controller.selectedPosts = posts;
        },
        child: Obx(() => Center(
              child: Text(
                posts.name,
                style: TextStyle(
                    color: AppColors.textBrown,
                    fontSize: 14.spMin,
                    fontWeight: controller.selectedPosts?.name == posts.name
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
            )),
      ));
    }

    List<Widget> buttons = [];
    for (Posts value in controller.postsList) {
      buttons.add(_categorySelectButton(value));
    }

    return Container(
      width: double.infinity,
      height: 40.h,
      decoration: BoxDecoration(
          color: AppColors.brown, borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        children: buttons,
      ),
    );
  }

  Widget _postTable() {
    return Obx(() {
      if (controller.selectedPosts == null) return const SizedBox.shrink();
      List<Post> postList = controller.selectedPosts!.getPostList();

      return ListView.builder(
          itemBuilder: (context, index) =>
              PostInfoContainer(post: postList[index]),
          itemCount: postList.length);
    });
  }
}
