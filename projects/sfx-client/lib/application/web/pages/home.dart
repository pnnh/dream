import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextButton(
              child: Text(
                "Link2",
                style: TextStyle(
                    color: Colors.amber, decoration: TextDecoration.underline),
              ),
              onPressed: () async {
                const url = "https://www.baidu.com";
                if (await canLaunch(url)) {
                  launch(url);
                }
              },
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "link",
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      const url = "https://www.baidu.com";
                      if (await canLaunch(url)) {
                        launch(url);
                      }
                    }),
            ])),
            Text("文章"),
            Text("动态"),
            Text("随机值")
          ],
        )
      ],
    );
  }
}
