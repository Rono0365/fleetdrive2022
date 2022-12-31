import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'dart:convert';
import 'slashscreen.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'logincred.dart';
import 'dart:core';
import 'stuchat.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

/// main application widget
class MyApp extends StatefulWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var sky2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Afleetdrive',
      home: screen(),
    );
  }
}

/// stateful widget that the main application instantiates
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget(
      {Key? key,
      required this.tokenx,
      required this.titlex,
      required this.useridx})
      : super(key: key);

  String tokenx;
  String useridx;
  String titlex;
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// private State class that goes with MyStatefulWidget
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool mondaymon = false;
  bool isSwitched = false;
  List chosenusers = [];
  List chosenusers2 = [];

  var mypos1;
  var mypos2;
  var name;
  var myname;
  var sky2;
  var sad;
  var mpos;
  var mposX;
  var sky7;
  var xcx7;
  var leo;
  var now;
  var xcv12;
  var mpos2;
  var mpos2X;
  bool home = true;
  bool school = false;
  var checkin;
  late Position _currentPosition;
  Future getMe() async {
    String token = widget.tokenx.toString();
    String id = widget.useridx.toString();
    //int cv = int.parse(id) - 1;

    print('here' + token);
    print('here' + id);
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    http.Response resp = await http
        .get(Uri.parse('https://afleet.co.ke/Sbuss/'), headers: headers);
    http.Response ares = await http
        .get(Uri.parse('https://afleet.co.ke/tranzoia/'), headers: headers);
    var xcv11 = jsonDecode(resp.body);
    var xcv126 = jsonDecode(ares.body);

    http.Response responsev = await http
        .get(Uri.parse('https://afleet.co.ke/me/$id'), headers: headers);
    var xcv = jsonDecode(responsev.body);
    setState(() {
      this.sky2 = xcv;
      this.xcv12 = xcv126;
      //here you'll get the value of the username
      //the usernbame is unique thus you can use it as nany user driver// teacher // student
      // value = sky2;
    });
    print('froma logical point of view' + xcv12.toString());
    xcv11.map((f) {
      print('this is F' + f.toString());
    });
  }
