import 'package:bookstore_app/constants/custom_colors.dart';
import 'package:bookstore_app/data/model/comment.dart';
import 'package:bookstore_app/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';

class CustomCommentBox extends StatelessWidget {
  const CustomCommentBox({
    super.key,
    required this.comment,
  });
  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColors.textFieldBackground,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 45,
                height: 45,
                child: CustomCachedImage(
                  url: comment.userProfile,
                  radius: 25,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                comment.userName,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const Spacer(),
              getStars(comment.stars),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            comment.comment,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }

  Widget getStars(int starsCount) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: [
          for (int i = 1; i <= 5; i += 1)
            Icon(
              i <= comment.stars ? Icons.star : Icons.star_border_outlined,
              size: 18,
              color: Colors.amber,
            ),
        ],
      ),
    );
  }
}
