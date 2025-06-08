import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HelpScreen extends ConsumerWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ようこそ！',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              const Text(
                'このアプリは、GoRouter と Riverpod を組み合わせた\n'
                'ナビゲーションサンプルです。以下の機能を体験できます。\n'
                '\n'
                '• Home 画面 – トップページ\n'
                '• Settings 画面 – テーマ/環境設定\n'
                '• Help 画面 – 現在のヘルプページ\n',
              ),
              const SizedBox(height: 16),
              const Text(
                '🔰 使い方',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                '下部のナビゲーションバーから各画面に移動できます。\n'
                'また、URL パスを直接入力してページ遷移を試すことも可能です。',
              ),
              const SizedBox(height: 16),
              const Text(
                '🛠️ 技術スタック',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                '• Flutter 3.22\n'
                '• go_router 14.x 系\n'
                '• hooks_riverpod 3.x 系\n'
                '• go_router_builder 3.x 系',
              ),
              const SizedBox(height: 16),
              const Text(
                'ご意見・ご要望・不具合報告は GitHub Issues にて\n'
                'お気軽にお知らせください。',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
