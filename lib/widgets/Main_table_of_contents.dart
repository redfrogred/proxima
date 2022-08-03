


// ignore_for_file: file_names, camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
class Main_table_of_contents extends StatelessWidget {

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
    return Center(
      child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children:  [

            // route
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('( FirstRoute )'),
            ),

            // title
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Table of Contents', style: TextStyle( fontSize: 28,)),
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
                      _td('decription',20),   
                    ]
                  ),  
                  TableRow( 
                    decoration: _stripe,  // zebra stripe this row!
                    children: [  
                      _td('main'),  
                      _td('this branch (with the table of contents)'),  
                    ]
                  ),  
                  TableRow( 
                    children: [  
                      _td('name'),  
                      _td('description here...'),  
                    ]
                  ),  
                  TableRow( 
                    decoration: _stripe,  // zebra stripe this row!                    
                    children: [  
                      _td('name'),  
                      _td('description here...'),  
                    ]
                  ),  
                ],  
              ),
            ),



            // legend
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('Above are some Git branch names that are for various code samples.  You can see them in action by using:\ngit checkout -b <<branch_name>>'),
            ),

          ],
        ),
      );
  }
}