import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:n_queen_backtracking/algorithm.dart';
import 'package:n_queen_backtracking/code.dart';
import 'package:n_queen_backtracking/tutorial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController text = TextEditingController(text: 4.toString());
  int m;

  @override
  Widget build(BuildContext context) {
    int m = int.parse(text.text);
    var tList = List.generate(m, (i) => List.filled(m, 0), growable: false);
    Code code = Code();
    code.nQueen(tList, 0, m);
    List solution = [];
    tList.forEach((elements) {
      elements.forEach((element) {
        solution.add(element);
      });
    });
    return Scaffold(
        appBar: AppBar(
          title: Text("N-Queen"),
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(
                    "Anurag Shrirao",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  currentAccountPicture: FlutterLogo(
                    textColor: Colors.deepPurple,
                  ),
                  accountEmail: Text(
                    "anuragshrirao@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.dashboard,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Dashboard",
                    style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.developer_board,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Tutorial",
                    style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Tutorial()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.help,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Algorithm",
                    style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Algorithm()));
                  },
                ),
              ],
            ),
          ),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: TextField(
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        controller: text,
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      child: Text("SUBMIT"),
                      onPressed: () {
                        setState(() {
                          m = int.parse(text.text);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Container(
                  height: 550,
                  width: 550,
                  child: GridView.count(
                    crossAxisCount: m,
                    children: List.generate(
                      m * m,
                      (index) {
                        return buildElement(index, m, solution);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  buildElement(int i, int m, List list) {
    var colorChange;
    if (m.isEven) {
      colorChange = (i ~/ m + i) % 2 == 0 ? true : false;
    } else {
      colorChange = i.isEven ? true : false;
    }
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: colorChange ? Colors.black : Colors.white,
        // colorChange?Color(0xff9A5725)
        //     :Color(0xffD7A357),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Center(
        child: list[i] == 0 ? SizedBox() : Lottie.asset("images/queen1.json"),
      ),
    );
  }
}
