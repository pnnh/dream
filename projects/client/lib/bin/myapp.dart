import 'package:flutter/material.dart';

import '../services.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '诉记',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: '诉记'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _list = [];
  String _loadingText = "";
  bool _isLoading = false;
  int minCreated = 0;

  final myController = TextEditingController();

  void _loadMore() {
    print("_loadMore()");
    if (_isLoading) {
      return;
    }
    print("_loadMore() start $minCreated");
    _isLoading = true;
    _showLoadingTip("正在加载更多");
    loadArticles(minCreated)
        .then((data) => data.forEach((el) {
              //print("=== ${el.created}");
              if (minCreated == 0 || el.created < minCreated) {
                minCreated = el.created;
              }
              _incrementCounter(el);
            }))
        .catchError((err) => print("加载内容出错 $err"))
        .whenComplete(() => {_isLoading = false, _showLoadingTip("")});
  }

  void _showLoadingTip(String text) {
    setState(() {
      _loadingText = text;
    });
  }

  void _saveArticle(String content) {
    if (content == null || content == "") return;
    var article = new Article();
    article.content = content;
    article.created = new DateTime.now().microsecondsSinceEpoch * 1000; // 纳秒
    // 保存至服务器
    saveArticle(content)
        .then((value) => {
              // 将最小时间设置为0，加载最新
              //minCreated = 0,

              myController.text = "",
              setState(() {
                _list.insert(0, article);
              })
              //_loadMore()
            })
        .catchError((err) => print("保存出错 $err"));
  }

  void _incrementCounter(Article article) {
    if (article == null ||
        article.content == "" ||
        article.content == null ||
        article.created <= 0) {
      return;
    }
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _list.add(article);
    });
  }

  Widget buildList(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          _loadMore();
        }
        return false;
      },
      child: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            title: Container(
              width: double.infinity,
              //color: Colors.lime,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFFFFFFF), width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(3)),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.5),
                //     spreadRadius: 3,
                //     blurRadius: 3,
                //     offset: Offset(0, 1), // changes position of shadow
                //   ),
                // ],
                color: Colors.white,
              ),
              //padding: EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Container(
                    //color: Colors.green,
                    width: double.infinity,
                    child: Text('${(_list[index] as Article).content}'),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(bottom: 5),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        // color: Colors.tealAccent,
                        border: new Border(
                            top: new BorderSide(
                                color: Color(0xfff2f2f5),
                                width: 0.5,
                                style: BorderStyle.solid))),
                    child: Text(
                      "发布于 ${formatDateTime((_list[index] as Article).created)}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );

    // return new ListView(
    //   // shrinkWrap: true,
    //   children:
    //       _list.map((e) => new ListTile(title: new SelectableText(e))).toList(),
    // );
  }

  @override
  void initState() {
    super.initState();
    _loadMore();
  }

  // 获取主容器及边栏留白
  // main 是否主内容容器
  int _mainRowFlex(BuildContext context, bool main) {
    var mediaQueryData = MediaQuery.of(context);
    print("media ${mediaQueryData.size}");
    // 主内容容器
    if (main) {
      if (mediaQueryData.size.width < 640) {
        return 10;
      }
      return 3;
    } else {
      // 两边留白
      if (mediaQueryData.size.width < 640) {
        return 1;
      }
    }

    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff6f6f6),
        //backgroundColor: Colors.white,
        body: Container(
          //color: Colors.amber,
          child: Row(
            children: [
              Expanded(
                child: Container(),
                flex: _mainRowFlex(context, false),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        //color: Colors.blue,
                        height: 100.0,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        //padding: EdgeInsets.only(left: 20, right: 20),
                        child: SelectableText(
                          '诉记',
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontSize: 28),
                        )),

                    // Expanded(
                    //   child:
                    Container(
                      //color: Colors.purpleAccent,
                      //height: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: new BoxDecoration(
                        // border: new Border.all(color: Color(0xFFFFFFFF), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.5),
                        //     spreadRadius: 5,
                        //     blurRadius: 7,
                        //     offset: Offset(0, 3), // changes position of shadow
                        //   ),
                        // ],
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  child: TextField(
                                    autofocus: true,
                                    maxLines: null,
                                    keyboardType: TextInputType.multiline,
                                    decoration: new InputDecoration(
                                      fillColor: Colors.white,
                                      focusColor: Colors.white,
                                      hoverColor: Colors.white,
                                      border: new OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.teal)),
                                      suffixStyle:
                                          const TextStyle(color: Colors.green),
                                      filled: true,
                                      labelText: '写下想说的话',
                                    ),
                                    controller: myController,
                                  ),
                                  // color: Colors.black,
                                  // width: double.infinity,
                                ),
                                flex: 1,
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    //color: Colors.lime,
                                    // child: FlatButton(
                                    //   child: Text("normal"),
                                    //   onPressed: () {},
                                    // ),
                                    // alignment: Alignment.centerLeft,
                                    ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Container(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    //color: Colors.greenAccent,
                                    child: FlatButton(
                                      //splashColor: Colors.blue,
                                      color: Colors.blue,
                                      hoverColor: Colors.blue,
                                      textColor: Colors.white,
                                      child: Text("发布"),
                                      onPressed: () {
                                        _saveArticle(myController.text);
                                      },
                                    ),
                                    alignment: Alignment.centerRight),
                                flex: 2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //   flex: 1,
                    // ),

                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(top: 10),
                          //color: Colors.lime,
                          // decoration: new BoxDecoration(
                          //   border:
                          //       new Border.all(color: Color(0xFFFFFFFF), width: 1),
                          //   borderRadius: BorderRadius.all(Radius.circular(5)),
                          //   boxShadow: [
                          //     BoxShadow(
                          //       color: Colors.grey.withOpacity(0.5),
                          //       spreadRadius: 5,
                          //       blurRadius: 7,
                          //       offset: Offset(0, 3), // changes position of shadow
                          //     ),
                          //   ],
                          //   color: Colors.white,
                          // ),
                          child: Scrollbar(
                            child: Container(
                                //color: Colors.purpleAccent,
                                width: double.infinity,
                                child: buildList(context) //Text("dddd"),
                                ),
                          )
                          //  alignment: Alignment.topRight,
                          ),
                      flex: 3,
                    ),

                    Container(
                      width: double.infinity,
                      //color: Colors.lime,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Center(
                        child: Text(_loadingText),
                      ),
                    )
                  ],
                ),
                flex: _mainRowFlex(context, true),
              ),
              Expanded(
                child: Container(),
                flex: _mainRowFlex(context, false),
              ),
            ],
          ),
        ));
  }
}
