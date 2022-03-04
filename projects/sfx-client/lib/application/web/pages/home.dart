import 'package:flutter/material.dart';
import 'package:sfxui/application/web/pages/random.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.white,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 1024,
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
                    TextButton(
                      child: Text(
                        "文章",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
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
                    TextButton(
                      child: Text(
                        "动态",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
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
                    TextButton(
                      child: Text(
                        "随机值",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
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
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 1024,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(const Radius.circular(4)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [RandomWidget()],
              ),
            )
          ],
        )
      ],
    );
  }
}
