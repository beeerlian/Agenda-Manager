import 'package:berlian_app/MainPage.dart';
import 'package:berlian_app/model/agenda.dart';
import 'package:flutter/material.dart';



class AddingPage extends StatefulWidget {
  @override
  _AddingPageState createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    final dateController = TextEditingController();
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          width: screenwidth,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Add",
                style: TextStyle(
                    fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  controller: titleController,
                  maxLength: 50,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Title"),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  controller: descController,
                  maxLength: 600,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: descController.text,
                      border: OutlineInputBorder(),
                      labelText: "Description"),
                ),
              ),
              SizedBox(height: 20),
               Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  controller: dateController,
                  maxLength: 10,
                  decoration: InputDecoration(
                      hintText: "12-12-2020",
                      border: OutlineInputBorder(),
                      labelText: "Date"),
                ),
              ),
              SizedBox(height : screenheight/20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: Container(
                      padding: EdgeInsets.all(25),
                      child: Text(
                        "Back",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow[900],
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return MainPage();
                      }));
                    },
                  ),
                  ElevatedButton(
                      child: Container(
                        padding: EdgeInsets.all(25),
                        child: Text(
                          "SAVE",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                            side: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      onPressed: () {
                        agendaList.add(Agenda(
                            judul: titleController.text.toString(),
                            desc: descController.text.toString(),
                            date: dateController.text.toString(),
                            isDone: false));
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return MainPage();
                        }));
                      }),
                ],
              ),
              
            ],
          ),
        ),
      ),
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
