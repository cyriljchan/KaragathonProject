import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:karagathon_isda/api.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

////////////////////////////////////////////////////////////////////////////////
/////////////                      MENU PAGE                       /////////////
////////////////////////////////////////////////////////////////////////////////
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //This is the Background Image.
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/home_menu.png"),
            fit: BoxFit.cover,
          ),
        ),

        //this widget creates the space containing the column widget.
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              /*left*/ MediaQuery.of(context).size.width * 0.024,
              /*top*/ MediaQuery.of(context).size.height * 0.46,
              /*right*/ MediaQuery.of(context).size.width * 0.024,
              /*bottom*/ MediaQuery.of(context).size.height * 0.170),

          //This child widget is the buttons column.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              //////////////////////////////////////
              //          FISH DATA BUTTON        //
              //////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FishData()),
                        );
                        print('Fish Selection Button Pressed');
                      },
                      height: MediaQuery.of(context).size.height * 0.075,
                      minWidth: MediaQuery.of(context).size.width * 0.7,
                      color: Colors.green,
                      child: Text('Fish Data',
                          style: TextStyle(
                            fontFamily: 'LeagueSpartan',
                            color: Colors.white,
                            fontSize: 15,
                          )),
                    ),
                  )
                ],
              ),

              //////////////////////////////////////
              //           CAMERA BUTTON          //
              //////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CameraPage()),
                      );
                      print('Camera Button Pressed');
                    },
                    height: MediaQuery.of(context).size.height * 0.075,
                    minWidth: MediaQuery.of(context).size.width * 0.7,
                    color: Colors.green,
                    child: Text('Camera and Scanner',
                        style: TextStyle(
                          fontFamily: 'LeagueSpartan',
                          color: Colors.white,
                          fontSize: 15,
                        )),
                  ),
                ],
              ),

              //////////////////////////////////////
              //          ACCOUNT BUTTON          //
              //////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AccountPage()),
                      );
                      print('Account Button Pressed');
                    },
                    height: MediaQuery.of(context).size.height * 0.075,
                    minWidth: MediaQuery.of(context).size.width * 0.7,
                    color: Colors.green,
                    child: Text('Account',
                        style: TextStyle(
                          fontFamily: 'LeagueSpartan',
                          color: Colors.white,
                          fontSize: 15,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // //////////////////////////////////////
      // //     FLOATING BUTTON FOR LULZ     //
      // //////////////////////////////////////
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     print('BU DA');
      //   },
      //   child: Text('不大'),
      //   backgroundColor: Colors.green[20],
      // ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
/////////////                       SUBPAGES                       /////////////
////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////
//           FISH DATA PAGE         //
//////////////////////////////////////
class FishData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fish Data"),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: <Widget>[
          //This is the Background Image.
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //This is the space around the scrolling column.
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
              horizontal: MediaQuery.of(context).size.width * 0.08,
            ),

            //Scrolling
            child: SingleChildScrollView(
                child: Container(
                    color: Colors.transparent,
                    child: Column(children: <Widget>[
                      //////////////////////////////////////
                      //         FISH DATA BUTTON         //
                      //////////////////////////////////////
                      Card(
                        color: Colors.transparent,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SampleFish()),
                            );
                            print('Fish Button Pressed');
                          },
                          color: Colors.green.shade800,
                          child: Column(children: <Widget>[
                            //top text
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      child: Text(
                                        'Napoleon Wrasse',
                                        style: TextStyle(
                                          fontFamily: 'LeagueSpartan',
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      child: Text('Caught Wild',
                                          style: TextStyle(
                                            fontFamily: 'LeagueSpartan',
                                            fontSize: 10,
                                            color: Colors.white,
                                          )),
                                    )
                                  ]),
                            ),

                            //fish pic
                            Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'images/fishyboi.png',
                                      height: 150,
                                      width: 220,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            //fish status
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.005,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'ENDANGERED',
                                    style: TextStyle(
                                      fontFamily: 'LeagueSpartan',
                                      fontSize: 10,
                                      color: Colors.lime,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ]))),
          )
        ],
      ),
    );
  }
}

//////////////////////////////////////
//    CAMERA PAGE W/FUNCTIONALITY   //
//////////////////////////////////////
class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  //API
  String url = 'http://10.0.2.2:5000/';
  var Data;
  String status = 'status';
//////////////////////////////////////
//  ACCESS CAMERA/GALLERY FUNCTIONS //
//////////////////////////////////////
  File _image;
  final picker = ImagePicker();

  Future getImageCam() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

