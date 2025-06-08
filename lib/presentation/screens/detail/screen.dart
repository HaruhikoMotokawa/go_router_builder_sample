import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_builder_sample/domain/user.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({required this.userId, super.key});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              // 大きめの円形アイコン
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: user.color.withOpacity(0.2),
                ),
                child: Center(
                  child: Icon(
                    user.image,
                    size: 80,
                    color: user.color,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 名前（大きく表示）
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // 情報カード
              _buildInfoCard('年齢', '${user.age}歳'),
              _buildInfoCard('趣味', user.hobby),
              _buildInfoCard('職業', user.job),
              _buildInfoCard('好きな食べ物', user.favoriteFood),
            ],
          ),
        ),
      ),
    );
  }

  // 各情報を表示するカードウィジェット
  Widget _buildInfoCard(String label, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
