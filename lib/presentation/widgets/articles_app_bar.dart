import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_app/core/constants/app_colors.dart';
import 'package:nyt_app/logic/cubit/articles_cubit.dart';

class ArticlesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ArticlesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.green,
      title: BlocBuilder<ArticlesCubit, ArticlesState>(
        builder: (context, state) {
          if (state is ArticlesLoaded && state.isSearching) {
            return TextField(
              controller: context.read<ArticlesCubit>().textEditingController,
              autofocus: true,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Search Articles...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: AppColors.white),
              ),
              onChanged: (query) {
                context.read<ArticlesCubit>().searchArticles(query);
              },
            );
          } else {
            return const Text(
              'NY Times Most Popular',
              maxLines: 1,
              style: TextStyle(color: AppColors.white),
            );
          }
        },
      ),
      actions: [
        BlocBuilder<ArticlesCubit, ArticlesState>(
          builder: (context, state) {
            if (state is ArticlesLoaded && state.isSearching) {
              return IconButton(
                icon: const Icon(Icons.clear, color: AppColors.white),
                onPressed: () {
                  context.read<ArticlesCubit>().stopSearch();
                },
              );
            } else {
              return IconButton(
                icon: const Icon(Icons.search, color: AppColors.white),
                onPressed: () {
                  context.read<ArticlesCubit>().startSearch();
                },
              );
            }
          },
        ),
      ],
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Default app bar height
}
