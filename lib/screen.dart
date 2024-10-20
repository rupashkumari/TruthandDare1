import 'package:flutter/material.dart';
import 'package:truth/homepage.dart';
//import 'package:truth/truth.dart';

 class Screen extends StatelessWidget {
  const Screen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: getAppBar(
    ),
    body: getBody(context),
       backgroundColor: const Color.fromARGB(255, 250, 203, 203),
       

   );
  }
  
     Container getBody(BuildContext context){
     
    return Container(

      width: MediaQuery.of(context).size.height ,
      height: MediaQuery.of(context).size.height ,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Container(
           width: MediaQuery.of(context).size.width/1.2 ,
          
           height: 100,
           child: const Center(
                              child: Text(
                                '             SPICE UP \n      THE BEST PARTY \n   MULTIPLAYER GAME',
                                style: TextStyle(color: Color.fromARGB(255, 8, 0, 0),
                                fontStyle: FontStyle.italic,fontSize: 25),
                                
                                )
                                ), 
           decoration: BoxDecoration(
          
             color: const Color.fromARGB(255, 250, 203, 203),
             borderRadius: BorderRadius.circular(10),
           ),
       
          ),
       const  SizedBox(
          height: 70,
        ) , 
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
              ]
          ),
          SizedBox(
              height: 115,
          ),
           GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const HomePage1())) ,
               child:  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(229, 121, 114, 1),
                       borderRadius: BorderRadius.circular(20),
                    ),
                   width: (MediaQuery.of(context).size.width/2)-35 ,
                             height: 50, 
                             child: const Center(
                              child: Text(
                                ' Click Here',
                                style: TextStyle(color: Color.fromARGB(255, 8, 0, 0),fontSize: 20),
                                )
                                ), 
                  ),
    ),
              ], 
             ),
    );
  }

}

  getAppBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 250, 203, 203),
      elevation: 0.0,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
    );
  }
  
 