import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 1024,
              color: Colors.lightBlue,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text(
                      "sfx.xyz",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Cookie",
                          fontWeight: FontWeight.w700,
                          fontSize: 36),
                    ),
                    style: ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    onPressed: () async {
                      const url = "https://www.baidu.com";
                      if (await canLaunch(url)) {
                        launch(url);
                      }
                    },
                  ),
                  Text("文章"),
                  Text("动态"),
                  Text("随机值")
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
