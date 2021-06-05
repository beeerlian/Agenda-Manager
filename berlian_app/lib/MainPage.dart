import 'package:berlian_app/AddingPage.dart';
import 'package:berlian_app/DeletingPage.dart';
import 'package:berlian_app/EdittingPage.dart';
import 'package:berlian_app/MarkingPage.dart';
import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:berlian_app/model/agenda.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 878) {
          return MobileMainPage();
        } else {
          return WebMainPage();
        }
      },
    ));
  }
}

class WebMainPage extends StatefulWidget {
  @override
  _WebMainPageState createState() => _WebMainPageState();
}

class _WebMainPageState extends State<WebMainPage> {
  final ScrollController listController = ScrollController();
  final ScrollController mainController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/back-1.png"),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: screenheight,
                    child: Scrollbar(
                      isAlwaysShown: true,
                      controller: mainController,
                      child: ListView(
                        controller: mainController,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SlimyCard(
                                borderRadius: 20,
                                width: screenwidth / 4.5,
                                color: Colors.white,
                                topCardHeight: screenheight / 2.4,
                                bottomCardHeight: 100,
                                slimeEnabled: true,
                                topCardWidget:
                                    Image.asset("assets/images/img1.png"),
                                bottomCardWidget:
                                    buildElevatedButton("Add", AddingPage()),
                              ),
                              SizedBox(width: 5),
                              SlimyCard(
                                borderRadius: 20,
                                width: screenwidth / 4.5,
                                color: Colors.white,
                                topCardHeight: screenheight / 2.4,
                                bottomCardHeight: 100,
                                slimeEnabled: true,
                                topCardWidget:
                                    Image.asset("assets/images/img2.png"),
                                bottomCardWidget: buildElevatedButton(
                                    "Mark As Done", MarkingPage()),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SlimyCard(
                                borderRadius: 20,
                                width: screenwidth / 4.5,
                                color: Colors.white,
                                topCardHeight: screenheight / 2.4,
                                bottomCardHeight: 100,
                                slimeEnabled: true,
                                topCardWidget:
                                    Image.asset("assets/images/img3.png"),
                                bottomCardWidget: buildElevatedButton(
                                    "Hapus", DeletingPage()),
                              ),
                              SizedBox(width: 5),
                              SlimyCard(
                                borderRadius: 20,
                                width: screenwidth / 4.5,
                                color: Colors.white,
                                topCardHeight: screenheight / 2.4,
                                bottomCardHeight: 100,
                                slimeEnabled: true,
                                topCardWidget:
                                    Image.asset("assets/images/img4.png"),
                                bottomCardWidget:
                                    buildElevatedButton("Edit", EdittingPage()),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      height: screenheight,
                      child: Card(
                        child: Scrollbar(
                          controller: listController,
                          isAlwaysShown: true,
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
                                        width: screenwidth / 2.5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(myAgenda.judul,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(height: 10),
                                            Text(
                                              myAgenda.desc,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            SizedBox(height: 10),
                                            Text(myAgenda.date)
                                          ],
                                        ),
                                      ),
                                      LayoutBuilder(
                                          builder: (context, constraints) {
                                        if (myAgenda.isDone == true) {
                                          return Icon(
                                            Icons.done,
                                            color: Colors.green,
                                            size: 20,
                                          );
                                        } else {
                                          return Icon(
                                            Icons.access_time_rounded,
                                            color: Colors.yellow[800],
                                            size: 20,
                                          );
                                        }
                                      })
                                    ],
                                  ),
                                )),
                              );
                            },
                            itemCount: agendaList.length,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextButton buildElevatedButton(String text, Widget route) {
    return TextButton(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.red),
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return route;
        }));
      },
    );
  }
}

class MobileMainPage extends StatefulWidget {
  @override
  _MobileMainPageState createState() => _MobileMainPageState();
}

class _MobileMainPageState extends State<MobileMainPage> {
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/back-1.png"),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SlimyCard(
                  borderRadius: 20,
                  width: screenwidth / 2.2,
                  color: Colors.white,
                  topCardHeight: 200,
                  bottomCardHeight: 100,
                  slimeEnabled: true,
                  topCardWidget: Image.asset("assets/images/img1.png"),
                  bottomCardWidget: buildElevatedButton("Add", AddingPage()),
                ),
                SlimyCard(
                  borderRadius: 20,
                  width: screenwidth / 2.2,
                  color: Colors.white,
                  topCardHeight: 200,
                  bottomCardHeight: 100,
                  slimeEnabled: true,
                  topCardWidget: Image.asset("assets/images/img2.png"),
                  bottomCardWidget:
                      buildElevatedButton("Mark As Done", MarkingPage()),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SlimyCard(
                  borderRadius: 20,
                  width: screenwidth / 2.2,
                  color: Colors.white,
                  topCardHeight: 200,
                  bottomCardHeight: 100,
                  slimeEnabled: true,
                  topCardWidget: Image.asset("assets/images/img3.png"),
                  bottomCardWidget:
                      buildElevatedButton("Hapus", DeletingPage()),
                ),
                SlimyCard(
                  borderRadius: 20,
                  width: screenwidth / 2.2,
                  color: Colors.white,
                  topCardHeight: 200,
                  bottomCardHeight: 100,
                  slimeEnabled: true,
                  topCardWidget: Image.asset("assets/images/img4.png"),
                  bottomCardWidget: buildElevatedButton("Edit", EdittingPage()),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
                width: screenwidth / 2,
                height: screenheight / 1.2,
                child: Card(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final myAgenda = agendaList[index];
                      return InkWell(
                        onTap: () {},
                        child: Card(
                            child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: screenwidth/1.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    Text(myAgenda.date)
                                  ],
                                ),
                              ),
                              LayoutBuilder(builder: (context, constraints) {
                                if (myAgenda.isDone == true) {
                                  return Icon(
                                    Icons.done,
                                    color: Colors.green,
                                    size: 35,
                                  );
                                } else {
                                  return Icon(
                                    Icons.access_time_rounded,
                                    color: Colors.yellow[800],
                                    size: 35,
                                  );
                                }
                              })
                            ],
                          ),
                        )),
                      );
                    },
                    itemCount: agendaList.length,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  TextButton buildElevatedButton(String text, Widget route) {
    return TextButton(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.red),
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return route;
        }));
      },
    );
  }
}

class TextBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 20,
        ),
        textField(false, 20, "Username"),
        SizedBox(height: 20),
        textField(true, 10, "Passwor"),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Masuk",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 40,
                  color: Colors.blue,
                ),
                onPressed: () {})
          ]),
        ),
      ],
    );
  }

  Container textField(bool obs, int max, String labeltext) => Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: TextField(
          obscureText: obs,
          maxLength: max,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: labeltext),
        ),
      );
}