//////////////////////////////////////
//      IMAGE VIEW != NULL THING    //
//////////////////////////////////////
  Widget _decideImageView() {
    if (_image == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 165,
        ),
        child: Text(
          'Please take a photo.',
          style: TextStyle(
            fontFamily: 'JPCS_EngFont',
            fontSize: 18,
          ),
        ),
      );
    } else {
      return Image.file(
        _image,
        width: 300,
        height: 350,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Camera and Scanner"),
          backgroundColor: Colors.green,
        ),
        body: Stack(
          children: <Widget>[
            //This is the Background Image.
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //This is the space around the column.
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.03,
                horizontal: MediaQuery.of(context).size.width * 0.024,
              ),

              //This is the column.
              child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                    //////////////////////////////////////
                    //             IMAGE BOX            //
                    //////////////////////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _decideImageView(),
                      ],
                    ),
                    //Camera/Gallery
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //////////////////////////////////////
                        //           SCANNER BUTTON         //
                        //////////////////////////////////////
                        MaterialButton(
                          onPressed: () async {
                            Data = await Getdata(url);
                            setState(() {
                              status = Data;
                            });
                            print('Image Scanned');
                            if (status == 'Illegal') {
                              illegalAlert(context);
                            } else {
                              legalAlert(context);
                            }
                          },
                          height: MediaQuery.of(context).size.height * 0.075,
                          minWidth: MediaQuery.of(context).size.width * 0.12,
                          color: Colors.green,
                          child: Text('Scan Photo',
                              style: TextStyle(
                                fontFamily: 'LeagueSpartan',
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ),

                        //////////////////////////////////////
                        //             TAKE SHOT            //
                        //////////////////////////////////////
                        MaterialButton(
                          onPressed: () {
                            getImageCam();
                            print('Camera Accessed');
                          },
                          height: MediaQuery.of(context).size.height * 0.075,
                          minWidth: MediaQuery.of(context).size.width * 0.12,
                          color: Colors.green,
                          child: Text('Take Photo',
                              style: TextStyle(
                                fontFamily: 'LeagueSpartan',
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ),
                      ],
                    ),
                  ])),
            )
          ],
        ));
  }
}

//////////////////////////////////////
//          ACCOUNT PAGE            //
//////////////////////////////////////
//This is the Account Page
class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: 500,
        height: 1000,
        //This is the Background Image.
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/account.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////
//            FISH DATA             //
//////////////////////////////////////
class SampleFish extends StatefulWidget {
  @override
  _SampleFishState createState() => _SampleFishState();
}

class _SampleFishState extends State<SampleFish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Napoleon Wrasse"),
          backgroundColor: Colors.green,
        ),
        body: Stack(
          children: <Widget>[
            //This is the Background Image.
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //This is the space around the column.
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.07,
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),

              //This is the column.
              child: Card(
                  color: Colors.green.shade700,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //top text
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.015,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                  ),
                                  child: Text(
                                    'Napoleon Wrasse',
                                    style: TextStyle(
                                      fontFamily: 'LeagueSpartan',
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                  ),
                                  child: Text('Caught Wild',
                                      style: TextStyle(
                                        fontFamily: 'LeagueSpartan',
                                        fontSize: 10,
                                        color: Colors.white,
                                      )),
                                )
                              ]),
                        ),

                        //fish pic
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/fishyboi.png',
                                  width: 230,
                                  height: 140,
                                )
                              ],
                            ),
                          ),
                        ),

                        //fish status
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.005,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'ENDANGERED',
                                style: TextStyle(
                                  fontFamily: 'LeagueSpartan',
                                  fontSize: 10,
                                  color: Colors.lime,
                                ),
                              ),
                            ],
                          ),
                        ),

                        //fish details
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.03,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Because of the overexploitation of this reef fish, \nthe Napoleon Wrasse was listed on \nthe International Union for the \nConservation (IUCN) Red List of Threatened \nSpecies; listed as 'Vulnerable' in 1996 \nand then 'Endangered' in 2004",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'LeagueSpartan',
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.03,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "This fish is among the highest-valued reef fieshes \nand is being traded internationally. Countries that \nprimarily export this fish in Southeast Asian \ncountries include Indonesia, Malaysia, and the \nPhilipines. There have been cases of illegal exports \nsuspected from countries Indonesia, Malaysia, \nand the Philippines.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'LeagueSpartan',
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )
                      ])),
            )
          ],
        ));
  }
}

//////////////////////////////////////
//          Scan Result            //
//////////////////////////////////////
//This is the Scan Result page

class Illegal extends StatefulWidget {
  @override
  _IllegalState createState() => _IllegalState();
}

class _IllegalState extends State<Illegal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scan Result"),
          backgroundColor: Colors.green,
        ),
        body: Stack(
          children: <Widget>[
            //This is the Background Image.
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 130,
                ),
                Center(
                    child: new Image.network(
                        'http://10.0.2.2:5000/static/detect_result.jpg',
                        scale: 1.5)),
              ],
            ),
            Container(
              child: new Text(
                "Illegal Fish Detected",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'LeagueSpartan_Bold',
                ),
              ),
              alignment: Alignment(0, -0.9),
            ),
            Container(
              child: new Text(
                "Napoleon Wrasse",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'LeagueSpartan_Bold',
                ),
              ),
              alignment: Alignment(0, 0.7),
            )
          ],
        ));
  }
}

illegalAlert(BuildContext context) {
  Widget okButton = FlatButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Illegal()));
      },
      child: Text('OK'));
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Illegal Fish Detected"),
      content: Text("A report has been sent for evaluation"),
      actions: [okButton],
    ),
  );
}

legalAlert(BuildContext context) {
  Widget okButton = FlatButton(
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
      child: Text('OK'));
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("All Fishes Are Legal"),
      content: Text(" report has been sent for evaluation"),
      actions: [okButton],
    ),
  );
}
