import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown[500],
        body: Column(
          children: [
            SizedBox(height: 150),
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/kahve.jpg'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Flutter Kahvecisi',
              style: TextStyle(
                fontFamily: 'Satisfy',
                color: Colors.black,
                fontSize: 32,
              ),
            ),

            SizedBox(height: 12),
            Text(
              'Bir Fincan Uzağında',
              style: GoogleFonts.lobster(color: Colors.white, fontSize: 24),
            ),
            Container(
              width: 200,
              child: Divider(height: 30, color: Colors.brown[900]),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 45.0),
              color: Colors.brown[900],
              child: ListTile(
                leading: Icon(Icons.email, color: Colors.white),
                title: Text(
                  'iletişim@kahveci.com',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 45.0),
              color: Colors.brown[900],
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.white),
                title: Text(
                  '+90 555 55 55',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
