import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router_builder_sample/core/router/route/route.dart';
import 'package:go_router_builder_sample/domain/user.dart';

part 'components/_image_container.dart';
part 'components/_info_card.dart';
part 'components/_name_text.dart';
part 'components/_navigation_buttons.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({required this.userId, super.key});

  final int userId;

  @override
  Widget build(BuildContext context) {
    final user = User.getById(userId);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ユーザー詳細',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // ユーザーのアイコンとカラー
              _ImageContainer(user: user),
              // 名前
              _NameText(user: user),
              // その他情報カード
              _InfoCard(label: '年齢', value: user.age.toString()),
              _InfoCard(label: '趣味', value: user.hobby),
              _InfoCard(label: '職業', value: user.job),
              _InfoCard(label: '好きな食べ物', value: user.favoriteFood),
              // ナビゲーションボタン
              _NavigationButtons(currentUserId: userId),
            ],
          ),
        ),
      ),
    );
  }
}
