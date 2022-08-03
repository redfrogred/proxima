// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
      theme: ThemeData(
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Color(0xFF000000), 
      // displayColor: Colors.blue, 
    ),
  ),    
  initialRoute: 'FirstRoute',
    routes: {
      'FirstRoute': (context) => const FirstRoute(),
      'SecondRoute': (context) => const SecondRoute(),
    },    
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
    print ( '> FirstRoute initState()...');

    WidgetsBinding.instance!.addPostFrameCallback((_){
      print ('> addPostFrameCallback() for FirstRoute called (this means "build" completed...)');
    }); 

  }

  @override
  void dispose() {
    print ( '> FirstRoute dispose()...');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print ( '> build() triggered (for FirstRoute)');

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
                  Navigator.pushNamed( context, 'SecondRoute');
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
        backgroundColor: Color(0xFFcccccc),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 300,child: Text('FirstRoute()\nis a Stateful Widget')),
              Container(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'What do people call you?',
                      labelText: '( first name )',
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                      return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                    },
                  ),
                ),
              ),
              Container(
                width: 300,
                child: Text('\nEnter some text and navigate away.\n')),
              Container(
                width: 300,
                child: Text('View the console to see the\ndebug messages...')),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondRoute extends StatefulWidget {
  const SecondRoute({ Key? key }) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {

  @override
  void initState() {
    super.initState();
    print ( '> SecondRoute initState()...');

    WidgetsBinding.instance!.addPostFrameCallback((_){
      print ('> addPostFrameCallback() for SecondRoute called');
    });   
  }

  @override
  void dispose() {
    print ( '> SecondRoute dispose()...');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print ( '> build() triggered (for SecondRoute)');

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
                icon: const Icon( Icons.arrow_circle_left_outlined, size:32, color: Colors.black ),
                  onPressed: () { 
                    Navigator.pop( context );
                    // Navigator.pushNamed( context, 'FirstRoute');
                    //Navigator.push( context, MaterialPageRoute(builder: (context) => const FirstRoute()));
                    //Navigator.pop(context);
                },              
              ),  
            ]          
          ),
        ),
        backgroundColor: Color(0xFFeeeeee),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 300,child: Text('SecondRoute()\nis also a Stateful Widget')),
              Padding(
                padding: EdgeInsets.fromLTRB(0,10,0,10) ,
                child: ElevatedButton(   
                  child: Text('Pop'),
                  onPressed: () {
                    Navigator.pop( context );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0,0,0,10),
                child: ElevatedButton(   
                  child: Text('Push'),
                  onPressed: () {
                    Navigator.pushNamed( context, 'FirstRoute');
                  },
                ),
              ),              
              Container(
                width: 300,
                child: Text('See what happens if you Pop versus Push...')),
            ],
          ),
        ),
      ),
    );
  }
}
