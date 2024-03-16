import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DilemmaCatagoryScreen extends StatefulWidget {
  const DilemmaCatagoryScreen({super.key});

  @override
  State<DilemmaCatagoryScreen> createState() => _DilemmaCatagoryScreenState();
}

class _DilemmaCatagoryScreenState extends State<DilemmaCatagoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop(context);
          },
        ),
        title: const Text('Dilemma Catagory'),
        actions: [
          // menu icon button
          MenuAnchor(
            builder: (context, controller, child) {
              return IconButton(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                icon: const Icon(Icons.more_horiz),
                tooltip: 'Show menu',
              );
            },
            menuChildren: List<MenuItemButton>.generate(
              3,
              (int index) => MenuItemButton(
                onPressed: () {},
                child: Text('Item ${index + 1}'),
              ),
            ),
          )
        ],
      ),
      body: Column(children: <Widget>[
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("오늘의 주제", style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: SizedBox(
                              height: 132,
                              child: Material(
                                  //color: Colors.red.shade200,
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      context.push('/dilemma/1/1');
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("e.g. 부먹 vs 찍먹"),
                                            Text("토론 남은 시간 : "),
                                            //더보기 버튼 시작점
                                            Row(
                                              children: <Widget>[
                                                Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: SizedBox(
                                                        child: Material(
                                                            //color: Colors.red.shade200,
                                                            color:
                                                                Colors.black12,
                                                            child: InkWell(
                                                              onTap: () {},
                                                              child:
                                                                  const Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <Widget>[
                                                                  Text("더보기"),
                                                                ],
                                                              ),
                                                            )))),
                                              ],
                                            ),
                                            //더보기 버튼 끝
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Container(
                                              height: 85,
                                              width: 85,
                                              decoration: const BoxDecoration(
                                                color: Colors.black54,
                                                shape: BoxShape.circle,
                                              ),
                                              child: ExtendedImage.network(
                                                "https://homecuisine.co.kr/files/attach/images/142/737/002/969e9f7dc60d42510c5c0353a58ba701.JPG",
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 3.0,
                                                ),
                                                fit: BoxFit.contain,
                                              )),
                                        ),
                                      ],
                                    ),
                                  )))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("인기 있었던 주제", style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: SizedBox(
                              height: 132,
                              child: Material(
                                  //color: Colors.red.shade200,
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      context.push('/dilemma/1/1');
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("오늘 주제 타이틀"),
                                            Text("토론 남은 시간 : "),
                                            //더보기 버튼 시작점
                                            Row(
                                              children: <Widget>[
                                                Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: SizedBox(
                                                        child: Material(
                                                            //color: Colors.red.shade200,
                                                            color:
                                                                Colors.black12,
                                                            child: InkWell(
                                                              onTap: () {},
                                                              child:
                                                                  const Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <Widget>[
                                                                  Text("더보기"),
                                                                ],
                                                              ),
                                                            )))),
                                              ],
                                            ),
                                            //더보기 버튼 끝
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Container(
                                              height: 85,
                                              width: 85,
                                              decoration: const BoxDecoration(
                                                color: Colors.black54,
                                                shape: BoxShape.circle,
                                              ),
                                              child: ExtendedImage.network(
                                                "https://homecuisine.co.kr/files/attach/images/142/737/002/969e9f7dc60d42510c5c0353a58ba701.JPG",
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 3.0,
                                                ),
                                                fit: BoxFit.contain,
                                              )),
                                        ),
                                      ],
                                    ),
                                  )))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("과거의 주제", style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: SizedBox(
                              height: 132,
                              child: Material(
                                  //color: Colors.red.shade200,
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      context.push('/dilemma/1/1');
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("오늘 주제 타이틀"),
                                            Text("토론 남은 시간 : "),
                                            //더보기 버튼 시작점
                                            Row(
                                              children: <Widget>[
                                                Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: SizedBox(
                                                        child: Material(
                                                            //color: Colors.red.shade200,
                                                            color:
                                                                Colors.black12,
                                                            child: InkWell(
                                                              onTap: () {},
                                                              child:
                                                                  const Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <Widget>[
                                                                  Text("더보기"),
                                                                ],
                                                              ),
                                                            )))),
                                              ],
                                            ),
                                            //더보기 버튼 끝
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Container(
                                              height: 85,
                                              width: 85,
                                              decoration: const BoxDecoration(
                                                color: Colors.black54,
                                                shape: BoxShape.circle,
                                              ),
                                              child: ExtendedImage.network(
                                                "https://homecuisine.co.kr/files/attach/images/142/737/002/969e9f7dc60d42510c5c0353a58ba701.JPG",
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 3.0,
                                                ),
                                                fit: BoxFit.contain,
                                              )),
                                        ),
                                      ],
                                    ),
                                  )))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ))
      ]),
    );
  }
}
