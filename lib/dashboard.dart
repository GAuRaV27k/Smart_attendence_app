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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ------------------ APPBAR ------------------
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Smart Attendance",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
          ],
        ),
      ),

      // ------------------ BODY ------------------
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 10),

                // ------------------ MAIN ATTENDANCE CARD ------------------
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 350,
                  height: 265,
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

                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ------------------ CIRCULAR INDICATOR ------------------
                        CircularPercentIndicator(
                          radius: 45.0,
                          lineWidth: 10.0,
                          percent: 0.25,
                          animation: true,
                          animationDuration: 1200,
                          center: Text(
                            "25 %",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.greenAccent,
                          backgroundColor:
                          Colors.grey.shade400.withOpacity(.2),
                        ),

                        const SizedBox(width: 20),

                        // ------------------ RIGHT SIDE CONTENT ------------------
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Attendance",
                                style: GoogleFonts.irishGrover(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 15),

                              // PRESENT / ABSENT BUTTON ROW
                              Row(
                                children: [
                                  // PRESENT BUTTON
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10),
                                      decoration: BoxDecoration(
                                        color:
                                        Colors.greenAccent.shade100,
                                        borderRadius:
                                        BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.check,
                                              color: Colors.green),
                                          SizedBox(width: 6),
                                          Text(
                                            "Present",
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  SizedBox(width: 10),

                                  // ABSENT BUTTON
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade200,
                                        borderRadius:
                                        BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Absent",
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ------------------ OTHER BOXES ------------------
                _buildCard(),
                _buildCard(),
                _buildCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ------------------ REUSABLE CARD FUNCTION ------------------
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
