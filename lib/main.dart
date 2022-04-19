import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  /// 選択中の都道府県
  String? _prefecture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SimpleDialog Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _prefecture ?? '未選択',
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 選択ダイアログを表示して、選択した都道府県を受け取る
          final selectedPrefecture = await showDialog<String>(
            context: context,
            builder: (context) => _PrefectureSelectorDialog(
              prefecture: _prefecture,
            ),
          );
          if (selectedPrefecture != null) {
            // 選択中の都道府県を更新してリビルドする
            setState(() {
              _prefecture = selectedPrefecture;
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// 都道府県を選択するダイアログ
/// 選択されたら都道府県の文字列を返す
/// キャンセルされたら null を返す
class _PrefectureSelectorDialog extends StatelessWidget {
  const _PrefectureSelectorDialog({
    Key? key,
    this.prefecture,
  }) : super(key: key);

  /// 選択中の都道府県
  final String? prefecture;

  /// 都道府県ー一覧
  static const _prefectures = [
    '北海道',
    '青森県',
    '岩手県',
    '宮城県',
    '秋田県',
    '山形県',
    '福島県',
    '茨城県',
    '栃木県',
    '群馬県',
    '埼玉県',
    '千葉県',
    '東京都',
    '神奈川県',
    '新潟県',
    '富山県',
    '石川県',
    '福井県',
    '山梨県',
    '長野県',
    '岐阜県',
    '静岡県',
    '愛知県',
    '三重県',
    '滋賀県',
    '京都府',
    '大阪府',
    '兵庫県',
    '奈良県',
    '和歌山県',
    '鳥取県',
    '島根県',
    '岡山県',
    '広島県',
    '山口県',
    '徳島県',
    '香川県',
    '愛媛県',
    '高知県',
    '福岡県',
    '佐賀県',
    '長崎県',
    '熊本県',
    '大分県',
    '宮崎県',
    '鹿児島県',
    '沖縄県',
  ];

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: _prefectures
          .map(
            (p) => ListTile(
              leading: Visibility(
                visible: p == prefecture,
                child: const Icon(Icons.check),
              ),
              title: Text(p),
              onTap: () {
                Navigator.of(context).pop(p);
              },
            ),
          )
          .toList(),
    );
  }
}
