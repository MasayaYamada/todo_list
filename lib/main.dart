import 'package:flutter/material.dart';

class ToDo {
  final String title;
  final String description;

  ToDo({@required this.title, @required this.description})
      : assert(title != null),
        assert(description != null);
}

void main() => runApp(MaterialApp(
      title: 'Navigation',
      home: TodoScreen(
        // サンプルなのでlist.generatorを使用して、機械的に作成していく。
        todos: List<ToDo>.generate(
            20,
            (i) => ToDo(
                  title: 'TODO $i',
                  description: 'TODO $i の詳細',
                )),
      ),
    ));

class TodoScreen extends StatelessWidget {
  final List<ToDo> _todos;

  TodoScreen({Key key, @required List<ToDo> todos})
      : assert(todos != null),
        this._todos = todos,
        super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('TODO リスト'),
        ),
        body: ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (context, index) => ListTile(
              title: Text(_todos[index].title),
              onTap: () {
                // TODOの詳細画面に遷移する処理
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(todo: _todos[index]),
                  ),
                );
              }),
        ),
      );
}

class DetailScreen extends StatelessWidget {
  final ToDo _todo;

  DetailScreen({Key key, @required ToDo todo})
      : assert(todo != null),
        this._todo = todo,
        super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(_todo.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(_todo.description),
        ),
      );
}
