import 'package:flutter/material.dart';

class User {
  User({
    required this.id,
    required this.name,
    required this.image,
    required this.color,
    required this.age,
    required this.hobby,
    required this.job,
    required this.favoriteFood,
  });

  /// ユーザーIDでユーザーを取得するファクトリメソッド。
  ///
  /// ユーザーが見つからない場合は、デフォルトのユーザーを返す。
  factory User.getById(int id) {
    return list.firstWhere(
      (user) => user.id == id,
      orElse: () => User(
        id: 0,
        name: 'Unknown',
        image: Icons.error,
        color: Colors.grey,
        age: 0,
        hobby: 'Unknown',
        job: 'Unknown',
        favoriteFood: 'Unknown',
      ),
    );
  }

  final int id;
  final String name;
  final IconData image;
  final MaterialColor color;
  final int age;
  final String hobby;
  final String job;
  final String favoriteFood;

  static List<User> list = [
    User(
      id: 1,
      name: 'アリス',
      image: Icons.face,
      color: Colors.red,
      age: 25,
      hobby: '読書',
      job: 'エンジニア',
      favoriteFood: '寿司',
    ),
    User(
      id: 2,
      name: 'ボブ',
      image: Icons.person,
      color: Colors.blue,
      age: 30,
      hobby: 'サッカー',
      job: 'デザイナー',
      favoriteFood: 'ラーメン',
    ),
    User(
      id: 3,
      name: 'キャロル',
      image: Icons.tag_faces,
      color: Colors.green,
      age: 28,
      hobby: 'ピアノ',
      job: '教師',
      favoriteFood: 'カレー',
    ),
    User(
      id: 4,
      name: 'ダン',
      image: Icons.sentiment_satisfied,
      color: Colors.orange,
      age: 35,
      hobby: '釣り',
      job: '医者',
      favoriteFood: '焼肉',
    ),
    User(
      id: 5,
      name: 'エミリー',
      image: Icons.emoji_people,
      color: Colors.purple,
      age: 22,
      hobby: '映画鑑賞',
      job: '学生',
      favoriteFood: 'パスタ',
    ),
    User(
      id: 6,
      name: 'フランク',
      image: Icons.mood,
      color: Colors.cyan,
      age: 40,
      hobby: 'ジョギング',
      job: 'シェフ',
      favoriteFood: 'うどん',
    ),
    User(
      id: 7,
      name: 'グレース',
      image: Icons.account_circle,
      color: Colors.teal,
      age: 27,
      hobby: '写真',
      job: 'カメラマン',
      favoriteFood: 'オムライス',
    ),
    User(
      id: 8,
      name: 'ヘンリー',
      image: Icons.person_outline,
      color: Colors.indigo,
      age: 33,
      hobby: '登山',
      job: '営業',
      favoriteFood: 'ピザ',
    ),
    User(
      id: 9,
      name: 'イザベル',
      image: Icons.emoji_emotions,
      color: Colors.pink,
      age: 29,
      hobby: '料理',
      job: 'ライター',
      favoriteFood: 'サラダ',
    ),
    User(
      id: 10,
      name: 'ジャック',
      image: Icons.sentiment_very_satisfied,
      color: Colors.amber,
      age: 38,
      hobby: '旅行',
      job: 'パイロット',
      favoriteFood: '天ぷら',
    ),
  ];
}
