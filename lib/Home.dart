import 'package:calculator/Advance.dart';
import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController tabController;

  void initState() {
    super.initState();
    tabController = new TabController(initialIndex: 0,length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          elevation: 5.0,
          backgroundColor: Colors.black,
          bottom: TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            tabs: [
              new Text("calulator",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
              new Text("Advance"),

            ],
          ),
          actions: <Widget>[
            Icon(Icons.more_vert),
          ],
        ),
      ),
   body: TabBarView(controller: tabController,children: <Widget>[
     new Calculator(),
     new Advance(),
   ],), );
  }
}
