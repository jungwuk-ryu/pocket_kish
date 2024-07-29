import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_kish/app/data/models/post.dart';
import 'package:pocket_kish/app/ui/themes/app_colors.dart';

class PostInfoContainer extends StatelessWidget {
  final Post post;
  const PostInfoContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title, style: TextStyle(
                color: AppColors.textBlack,
                fontSize: 16.spMin,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis
            ),),
            Text(post.date, style: TextStyle(
                color: AppColors.textBrown,
                fontSize: 14.spMin
            ),)
          ],
        ),
      ),
    );
  }

}