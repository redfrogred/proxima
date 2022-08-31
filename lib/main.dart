// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proxima/widgets/Main_table_of_contents.dart';
import 'package:proxima/widgets/Page2_table_of_contents.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
      theme: ThemeData(
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Color(0xFFeeeeee), 
      // displayColor: Colors.blue, 
    ),
  ),    
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatefulWidget {
  const FirstRoute();

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {

  @override
  void initState() {
    super.initState();
    print ( 'FirstRoute initState()...');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         
       extendBodyBehindAppBar: true, 
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              // action button
              IconButton(
                icon: const Icon( Icons.arrow_circle_right_outlined, size:32 ),
                  onPressed: () { 
                  // Navigator.push( context, MaterialPageRoute(builder: (context) => const SecondRoute()));
                   Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: SecondRoute(),
                    ),
                  );
                },              
              ),  
            ]          
          ),
        ),
        backgroundColor: Color(0xFF000000),
        body: Stack(
          children: [
            Main_table_of_contents(),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       extendBodyBehindAppBar: true, 
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              // action button
              IconButton(
                icon: const Icon( Icons.arrow_circle_left_outlined, size:32, color: Colors.white ),
                  onPressed: () { 
                  Navigator.pop(context);
                },              
              ),  
            ]          
          ),
        ),
        backgroundColor: Color(0xFF000000),
        body: Stack(
          children: [
            Page2_table_of_contents(),
          ],
        ),
      ),
    );
  }
}
