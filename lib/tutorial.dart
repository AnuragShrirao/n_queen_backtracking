import 'package:flutter/material.dart';

class Tutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("N-Queen Backtracking"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "N-Queen Problem",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
            ),
            Center(
              child: Container(
                  height: 100,
                  width: 500,
                  child: Text(
                    "The N Queen is the problem of placing N chess queens on an N×N chessboard so that no two queens attack each other. For example, following is a solution for 4 Queen problem.",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Image.asset(
              "images/example.jpg",
              height: 300,
              width: 300,
            ),
            Center(
              child: Container(
                  height: 100,
                  width: 500,
                  child: Text("The expected output is a binary matrix which has 1s for the blocks where queens are placed. For example, following is the output matrix for above 4 queen solution.",
                    style: TextStyle(fontSize: 20),
                  )),
            ),

          ],
        ),
      ),
    );
  }
}
