import 'package:berlian_app/MainPage.dart';
import 'package:berlian_app/TextEditor.dart';
import 'package:flutter/material.dart';
import 'package:berlian_app/model/agenda.dart';

class EdittingPage extends StatefulWidget {
  const EdittingPage({Key? key}) : super(key: key);

  @override
  _EdittingPageState createState() => _EdittingPageState();
}

class _EdittingPageState extends State<EdittingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 878) {
            return MobileEdittingPage();
          } else {
            return Stack(
              children: [
                WebEditingPage(),
                Align(
                  alignment: Alignment(-0.9, -0.8),
                  child: CircleAvatar(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return MainPage();
                        }));
                      },
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}

class WebEditingPage extends StatefulWidget {
  const WebEditingPage({Key? key}) : super(key: key);

  @override
  _WebEditingPageState createState() => _WebEditingPageState();
}

class _WebEditingPageState extends State<WebEditingPage> {
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
                "assets/images/img4.png",
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: screenwidth/2.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                            color: Colors.yellow[800],
                                            fontSize: 12),
                                      );
                                    }
                                  })
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.edit_outlined,
                                  color: Colors.blue, size: 35),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AgendaEditing(index: index);
                                }));
                              },
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
          ),
        ],
      ),
    );
    ;
  }
}

class MobileEdittingPage extends StatefulWidget {
  @override
  _MobileEdittingPageState createState() => _MobileEdittingPageState();
}

class _MobileEdittingPageState extends State<MobileEdittingPage> {
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView.builder(
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
                          width: screenwidth / 1.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                        color: Colors.yellow[800],
                                        fontSize: 12),
                                  );
                                }
                              })
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit_outlined,
                              color: Colors.blue, size: 35),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AgendaEditing(index: index);
                            }));
                          },
                        )
                      ],
                    ),
                  )),
                );
              },
              itemCount: agendaList.length,
            ),
            Align(
              alignment: Alignment(0, 0.8),
              child: ElevatedButton(
                  child: Container(
                      padding: EdgeInsets.all(15),
                      child: Icon(
                        Icons.home_filled,
                        color: Colors.white,
                        size: 35,
                      )),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
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
    );
  }
}
