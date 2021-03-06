import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Navigation',
      home: HomeScreen(),
    ));

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Demo'),
        ),
        body: Center(child: SelectionButton()),
      );
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => RaisedButton(
        onPressed: () {
          //ここの遷移処理は複雑になるため、別メソッドにわかている。
          _navigateAndDisplaySelection(context);
        },
        child: Text('オプションを選択'),
      );

//  void _navigateAndDisplaySelection(BuildContext context) {
//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => SelectionScreen()),
//    );
//  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('選択してください'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    // 「選択肢１」というデータとともに元の画面に戻る処理
                    Navigator.pop(context, '選択肢１');
                  },
                  child: Text('選択肢１'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    //「選択肢２」というデータとともに元の画面に戻る処理
                    Navigator.pop(context, '選択肢２');
                  },
                  child: Text('選択肢２'),
                ),
              ),
            ],
          ),
        ),
      );
}

Future<void> _navigateAndDisplaySelection(BuildContext context) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SelectionScreen()),
  );

  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(result)));
}
