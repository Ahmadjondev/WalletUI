import 'package:flutter/material.dart';
import 'package:wallet_app/HomeWithSidebar.dart';

import 'HomePage.dart';

void main() {
  runApp(WalletApp());
}
class WalletApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      routes: {'/homePage': (context) => HomePage()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/sideImg.png'), fit: BoxFit.cover)),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "06:22 AM",
                      style: TextStyle(
                          fontFamily: 'avenir',
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/cloud.png'),
                              fit: BoxFit.contain)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "34° C",
                      style: TextStyle(
                          fontFamily: 'avenir',
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Text(
                  "Dec 13, 2021 | Monday",
                  style: TextStyle(
                      fontSize: 16, fontFamily: "avenir", color: Colors.grey),
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/logo.png'),
                                fit: BoxFit.contain)),
                      ),
                      Text(
                        "eWalle",
                        style: TextStyle(
                            fontSize: 50,
                            fontFamily: 'ubuntu',
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Open An Account For \n Digital E-Wallet Solutions. \n Instant Payouts. \n \n Join For Free",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                )),
                InkWell(
                  autofocus: true,
                  focusColor: Colors.grey,
                  onTap: openHomePage,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color(0xffffac30),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign in ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 17,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Create an account",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  void openHomePage() {
    Navigator.pushNamed(context, '/homePage');
  }
}
// 16.12.2021
// Developer :   Ahmadjon Dev.
// Project Name : Wallet App
// Ahmadjon Abduhoshimjonov