//post here

  Future getnumbx2(String Username, String time, String checkinn) async {
    String token = widget.tokenx.toString();

    print('here' + token);
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };

    http.Response responsex1 = await http.post(
      Uri.parse('https://afleet.co.ke/rollcall/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //"id":1,"checkIn":"notyet","checkout":"notyet","useryou":"child","datetime":"time"
        //'id': titleController.text,this is an autofield
        'checkIn': home ? 'done' : "notyet",
        'checkout': school ? 'done' : "notyet",
        'useryou': Username,
        'datetime': time,
        'driver': myname.toString()
      }),
    );
    print(responsex1);
  }

  myp() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    mypos1 =
        position.latitude; //double.parse(stageloc.toString().split(',')[0]);
    mypos2 =
        position.longitude; //double.parse(stageloc.toString().split(',')[1]);
  }

  orderzangu(String hrhr) {
    var counter = 30;

    Timer.periodic(const Duration(seconds: 2), (timer) {
      //http req to  and from server
      counter++;
      /*xls(String order) {
        ex++;
        return ex < 3
            ? Ninotify.showNotification(
                id: 2,
                title: order,
                body: 'Your School Bus is almost at the stage',
                payload: 'r',
              )
            : "";
      }*/

      Future getWeatherxc() async {
        var cvcv;
        var story;

        Future createAlbum() async {
          http.Response response1 = await http.put(
            Uri.parse('https://afleet.co.ke/busloc/${hrhr}/'),
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'cordinates': mpos.toString() + ',' + mpos2.toString(),
              'schoo': 'RetInstituteofTech', //change test
              'owner': sky2.toString(),
              'commute': 'on',
              'plac': 'Madaraka', //change test
              'nameq': myname.toString()
            }),
          );

          var token = jsonDecode(response1.body);
          print(token);
        }

        Future createAlbumd() async {
          //sky2.toString()
          http.Response response1 = await http.put(
            Uri.parse('https://afleet.co.ke/busloc/${hrhr}/'),
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'cordinates': mpos.toString() + ',' + mpos2.toString(),
              'schoo': 'RetInstituteofTech', //change test
              'commute': !mondaymon ? 'off' : 'arrived',
              'plac': 'Madaraka', //change test
              'nameq': myname.toString()
            }),
          );

          var token = jsonDecode(response1.body);
          print(token);
        }
        //String token = widget.token.toString();

        // var headers = {
        //   'Authorization': 'Token $token',
        // };

        if (counter == 0) {
          counter = 15;
          print('Cancel timer');
          timer.cancel();
        } else {
          //https://afleet.co.ke/Sbuss/
          setState(() {
            isSwitched ? mpos != mposX && mpos2 != mpos2X?createAlbumd():createAlbum() : createAlbumd();
          });

          vc() async {
            //this use it on the bus area
            Position position = await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high);
            setState(() {
              mpos = isSwitched ? position.latitude : 0.0;
              mpos2 = isSwitched ? position.longitude : 0.0;
              mposX = isSwitched ? position.latitude : 0.0;
              mpos2X = isSwitched ? position.longitude : 0.0;
            });
            //mypos1 = double.parse(stageloc.toString().split(',')[0]);
            //mypos2 = double.parse(stageloc.toString().split(',')[1]);
            mypos1 = position.latitude; //var rcdf = mt2.last;
            mypos2 = position.longitude;
          }

          ;

          isSwitched ? vc() : '';
        }
      }

      getWeatherxc();
    });
  }

  x() async {
    var headers = {
      'Authorization': 'Token ${widget.tokenx}',
    }; //'https://afleet.co.ke/busloc/${sad.toString()}/'
    http.Response resp = await http
        .get(Uri.parse('https://afleet.co.ke/Sbuss/'), headers: headers);
    http.Response responsev = await http.get(
        Uri.parse('https://afleet.co.ke/me/${widget.useridx}'),
        headers: headers);
    var xcv = jsonDecode(responsev.body);
    var xcv11 = jsonDecode(resp.body);
    print(">>>>>>>>>><<<<<<<<<<<<" + xcv.toString());
    print("GOTCHA>>>>>>>>>>>>>>>>" + xcv11.toString());
    var newd;
    print(xcv['username'].toString());
    print(xcv11);
    setState(() {
      this.myname = xcv['username'].toString();
      this.name = xcv11;
    });
    print(name); // gfgc  gyguvv  gvyu  fvuv  h
    //jay();

    // this.sky2 != null ? print("yesssss") : print('hapana>>>>>>>>>>');
  }

