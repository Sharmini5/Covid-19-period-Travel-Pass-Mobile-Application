

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<UploadPage> {
  String Name, NIC,Reason, PCR_report,Status;
DateTime _dateTime;
 final databaseReference = Firestore.instance;
static const List<String> division  = const  ['0', '1', '2', '3'];
 String GS_division = division[0];

static const List<String> district_from  = const  ['Ampara', 'Negombo', 'Colombo', 'Jaffna'];
 String Travelling_from = district_from[0];

static const List<String> district_to  = const  ['Ampara', 'Negombo', 'Colombo', 'Jaffna'];
 String Travelling_to = district_to[0];
 
  getName(name) {
    this.Name = name;
  }

  getNIC(nic) {
    this.NIC = nic;
  }

  getGSdivision(gsdivision) {
    this.GS_division = gsdivision;
  }

  getTraveldate(date) {
    this._dateTime = date;
  }

  getTravelfrom(from) {
    this.Travelling_from = from;
  }

 getTravelto(to) {
    this.Travelling_to = to;
  }
  getReason(reason) {
    this.Reason = reason;
  }

  getPCR(pcr) {
    this.PCR_report = pcr;
  }

   getStatus(status) {
    this.Status = status;
  }
  createData() {
    //print("created");
    DocumentReference documentReference =
        Firestore.instance.collection("Travel_permission").document(NIC);
    Map<String, dynamic> students = {
      "Name": Name,
      "NIC":NIC,
      "GS_division": GS_division,
      "Travel_date":_dateTime,
      "Travelling_from":Travelling_from,
      "Travelling_to": Travelling_to,
      "Reason":Reason,
      "PCR_report": PCR_report,
      "Status": Status
     
    };
    documentReference.setData(students).whenComplete(() {
      print("$NIC permission created");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Request fro travelling permission"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Name",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0))),
                    onChanged: (String name) {
                      getName(name);
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "NIC",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0))),
                    onChanged: (String nic) {
                      getNIC(nic);
                    }),
              ),
              // Padding(
              //   padding: EdgeInsets.only(bottom: 8.0),
              //   child: TextFormField(
              //       decoration: InputDecoration(
              //           labelText: "Travelling date",
              //           fillColor: Colors.white,
              //           focusedBorder: OutlineInputBorder(
              //               borderSide:
              //                   BorderSide(color: Colors.blue, width: 2.0))),
              //       onChanged: (String date) {
              //         getTraveldate(date);
              //       }),
              // ),
            RaisedButton(
              child: Text('Pick date'),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                  firstDate: DateTime(2001),
                  lastDate: DateTime(2021)
                ).then((date) {
                  setState(() {
                    _dateTime = date;
                  });
                });
              },
            ),
           
             // Padding(
              //   padding: EdgeInsets.only(bottom: 8.0),
              //   child:  DropdownButtonFormField(
              //         value: _division ?? division,
              //         items: division.map((division) {
              //           return DropdownMenuItem(
              //             value: division,
              //             child: Text('$division GS'),
              //           );
              //         }).toList(),
              //         onChanged: (val) => setState(() =>  _division= val)),
              // ),
              new DropdownButton(
          value: GS_division,
          onChanged: (string) => setState(() => GS_division = string),
          items: division.map((string) {
            return new DropdownMenuItem(
              child: new Text(string),
              value: string,
            );
          }).toList(),
        ),

              // Padding(
              //   padding: EdgeInsets.only(bottom: 8.0),
              //   child: TextFormField(
              //       decoration: InputDecoration(
              //           labelText: "Travelling from",
              //           fillColor: Colors.white,
              //           focusedBorder: OutlineInputBorder(
              //               borderSide:
              //                   BorderSide(color: Colors.blue, width: 2.0))),
              //       onChanged: (String from) {
              //         getTravelfrom(from);
              //       }),
              // ),
              new DropdownButton(
          value: Travelling_from,
          onChanged: (string) => setState(() => Travelling_from = string),
          items: district_from.map((string) {
            return new DropdownMenuItem(
              child: new Text(string),
              value: string,
            );
          }).toList(),
        ),
              
               new DropdownButton(
          value: Travelling_to,
          onChanged: (string) => setState(() => Travelling_to = string),
          items: district_from.map((string) {
            return new DropdownMenuItem(
              child: new Text(string),
              value: string,
            );
          }).toList(),
        ),
              
              // Padding(
              //   padding: EdgeInsets.only(bottom: 8.0),
              //   child: TextFormField(
              //       decoration: InputDecoration(
              //           labelText: "Travelling to",
              //           fillColor: Colors.white,
              //           focusedBorder: OutlineInputBorder(
              //               borderSide:
              //                   BorderSide(color: Colors.blue, width: 2.0))),
              //       onChanged: (String to) {
              //         getTravelto(to);
              //       }),
              // ),

              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextField(
                   maxLines: null,
             keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        labelText: "Reason",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0))),
                    onChanged: (String reason) {
                      getReason(reason);
                    }),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "PCR report",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0))),
                    onChanged: (String pcr) {
                      getPCR(pcr);
                    }),
              ),

                Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Status",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0))),
                    onChanged: (String status) {
                      getStatus(status);
                    }),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      createData();
                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Text("Create"),
                    textColor: Colors.white,
                  ),
                  // RaisedButton(
                  //   onPressed: () {
                  //     // readData();
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => ReadPage()),
                  //     );
                  //   },
                  //   color: Colors.blue,
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(16)),
                  //   child: Text("Read"),
                  //   textColor: Colors.white,
                  // ),
                ],
              ),
            ],
          ),
        ));
  }
}
