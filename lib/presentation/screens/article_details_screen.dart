import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nyt_app/core/constants/app_colors.dart';
import 'package:nyt_app/data/models/article.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Article article;
  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        title: const Text(
          'NY Times Most Popular',
          maxLines: 1,
          style: TextStyle(color: AppColors.white),
        ),
        leading: const BackButton(
          color: AppColors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 15,
            children: [
              const SizedBox(height: 10),
              Text(
                article.title ?? '',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              if (article.media != null && article.media!.isNotEmpty)
                Text(
                  article.media!.first.caption ?? '',
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                ),
              if (article.media != null &&
                  article.media!.isNotEmpty &&
                  article.media!.first.mediaMetadata != null &&
                  article.media!.first.mediaMetadata!.isNotEmpty)
                FadeInImage.assetNetwork(
                  height: 200.h,
                  width: double.infinity,
                  placeholder: 'assets/images/loading2.gif',
                  image: '${article.media!.first.mediaMetadata!.last.url}',
                  fit: BoxFit.cover,
                ),
              Text(
                article.abstractText ?? '',
                style: TextStyle(fontSize: 18.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
