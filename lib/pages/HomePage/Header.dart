import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_mine/models/header_items.dart';
import 'package:portfolio_mine/utility/ScreenHelper.dart';
import 'package:portfolio_mine/utility/constants.dart';
import 'package:portfolio_mine/utility/global_key.dart';
import 'package:responsive_framework/responsive_framework.dart';
List<HeaderItem> headerItems = [

  HeaderItem(
      title: "Home",
      onTap: (){}
  ),

  HeaderItem(
      title: "My Intro",
      onTap: (){}
  ),
  HeaderItem(
      title: "Services",
      onTap: (){}
  ),
  HeaderItem(
      title: "Portfolio",
      onTap: (){}
  ),
  HeaderItem(
      title: "Testimonials",
      onTap: (){}
  ),
  HeaderItem(
      title: "Blogs",
      onTap: (){}
  ),
  HeaderItem(
      title: "Hire Me",
      isButton: true,

      onTap: (){}
  ),


];

//Header Logo
class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          
          onTap: (){},
          child: RichText(
              text:TextSpan(

                children: [
                  TextSpan(
                    text: "F",
                    style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(

                    text: ".",
                    style: GoogleFonts.oswald(
                    color: kPrimaryColor,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
          ),

                ]


              )


          ),
          
          
        ),



      ),


    );
  }
}
//Header Row
class HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(

      visible: false,
      visibleWhen: [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(

        children: headerItems.map((e) => e.isButton? MouseRegion(

          cursor: SystemMouseCursors.click,
          child: Container(
            decoration: BoxDecoration(
              color: kDangerColor,
              borderRadius: BorderRadius.circular(10.0),




            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextButton(
              onPressed: e.onTap,
              child: Text(e.title,
             style: TextStyle(

               color: Colors.white,
               fontSize: 13.0,
               fontWeight: FontWeight.bold,




             ) ,
            ),
            ),
          ),
        )
            : MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            margin: EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: e.onTap,
              child: Text(
                e.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,


                ),

              ),

            ),


          ),


        ),

        ).toList(),



      ),




    );
  }
}


class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return ScreenHelper(
      desktop: Padding(padding: EdgeInsets.symmetric(vertical: 8.0),
        child: buildHeader(),
      ),
      mobile: buildMobileHeader(),
     tablet: buildHeader(),

    );

  }
}


Widget buildMobileHeader(){

  return SafeArea(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal:16.0 ) ,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  HeaderRow(),
                  GestureDetector(

                    onTap: (){

                      Globals.scaffoldkey.currentState.openEndDrawer();



                    },
                    child: Icon(
                      FlutterIcons.menu_fea,
                      color: Colors.white,
                      size: 30.0,

                    ),



                  )



                ],


              ),


      )


  );

}





Widget buildHeader(){

  return Container(

    padding: EdgeInsets.symmetric(horizontal: 16),

    child: Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [

        HeaderLogo(),
        HeaderRow(),




      ],


    ),


  );


}


