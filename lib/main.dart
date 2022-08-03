// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
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
    return Scaffold(
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
                Navigator.push( context, MaterialPageRoute(builder: (context) => const SecondRoute()));
                /*
                 Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: SecondRoute(),
                  ),
                );
                */
              },              
            ),  
          ]          
        ),
      ),
      backgroundColor: Color(0xFF000000),
      body: Stack(
        children: [
          const Center(child: Text('FirstRoute', style: TextStyle( color: Colors.white ))),
        ],
      ),
    );
  }
}

class SecondRoute extends StatefulWidget {
  const SecondRoute();

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {

  @override
  void initState() {
    super.initState();
    print ( 'SecondRoute initState()...');
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              icon: const Icon( Icons.arrow_circle_left_outlined, size:32, color: Colors.black ),
                onPressed: () { 
                Navigator.pop(context);
              },              
            ),  
          ]          
        ),
      ),
      backgroundColor: Color(0xFFeeeeee),
      body: Stack(
        children: [
          const Center(child: Text('SecondRoute', style: TextStyle( color: Colors.black ))),
        ],
      ),
    );
  }
}