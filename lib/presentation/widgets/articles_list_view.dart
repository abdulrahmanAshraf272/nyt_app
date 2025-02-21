import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nyt_app/core/routes/routes_names.dart';
import 'package:nyt_app/data/models/article.dart';

class ArticlesListView extends StatelessWidget {
  final List<Article> articles;
  const ArticlesListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) => InkWell(
              onTap: () => Navigator.pushNamed(
                  context, RoutesNames.articleDetailsScreen,
                  arguments: articles[index]),
              child: ArticlesListItem(
                article: articles[index],
              ),
            ));
  }
}

class ArticlesListItem extends StatelessWidget {
  final Article article;
  const ArticlesListItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: article.media != null &&
                          article.media!.isNotEmpty &&
                          article.media!.first.mediaMetadata != null &&
                          article.media!.first.mediaMetadata!.isNotEmpty
                      ? FadeInImage.assetNetwork(
                          height: 40.w,
                          width: 40.w,
                          placeholder: 'assets/images/loading2.gif',
                          image:
                              '${article.media!.first.mediaMetadata!.first.url}',
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/no-image.png',
                          fit: BoxFit.cover,
                          height: 40.w,
                          width: 40.w,
                        ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text(
                        article.title ?? 'no title',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      Text(
                        article.byline ?? 'no abstract',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.grey,
                              size: 18,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              article.publishedDate ?? '',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 12.sp),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
