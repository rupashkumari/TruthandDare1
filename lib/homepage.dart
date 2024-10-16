import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truth/dare.dart';
import 'package:truth/never_have_i_ever.dart';
import 'package:truth/paranoia.dart';
import 'package:truth/truth.dart';
import 'package:truth/would_you_rather.dart';

//import 'package:truth/truth.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1 ({Key? key}) : super(key:key);
  
  @override
  Widget build(BuildContext context) {
   
return Scaffold(
  
  body: Container(
  
    decoration:const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [const Color.fromARGB(255, 242, 201, 198), const Color.fromARGB(255, 253, 204, 200)]
       

        ),
    ) ,
     
     child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
    

         GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const Truth())) ,
           child: Container(
              
              height: 50,
              width: MediaQuery.of(context).size.width/1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              color:  const Color.fromRGBO(229, 121, 114, 1),
            ),
              child: const Center(
               child: Text(
                  'TRUTH',
                  style: TextStyle(
                    
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
         )
        ],
      ),
       const SizedBox(
        height: 50,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


          GestureDetector(
             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const Dare())) ,
            child: Container(
              
              height: 50,
              width: MediaQuery.of(context).size.width/1.5,
              color:  const Color.fromRGBO(229, 121, 114, 1),
             
              child: const Center(
                child: Text(
                  'DARE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
       const SizedBox(
        height: 50,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
        GestureDetector(
           onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const WouldYouRather())) ,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width/1.5,
              color: const Color.fromRGBO(229, 121, 114, 1),
              child: const Center(
                child: Text(
                  'WOULD YOU RATHER',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
       const SizedBox(
        height: 50,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
          GestureDetector(
             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const NeverHaveIEver())) ,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width/1.5,
              color:  const Color.fromRGBO(229, 121, 114, 1),
              child: const Center(
                child: Text(
                  'NEVER HAVE I EVER',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
       const SizedBox(
        height: 50,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          GestureDetector(
             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const Paranoia())) ,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width/1.5,
              color: const Color.fromRGBO(229, 121, 114, 1),
              child: const Center(
                child: Text(
                  ' PARANOIA QUESTION',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ],
     ),
  ),
);
  }}

 

  
