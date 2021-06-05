import 'package:berlian_app/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:berlian_app/model/agenda.dart';

class MarkingPage extends StatefulWidget {
  @override
  _MarkingPageState createState() => _MarkingPageState();
}

class _MarkingPageState extends State<MarkingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 878) {
            return MobileMarkingPage();
          } else {
            return Stack(
              children: [
                WebMarkingPage(),
                Align(
          alignment: Alignment(-0.9,-0.8),
          child: CircleAvatar(
            child : IconButton(icon: Icon(Icons.arrow_back_ios_new),onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return MainPage();
              }));
            },),),
        )
              ],
            );
          }
        },
      ),
    );
  }
}

class WebMarkingPage extends StatefulWidget {
  @override
  _WebMarkingPageState createState() => _WebMarkingPageState();
}

class _WebMarkingPageState extends State<WebMarkingPage> {
  final ScrollController listController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: screenheight / 1.3,
              width: screenwidth / 2.8,
              color: Colors.white,
              child: Image.asset(
                "assets/images/img2.png",
                height: 300,
                width: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              width: screenwidth / 2,
              height: screenheight,
              child: Stack(
                children: [
                  Container(
                    child: Scrollbar(
                      isAlwaysShown: true,
                      controller: listController,
                      child: ListView.builder(
                        controller: listController,
                        itemBuilder: (context, index) {
                          final myAgenda = agendaList[index];
                          return InkWell(
                            onTap: () {},
                            child: Card(
                                child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: screenwidth/2.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(myAgenda.judul,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(height: 10),
                                        Text(
                                          myAgenda.desc,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(height: 10),
                                        Text(myAgenda.date),
                                        SizedBox(height: 10),
                                        LayoutBuilder(
                                            builder: (context, constraints) {
                                          if (myAgenda.isDone == true) {
                                            return Text(
                                              "Done",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12),
                                            );
                                          } else {
                                            return Text(
                                              "Remaining",
                                              style: TextStyle(
                                                  color: Colors.yellow[800],
                                                  fontSize: 12),
                                            );
                                          }
                                        })
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      LayoutBuilder(
                                          builder: (context, constraints) {
                                        if (myAgenda.isDone == true) {
                                          return IconButton(
                                            icon: Icon(Icons.undo,
                                                color: Colors.yellow[800],
                                                size: 35),
                                            onPressed: () {
                                              myAgenda.isDone = false;
                                              setState(() {});
                                            },
                                          );
                                        } else {
                                          return IconButton(
                                            icon: Icon(Icons.done,
                                                color: Colors.green, size: 35),
                                            onPressed: () {
                                              myAgenda.isDone = true;
                                              setState(() {});
                                            },
                                          );
                                        }
                                      }),
                                    ],
                                  )
                                ],
                              ),
                            )),
                          );
                        },
                        itemCount: agendaList.length,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 1),
                    child: ElevatedButton(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "SAVE",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                              side: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return MainPage();
                          }));
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MobileMarkingPage extends StatefulWidget {
  @override
  _MobileMarkingPageState createState() => _MobileMarkingPageState();
}

class _MobileMarkingPageState extends State<MobileMarkingPage> {
  final ScrollController listController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Scrollbar(
            isAlwaysShown: true,
            controller: listController,
            child: ListView.builder(
              controller: listController,
              itemBuilder: (context, index) {
                final myAgenda = agendaList[index];
                return InkWell(
                  onTap: () {},
                  child: Card(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: screenwidth/1.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(myAgenda.judul,
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text(
                                myAgenda.desc,
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 10),
                              Text(myAgenda.date),
                              SizedBox(height: 10),
                              LayoutBuilder(builder: (context, constraints) {
                                if (myAgenda.isDone == true) {
                                  return Text(
                                    "Done",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 12),
                                  );
                                } else {
                                  return Text(
                                    "Remaining",
                                    style: TextStyle(
                                        color: Colors.yellow[800], fontSize: 12),
                                  );
                                }
                              })
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            LayoutBuilder(builder: (context, constraints) {
                              if (myAgenda.isDone == true) {
                                return IconButton(
                                  icon: Icon(Icons.undo,
                                      color: Colors.yellow[800], size: 35),
                                  onPressed: () {
                                    myAgenda.isDone = false;
                                    setState(() {});
                                  },
                                );
                              } else {
                                return IconButton(
                                  icon: Icon(Icons.done,
                                      color: Colors.green, size: 35),
                                  onPressed: () {
                                    myAgenda.isDone = true;
                                    setState(() {});
                                  },
                                );
                              }
                            }),
                          ],
                        )
                      ],
                    ),
                  )),
                );
              },
              itemCount: agendaList.length,
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: ElevatedButton(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "SAVE",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return MainPage();
                  }));
                }),
          ),
        ],
      ),
    );
  }
}
