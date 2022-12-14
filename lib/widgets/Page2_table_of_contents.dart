


// ignore_for_file: file_names, camel_case_types, use_key_in_widget_constructors

// https://www.fluttercampus.com/guide/112/how-to-populate-elements-on-listview-from-array-in-flutter-app/

import 'package:flutter/material.dart';
class Page2_table_of_contents extends StatelessWidget {

  // cell padding and row stripe color for table
  final double _width = 8;
  final BoxDecoration _stripe = const BoxDecoration (color:  Color(0xFF222222) );

  // method for generating table cells
  TableCell _td ( String text, [ double sz = 16.0 ] ) {
    return TableCell(
        verticalAlignment: TableCellVerticalAlignment.top,
        child: Padding(
            padding: EdgeInsets.all(_width),
            child: Text( text, style: TextStyle( fontSize: sz )),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children:  [
    
          // route
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text('~ Page 2 of 2 ~'),
          ),
    
          // title
          const Padding(
            padding: EdgeInsets.fromLTRB(0,0,0,10),
            child: Text('Table of Contents', style: TextStyle( fontSize: 22,)),
          ),
    
          // see:
          // https://medium.com/flutter-community/table-in-flutter-beyond-the-basics-8d31b022b451
          // table
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:   Table(  
              columnWidths: const {
                0: FixedColumnWidth(120),
                1: FixedColumnWidth(250),
              },
              border: TableBorder.all(  
                  color: Colors.transparent,  
                  style: BorderStyle.solid,  
                  width: 2),  
              children: [  
                TableRow( 
                  children: [  
                    _td('branch',20),  
                    _td('description',20),   
                  ]
                ),  
                TableRow( 
                  decoration: _stripe,  // zebra stripe this row!
                  children: [  
                    _td('listview'),  
                    _td('array to listview example'),  
                  ]
                ),  
                                
              ],  
            ),
          ),
    
    
    
          // legend
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(''),
          ),
    
        ],
      ),
    );
  }
}