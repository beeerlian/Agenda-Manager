import 'package:berlian_app/EdittingPage.dart';
import 'package:berlian_app/model/agenda.dart';
import 'package:flutter/material.dart';

class AgendaEditing extends StatelessWidget {
  final int index;
  AgendaEditing({required this.index});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    final dateController = TextEditingController();
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Center(
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
                    "Edit",
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
                          border: OutlineInputBorder(),
                          labelText: "Title",
                          hintText: agendaList[index].judul),
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
                          hintText: agendaList[index].desc,
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
                          hintText: agendaList[index].date,
                          helperText: "dd-MM-yyy",
                          border: OutlineInputBorder(),
                          labelText: "Date"),
                    ),
                  ),
                  SizedBox(height : screenheight/20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        child: Container(
                          padding: EdgeInsets.all(25),
                          child: Text(
                            "Back",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        color: Colors.yellow.shade900,
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                            return EdittingPage();
                          }));
                        },
                      ),
                      ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.all(25),
                            child: Text(
                              "Save",
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
                            agendaList[index].judul = titleController.text.toString();
                            agendaList[index].desc = descController.text.toString();
                            agendaList[index].date = dateController.text.toString();

                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return EdittingPage();
                            }));
                          }),
                    ],
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
