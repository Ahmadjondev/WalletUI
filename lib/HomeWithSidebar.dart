import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/HomePage.dart';

class HomeWithSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class homeWithSidebar extends StatefulWidget {
  const homeWithSidebar({Key? key}) : super(key: key);

  @override
  _homeWithSidebarState createState() => _homeWithSidebarState();
}

class _homeWithSidebarState extends State<homeWithSidebar>
    with TickerProviderStateMixin {
  bool sideBarActive = false;
  AnimationController? rotationController;

  @override
  void initState() {
    super.initState();
    rotationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f3f6),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.6,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(60)),
                        color: Colors.white),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xfff1f3f6),
                                image: DecorationImage(
                                    image: AssetImage('images/avatar1.png'))),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ahmadjon Dev",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Fergana, Uzbekistan",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    navigatorTitle("Home", true),
                    navigatorTitle("Profile", false),
                    navigatorTitle("Accounts", false),
                    navigatorTitle("Transactions", false),
                    navigatorTitle("Stats", false),
                    navigatorTitle("Settings", false),
                    navigatorTitle("Help", false)
                  ],
                ),
              ),
              FlatButton(
                padding : EdgeInsets.all(16),
                onPressed: () {  },
                child: Row(
                  children: [
                    Icon(
                      Icons.power_settings_new,
                      size: 30,
                    ),
                    Text(
                      "Logout",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(20),
                child: Text(
                  "Ahmadjon Developer",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            left: (sideBarActive) ? MediaQuery
                .of(context)
                .size
                .width * 0.6 : 0,
            top: (sideBarActive) ? MediaQuery
                .of(context)
                .size
                .height * 0.2 : 0,
            child: RotationTransition(
              turns: (sideBarActive)
                  ? Tween(begin: -0.05, end: 0.0).animate(rotationController!)
                  : Tween(begin: 0.0, end: -0.05).animate(rotationController!),
              child: AnimatedContainer(
                height: (sideBarActive)
                    ? MediaQuery
                    .of(context)
                    .size
                    .height * 0.9
                    : MediaQuery
                    .of(context)
                    .size
                    .height,
                width: (sideBarActive)
                    ? MediaQuery
                    .of(context)
                    .size
                    .width * 0.9
                    : MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.white),
                duration: Duration(milliseconds: 200),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: homePage(),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 20,
            child: (sideBarActive)
                ? IconButton(
              padding: EdgeInsets.all(25),
              onPressed: closeSidebar,
              icon: Icon(
                Icons.close,
                color: Colors.black,
                size: 30,
              ),
            )
                : InkWell(
              onTap: openSidebar,
              child: Container(
                margin: EdgeInsets.all(25),
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/menu.png'))),
              ),
            ),
          )
        ],
      ),
    );
  }

  void closeSidebar() {
    sideBarActive = false;
    setState(() {});
  }

  void openSidebar() {
    sideBarActive = true;
    setState(() {});
  }

  FlatButton navigatorTitle(String name, bool isSelected) {
    return FlatButton(
      onPressed: () {
        setState(() {
          if (sideBarActive) {
            openSidebar;
          };

        });
      },
      child: Row(
        children: [
          (isSelected)
              ? Container(
            width: 5,
            height: 60,
            color: Color(0xffffac30),
          )
              : Container(
            width: 5,
            height: 60,
          ),
          SizedBox(
            width: 10,
            height: 60,
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 16,
                fontWeight: (isSelected) ? FontWeight.w700 : FontWeight.w400),
          )
        ],
      ),
    );
  }
}
