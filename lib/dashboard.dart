import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class dashboard extends StatefulWidget {
  // bool isExpanded = true;
  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  bool isExpanded = true;
  bool isOpenDS = true;
  bool isOpenPS =true;
  bool isOpenAI = true;
  bool isOpenTC = true;
  bool isOpenOPS =true;

  Color getProgressColor() {
    if (attendance < 0.55) {
      return Colors.red;
    } else if (attendance < 0.75) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }
   String status(){
    if (attendance >= 0.90){
      return "Excellent";
    }
    else if (attendance < 0.90 && attendance >= 0.75){
      return "Good";
    }
    else if (attendance < 0.75 && attendance >= 0.5){
      return "Average !Improve!";
    }
    else{
      return "Poor!! It's Sucks";
    }

   }
  double attendance = 0.25;

  @override

  Widget build(BuildContext context) {
    // keep percent between 0 and 1
    double percent = attendance.clamp(0.0, 1.0).toDouble();

    // convert to 0–100 for display
    int displayPercent = (percent * 100).round();

    return Scaffold(

      // ------------------ APPBAR ------------------
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            // Icon(Icons.menu, color: Colors.black),
            Expanded(
              child: Center(
                child: Text(
                  "Smart Attendance",
                  style: GoogleFonts.irishGrover(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.deepPurpleAccent,
              child: Text("A", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
      // ---------------Navigation Drawar
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Text("Your Name"),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
          ],
        ),
      ),


      // ------------------ BODY ------------------
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 15),

              // ------------------ MAIN ATTENDANCE CARD ------------------
              Container(
                padding: EdgeInsets.all(20),
                width: 373,
                decoration: BoxDecoration(
                  color: Color(0xFFF5E7C6),
                  borderRadius: BorderRadius.circular(46),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFFF6D1F),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Circle + Title
                    Row(
                      children: [
                        CircularPercentIndicator(
                          radius: 40.0,
                          lineWidth: 10.0,
                          percent: percent,
                          animation: true,
                          center: Text(
                            "${(percent * 100).toStringAsFixed(1)}%"
                            ,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,

                          progressColor: getProgressColor(),
                          backgroundColor: Colors.grey.shade300,
                        ),
                        SizedBox(width: 30),
                        Text(
                          "ATTENDANCE",
                          style: GoogleFonts.irishGrover(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    // -------- PRESENT / ABSENT BUTTONS --------
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                attendance =(attendance + 0.05).clamp(0.0, 1.0).toDouble();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text("Present",
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                attendance =(attendance - 0.02).clamp(0.0, 1.0).toDouble(); // decrease
                              });
                            }
                            ,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: EdgeInsets.symmetric(vertical: 12),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text("Absent",
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    // STATUS SECTION
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Status",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration:TextDecoration.underline,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        status(),
                        style: GoogleFonts.italiana(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          // fontStyle: FontStyle.italic
                          color: getProgressColor(),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Upcoming Attendance
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Upcoming Attendance",
                        style: GoogleFonts.irishGrover(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 15),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                "Present +2%",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                "Absent -2%",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),


              Column(
                children: [

                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isOpenOPS = !isOpenOPS;
                          });
                        },
                        child: _buildAnimatedCard(
                            child: Text("OOPS",
                                style: GoogleFonts.permanentMarker(fontSize: 25))),
                      ),
                      _buildAnimation(isOpenOPS),
                    ],
                  ),

                  Column(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              isOpenDS = !isOpenDS;
                            });
                          },
                          child: _buildAnimatedCard(
                              child: Text("Data Structure", style: GoogleFonts.permanentMarker(fontSize: 25)))),
                      _buildAnimation(isOpenDS),
                    ],
                  ),


                  Column(
                    children: [
                      InkWell(
                        onTap:(){
                          setState(() {
                            isOpenPS = !isOpenPS;
                          });
                        },
                        child: _buildAnimatedCard(
                            child: Text("Probability and Statistics",
                                style: GoogleFonts.permanentMarker(fontSize: 25))),
                      ),
                      _buildAnimation(isOpenPS)
                    ],
                  ),


                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            isOpenAI = !isOpenAI;
                          });
                        },
                        child: _buildAnimatedCard(
                            child: Text("AI", style: GoogleFonts.permanentMarker(fontSize: 25))),
                      ),
                      _buildAnimation(isOpenAI),
                    ],
                  ),

                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            isOpenTC = !isOpenTC;
                          });
                        },

                        child: _buildAnimatedCard(
                            child: Text("Technical Communication",
                                style: GoogleFonts.permanentMarker(fontSize: 25))),
                      ),
                      _buildAnimation(isOpenTC),
                    ],
                  ),

                  const SizedBox(height: 50,),





                  Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },

                      child: Text(isExpanded ? "Collapse" : "Expand",style: GoogleFonts.questrial(fontSize:20,fontWeight: FontWeight.w900)),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedCard({required Widget child}) {
    return AnimatedAlign(
      duration: Duration(milliseconds: 700),
      curve: Curves.elasticInOut,
      alignment: Alignment.center,
      heightFactor: isExpanded ? 1.2 : 0.15,
      child: AnimatedScale(
        duration: Duration(milliseconds: 700),
        curve: Curves.elasticInOut,
        scale: isExpanded ? 1.0 : 0.8,
        child: _buildCard(
            child: child as Text), // Assumes child is always a Text widget
      ),
    );
  }
  Widget _buildAnimation(bool isOpen){
    return AnimatedSize(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      child: isOpen && isExpanded
          ? Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text("Dropdown content here"),
      )
          : SizedBox(),
    );
  }
  Widget _buildCard({required Text child}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        margin: EdgeInsets.only(top: 10),
        width: 390,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black12, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.shade200.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}