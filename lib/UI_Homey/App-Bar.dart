import 'package:flutter/material.dart';

import 'package:icons_plus/icons_plus.dart';

class Apbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  const Apbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar( backgroundColor: Colors.blueGrey,
      title: Text('Tv-Shows',style: TextStyle(color:Colors.white),),
      leading: IconButton(
        icon: Icon(BoxIcons.bx_menu,color: Colors.white,),
        onPressed: () {
          // Handle menu button press
          print('Menu button pressed');
        },
      ),
      actions: [
        IconButton(
          icon: Icon(BoxIcons.bx_search,color: Colors.white,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>hello()));

          },
        ),
      ],
    );
  }
}


class hello extends StatelessWidget {
  const hello({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        border: OutlineInputBorder(

        )
      ),

    );
  }
}

