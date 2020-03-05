import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Navigation',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TapBox'),
        ),
        body: Center(
          child: ParentWidget(),
        ),
      ),
    ));

class _TapBoxCState extends State<TapBoxC> {
  bool _highlight = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        onTap: _handleTap,
        child: Container(
          child: Center(
            child: Text(widget.active ? 'Active' : 'Inactive',
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.white,
                )),
          ),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
              border: _hightlight
                  ? Border.all(
                      color: Colors.teal[700],
                      width: 10,
                    )
                  : null),
        ),
      );

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }
}
