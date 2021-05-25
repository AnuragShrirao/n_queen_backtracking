import 'package:flutter/material.dart';

class Algorithm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Backtracking Agorithm"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "Backtracking Algorithm",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Container(
                width: 800,
                height: 150,
                child: Text(
                  "The idea is to place queens one by one in different columns, starting from the leftmost column. When we place a queen in a column, we check for clashes with already placed queens. In the current column, if we find a row for which there is no clash, we mark this row and column as part of the solution. If we do not find such a row due to clashes then we backtrack and return false.",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Text(
              " Algorithm :",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            Center(
              child: Container(
                width: 800,
                child: Text(
                  "1) Start in the leftmost column \n\n2) If all queens are placed return true \n\n3) Try all rows in the current column. Do following for every tried row. \n\n  a) If the queen can be placed safely in this row then mark this [row, column] as part of the solution and recursively check if placing queen here leads to a solution. \n\n b) If placing the queen in [row, column] leads toa solution then return true. \n\n c) If placing queen doesn't lead to a solution then unmark this [row, column] (Backtrack) and go to step (a) to try other rows. \n\n4) If all rows have been tried and nothing worked,return false to trigger backtracking.",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
