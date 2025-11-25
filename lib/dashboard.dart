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
  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  Color getProgressColor() {
    if (attandance < 0.55) {
      return Colors.red;
    } else if (attandance < 0.75) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }
   String status(){
    if (attandance >= 0.90){
      return "Excellent";
    }
    else if (attandance < 0.90 && attandance >= 0.75){
      return "Good";
    }
    else if (attandance < 0.75 && attandance >= 0.5){
      return "Average !Improve!";
    }
    else{
      return "Poor!! It's Sucks";
    }

   }
  double attandance = 0.25;
  @override
  Widget build(BuildContext context) {

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
                          percent: attandance,
                          animation: true,
                          center: Text(
                            "${(attandance * 100).toInt()}%"
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
                                attandance +=0.05;
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
                                attandance -= 0.01;   // increase 2%
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

              SizedBox(height: 20),

              // Dummy cards (optional)
              _buildCard(),
              _buildCard(),
              _buildCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 350,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(46),
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
    );
  }
}