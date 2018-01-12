import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  Function _paste(BuildContext ctx) {
    return () async {
      try {
        ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
        Scaffold.of(ctx).showSnackBar(new SnackBar(
              content: new Text(
                data != null
                    ? 'Clipboard: "${data.text}"'
                    : 'ClipboardData is null',
              ),
            ));
      } catch (e) {
        print('caught: "${e.toString()}"');
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new Scaffold(
      floatingActionButton: new Builder(builder: (ctx) {
        return new FloatingActionButton(
          onPressed: _paste(ctx),
          tooltip: "Paste clipboard",
          child: new Icon(Icons.content_paste),
        );
      }),
    ));
  }
}