/*Future getWeather() async {
    String token = widget.token.toString();
    print(token);
    print(widget.token); // wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
//https://afleet.co.ke/HW/
    final tranzo = await http.get(Uri.parse('https://afleet.co.ke/stages/'),
        headers: headers);
    //https://afleet.co.ke/information/
    final info2 = await http.get(Uri.parse('https://afleet.co.ke/information/'),
        headers: headers);

    final responsex = await http.get(Uri.parse('https://afleet.co.ke/HW/'),
        headers: headers); //headers: headers
    //nofmsg
    final nfmsg = await http.get(Uri.parse('https://afleet.co.ke/notef/'),
        headers: headers
        // Send authorization headers to the backend.
        );
    final responsev = await http
        .get(Uri.parse('https://afleet.co.ke/students/'), headers: headers
            // Send authorization headers to the backend.
            ); //headers: headers
    //http.Response responsex = await http
    //  .get(Uri.parse('https://afleet.co.ke/id/1/')); //get via token
    http.Response response1 = await http.get(
        Uri.parse('https://afleet.co.ke/Sbuss/'),
        headers: headers); //get via token headers: headers
    http.Response response77 = await http
        .get(Uri.parse('https://afleet.co.ke/transolution/'), headers: headers);
    var result5 = jsonDecode(tranzo.body);
    var notmsg = jsonDecode(nfmsg.body);
    var result77 = jsonDecode(response77.body);
    var info = jsonDecode(info2.body); //returns info
    var result1 = jsonDecode(response1.body); //returns json body from api
    var results = jsonDecode(responsev.body); //returns json body from api
    var resultx = jsonDecode(responsex.body);
    setState(() {
      //DateFormat('EEEE').format(date);
      this.week_area = DateFormat(' d MMM').format(DateTime.now());
      this.leo = DateFormat('EEEE').format(DateTime.now());
      this.now = DateFormat('EEEE d MMM')
          .format(DateTime.now()); //returns json body from api
    }); //subjects
    setState(() {
      this.value = results;
      //this.value3 = info;
      this.yoi = result77;
      this.value2 = resultx;
      this.this2 = notmsg;
      this.info3 = info;
      this.value3 = result1;
      this.alone = result5;
    });
    xnote(String order) {
      //
      exx++;
      return exx < 2
          ? Ninotify.showNotification(
              id: 2,
              title: order,
              body: "You have new messages",
              payload: 'r',
            )
          : '';
    }

    xls(String order) {
      //ex = 0;
      ex++;
      return ex < 2
          ? Ninotify.showNotification(
              id: 2,
              title: order,
              body: "Your SchoolBus has started it's transit",
              payload: 'r',
            )
          : '';
    }

    beam(String order) {
      //ex = 0;
      ex5++;
      return ex5 < 2
          ? Ninotify.showNotification(
              id: 2,
              title: order,
              body: "Your SchoolBus has arrived in school",
              payload: 'r',
            )
          : '';
    }

    var resch =
        yoi.map((i) => i['userN'] == sky2['username'] ? vb.add(i['bi']) : null);
    //var milast = vb.last;
    print(resch);

    var xon =
        info3.map((th) => th['to'] == sky2['username'] ? la.add(th) : null);

    print(xon);
    var gghvbh = info3.where((u) => u['whoiswho'] == sky2['username']).length;
    print(gghvbh);
    xrx = gghvbh.toString(); //already done 42
    var x = notmsg
        .map((ex) => ex['useryou'].toString().contains(sky2['username'])
            ? cx99 = ex['numbx'].toString()
            : 'null')
        .toString(); //
    var kilosh = notmsg
        .map((ex) => ex['useryou'].toString().contains(sky2['username'])
            ? cx199 = ex['state'].toString()
            : 'null')
        .toString(); //
    print(x);
    print(kilosh);

    this.crpt = la.length.toString();
    print(crpt);
    print(la.length.toString());

    String xb = la.length.toString();
    print(xb);
    final la2 = la;
    print(la2);
    //mtv = xb; //get the info value

    var cvdf = value3.map((x) => vb.last.toString() == x['id'].toString()
        ? haro.add(value3.indexOf(x))
        : '');
    print(cvdf);
    print(this.haro);
    print("<<<<<<<<<<>>>>>>>>>" + cvdf.toList().toString());
    //setsategoes here
    this.gechyu = value3[haro.last]['commute'];
    print(gechyu);
    print(kilosh + cx99);
    print(cx199);
    if (cx99 == xrx) {
      nm = false;
      print("-----------------------------------------------");
      print("________________DONE__________________________");
    } else {
      print(cx199);
      if (cx199 == 'offline' && int.parse(xrx) > int.parse(cx99)) {
        xnote("message");
        //print("Should call note");
        nm = true;
      } // 23 26
      print(cx99.toString() + "    " + xrx.toString());
      print('++++++++++++++not done++++++++++++++++++++++++++++++');
    }
    /*cx199 == 'offline' && int.parse(xrx) > int.parse(cx99)
        ? xnote("message")
        : '';*/
    gechyu == 'on' ? xls("SchoolBus has started it's transit") : '';
    gechyu == 'arrived' ? beam("School bus") : '';
    this.haro.clear();
    this.la.clear();
    var crpt2 = crpt;
    print(crpt2);
  } */
  Future getMes() async {
    //int cv = int.parse(id) - 1;
    var token = widget.tokenx.toString();
    var id = widget.useridx.toString();
    print('here' + token);
    print('here' + id);
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    http.Response responsev = await http
        .get(Uri.parse('https://afleet.co.ke/transolution/'), headers: headers);
    var xcv = jsonDecode(responsev.body);
    setState(() {
      this.sky7 = xcv;
      //here you'll get the value of the username
      //the usernbame is unique thus you can use it as nany user driver// teacher // student
      // value = sky2;
      print(sky7.toString());
    });
    //print(sky2);
  }

  @override
  void initState() {
    super.initState();
    getMe();
    getMes();

    x();
    isSwitched = false;
    isSwitched ? myp() : '';

    isSwitched ? orderzangu('1') : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Afleetdrive"),
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
      ),
      body: name == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(children: [
                // Text(myname.toString()),
                ...name.map((kl) => kl['owner'].toString() == myname.toString()
                    ? Center(
                        child: Column(
                          //mainAxisAlignment:MainAxisAlignment.center,
                          children: <Widget>[
                            isSwitched
                                ? Container(
                                    height: 25,
                                    color: Colors.red,
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                        child: Text("Tracking...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold))),
                                  )
                                : Container(),
                            ListTile(
                              title: Text('Start Trip'),
                              subtitle: Text('${kl['commute']}'),
                              trailing: Switch(
                                activeColor: Colors.green,
                                inactiveThumbColor: kl['commute'] == 'on'
                                    ? Colors.green
                                    : Colors.red,
                                value: isSwitched,
                                onChanged: (value) {
                                  isSwitched = value;
                                  isSwitched
                                      ? orderzangu(kl['id'].toString())
                                      : '';
                                },
                              ),
                            ),
                            Container(height: 10),
                            !isSwitched
                                ? Container(
                                    height:
                                        MediaQuery.of(context).size.height * .7)
                                : Container(
                                    height:
                                        MediaQuery.of(context).size.height * .7,
                                    child: Card(
                                        elevation: 0,
                                        child: SingleChildScrollView(
                                          child: Column(children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(""),

                                            SizedBox(
                                              height: 5,
                                            ),
                                            ListTile(
                                                title: Center(
                                              child: Container(
                                                height: 50,
                                                width: 250,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: FlatButton(
                                                  child: Text(
                                                    'end',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      isSwitched = false;
                                                      chosenusers.clear();
                                                      // mondaymon = true;
                                                    });
                                                    setState(() {
                                                      // isSwitched = false;
                                                      mondaymon = true;
                                                    });

                                                    Future
                                                        createAlbumd() async {
                                                      print("PASSED THAT>>");
                                                      http.Response response1 =
                                                          await http.put(
                                                        Uri.parse(
                                                            'https://afleet.co.ke/busloc/${kl['id']}/'),
                                                        headers: {
                                                          'Content-Type':
                                                              'application/json; charset=UTF-8',
                                                        },
                                                        body: jsonEncode(<
                                                            String, String>{
                                                          'cordinates':
                                                              "${mpos}" +
                                                                  ',' +
                                                                  "${mpos2}",
                                                          'schol': //change test
                                                              'RetInstituteofTech',
                                                          'commute': 'arrived',
                                                          'plce':
                                                              'Madaraka', //change test
                                                          'nameq': '${myname}'
                                                        }),
                                                      );

                                                      var token = jsonDecode(
                                                          response1.body);
                                                      print(token);
                                                    }

                                                    createAlbumd();

                                                    /*createAlbum().whenComplete(() async {
                                                                        final SharedPreferences sharedPreferences =
                                                                            await SharedPreferences.getInstance();
                                                                        sharedPreferences.setString('token', passtok);
                                                                        sharedPreferences.setString('key', userid);
                                                                        setState(() {
                                                                          PassToken = passtok;
                                                                        });
                                                                        if (State == 200) {
                                                                          Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                          builder: (context) => MyHomePage(
                                            title: titleController.text,
                                            token: passtok,
                                            userid: userid,
                                          ),
                                                                              ));
                                                                          print('exis' + passtok);
                                                                        } else {
                                                                          print('haiwork');
                                                                          const snackBar = SnackBar(
                                                                            content: Text(
                                          "Please Try Again! There's an error with your credentials"),
                                                                          );
                                                    
                                                    // Find the ScaffoldMessenger in the widget tree
                                                    // and use it to show a SnackBar.
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(snackBar);
                                                                        }
                                                                        ;
                                                                      });
                                                    
                                                                      //print(State);
                                                                    */
                                                  },
                                                ),
                                              ),
                                            )),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      color: home
                                                          ? Colors.green
                                                          : Colors
                                                              .red, //green or red
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: FlatButton(
                                                    child: Text(
                                                      'Home',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        //fontSize: 25
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      //setState(() {
                                                      home = !school
                                                          ? home
                                                              ? false
                                                              : true
                                                          : !home
                                                              ? false
                                                              : true;

                                                      //});
                                                      /* setState(() {
                                                      isSwitched = false;
                                                      // mondaymon = true;
                                                    });
                                                    setState(() {
                                                      // isSwitched = false;
                                                      mondaymon = true;
                                                    });

                                                    Future
                                                        createAlbumd() async {
                                                      print("PASSED THAT>>");
                                                      http.Response response1 =
                                                          await http.put(
                                                        Uri.parse(
                                                            'https://afleet.co.ke/busloc/${kl['id']}/'),
                                                        headers: {
                                                          'Content-Type':
                                                              'application/json; charset=UTF-8',
                                                        },
                                                        body: jsonEncode(<
                                                            String, String>{
                                                          'cordinates':
                                                              "${mpos}" +
                                                                  ',' +
                                                                  "${mpos2}",
                                                          'schol': //change test
                                                              'RetInstituteofTech',
                                                          'commute': 'arrived',
                                                          'plce':
                                                              'Madaraka', //change test
                                                          'nameq': '${myname}'
                                                        }),
                                                      );

                                                      var token = jsonDecode(
                                                          response1.body);
                                                      print(token);
                                                    }

                                                    createAlbumd();

                                                    /*createAlbum().whenComplete(() async {
                                                                        final SharedPreferences sharedPreferences =
                                                                            await SharedPreferences.getInstance();
                                                                        sharedPreferences.setString('token', passtok);
                                                                        sharedPreferences.setString('key', userid);
                                                                        setState(() {
                                                                          PassToken = passtok;
                                                                        });
                                                                        if (State == 200) {
                                                                          Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                          builder: (context) => MyHomePage(
                                            title: titleController.text,
                                            token: passtok,
                                            userid: userid,
                                          ),
                                                                              ));
                                                                          print('exis' + passtok);
                                                                        } else {
                                                                          print('haiwork');
                                                                          const snackBar = SnackBar(
                                                                            content: Text(
                                          "Please Try Again! There's an error with your credentials"),
                                                                          );
                                                    
                                                    // Find the ScaffoldMessenger in the widget tree
                                                    // and use it to show a SnackBar.
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(snackBar);
                                                                        }
                                                                        ;
                                                                      });
                                                    
                                                                      //print(State);
                                                                    */
                                                  */
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      color: school
                                                          ? Colors.green
                                                          : Colors
                                                              .red, //green or red
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: FlatButton(
                                                    child: Text(
                                                      'School',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        //fontSize: 25
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        school = !home
                                                            ? school
                                                                ? false
                                                                : true
                                                            : !school
                                                                ? false
                                                                : true;
                                                      });
                                                      /* setState(() {
                                                      isSwitched = false;
                                                      // mondaymon = true;
                                                    });
                                                    setState(() {
                                                      // isSwitched = false;
                                                      mondaymon = true;
                                                    });

                                                    Future
                                                        createAlbumd() async {
                                                      print("PASSED THAT>>");
                                                      http.Response response1 =
                                                          await http.put(
                                                        Uri.parse(
                                                            'https://afleet.co.ke/busloc/${kl['id']}/'),
                                                        headers: {
                                                          'Content-Type':
                                                              'application/json; charset=UTF-8',
                                                        },
                                                        body: jsonEncode(<
                                                            String, String>{
                                                          'cordinates':
                                                              "${mpos}" +
                                                                  ',' +
                                                                  "${mpos2}",
                                                          'schol': //change test
                                                              'RetInstituteofTech',
                                                          'commute': 'arrived',
                                                          'plce':
                                                              'Madaraka', //change test
                                                          'nameq': '${myname}'
                                                        }),
                                                      );

                                                      var token = jsonDecode(
                                                          response1.body);
                                                      print(token);
                                                    }

                                                    createAlbumd();

                                                    /*createAlbum().whenComplete(() async {
                                                                        final SharedPreferences sharedPreferences =
                                                                            await SharedPreferences.getInstance();
                                                                        sharedPreferences.setString('token', passtok);
                                                                        sharedPreferences.setString('key', userid);
                                                                        setState(() {
                                                                          PassToken = passtok;
                                                                        });
                                                                        if (State == 200) {
                                                                          Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                          builder: (context) => MyHomePage(
                                            title: titleController.text,
                                            token: passtok,
                                            userid: userid,
                                          ),
                                                                              ));
                                                                          print('exis' + passtok);
                                                                        } else {
                                                                          print('haiwork');
                                                                          const snackBar = SnackBar(
                                                                            content: Text(
                                          "Please Try Again! There's an error with your credentials"),
                                                                          );
                                                    
                                                    // Find the ScaffoldMessenger in the widget tree
                                                    // and use it to show a SnackBar.
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(snackBar);
                                                                        }
                                                                        ;
                                                                      });
                                                    
                                                                      //print(State);
                                                                    */
                                                  */
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 15),
                                            Row(children: [
                                              Text(" Students",
                                                  style:
                                                      TextStyle(fontSize: 20))
                                            ]),
                                            SizedBox(height: 15),

                                            ...sky7
                                                .map((ret) =>
                                                    ret['userN'].toString())
                                                .toSet()
                                                .toList()
                                                .map(
                                                  (ro) => !chosenusers2
                                                          .contains(ro)
                                                      ? ListTile(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft:
                                                                      Radius.circular(
                                                                          10),
                                                                  topRight:
                                                                      Radius.circular(
                                                                          10),
                                                                  bottomLeft:
                                                                      Radius.circular(10),
                                                                  bottomRight: Radius.circular(10))),
                                                          tileColor: Colors.grey.shade100,
                                                          onTap: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        FriendMess(
                                                                  title: myname
                                                                      .toString(),
                                                                  token: widget
                                                                      .tokenx,
                                                                  myname: '',
                                                                  user: ro
                                                                      .toString(),
                                                                ),
                                                              ), //MaterialPageRoute
                                                            );
                                                          },
                                                          leading: Container(
                                                            height: 50,
                                                            width: 50,
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .deepPurple
                                                                        .withOpacity(
                                                                            0.1),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10.0) //                 <--- border radius here
                                                                            )),
                                                            child: Icon(Icons
                                                                .person_outline),
                                                          ),
                                                          title: Text(
                                                            ro.toString(),
                                                            style: TextStyle(
                                                              color: Colors.grey
                                                                  .shade900,
                                                            ),
                                                          ),
                                                          subtitle: Text('Message'.toString()),
                                                          trailing: chosenusers.contains(ro.toString())
                                                              ? Text("Dropped Off")
                                                              : InkWell(
                                                                  onTap: () {
                                                                    this.now = DateFormat(
                                                                            'EEEE d MMM')
                                                                        .format(
                                                                            DateTime.now());
                                                                    //returns json body from api
                                                                    //this.courseblock = result1;
                                                                    this.leo = DateFormat
                                                                            .jm()
                                                                        .format(
                                                                            DateTime.now());

                                                                    /*getnumbx2(
                                                                ro.toString(),
                                                                now + '|' + leo,
                                                                home
                                                                    ? "Home"
                                                                    : "School");*/
                                                                    chosenusers
                                                                        .add([
                                                                      ro.toString(),
                                                                      leo
                                                                    ]);
                                                                    chosenusers2
                                                                        .add(ro
                                                                            .toString());

                                                                    sky7.remove(
                                                                        ro.toString());
                                                                    //getnumbx2(String Username,String time,String checkinn)
                                                                    setState(
                                                                        () {
                                                                      //DateFormat('EEEE').format(date);
                                                                    });
                                                                    getnumbx2(
                                                                        ro
                                                                            .toString(),
                                                                        now +
                                                                            '|' +
                                                                            leo,
                                                                        home
                                                                            ? "Home"
                                                                            : "School");
                                                                  },
                                                                  child: Chip(backgroundColor: !chosenusers.contains(ro.toString()) ? Colors.green : Colors.grey.shade100, label: Text(!chosenusers.contains(ro.toString()) ? 'Check' : 'Dropped off'))))
                                                      : SizedBox(),
                                                ),
                                            ListTile(
                                              title: Text(
                                                "Dropped Off",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            ...chosenusers.map((e) => ListTile(
                                                  leading: Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                        color: Colors.deepPurple
                                                            .withOpacity(0.1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0) //                 <--- border radius here
                                                                )),
                                                    child: Icon(
                                                        Icons.person_outline),
                                                  ),
                                                  title: Text(e
                                                      .toString()
                                                      .split(',')
                                                      .first
                                                      .toString()
                                                      .replaceAll('[', '')),
                                                  subtitle: Text(e
                                                      .toString()
                                                      .split(',')
                                                      .last
                                                      .toString()
                                                      .replaceAll(']', '')),
                                                ))

                                            //,
                                          ]),
                                        ))),
                            Container(height: 10),
                          ],
                        ),
                      )
                    : Container()),
              ]),
            ),
    );
  }
}
