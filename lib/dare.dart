import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Dare extends StatefulWidget {
  const Dare({Key? key}) : super(key:key);

  @override
  State<Dare> createState() => _DareState();
}

class _DareState extends State<Dare> {
  String question = '';
  bool isLoading = true;


@override
 void initState() {
  super.initState();
  fetchQuestion();
 }


 Future<void> fetchQuestion() async {
    final url = Uri.parse('https://api.truthordarebot.xyz/api/dare'); // Replace with your API URL

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          question = data['question']; // Assuming the API returns {"question": "Your question here"}
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load question');
      }
    } catch (e) {
      setState(() {
        question = 'Error fetching question';
        isLoading = false;
      });
      print(e);
    }
  }

  
  @override
  Widget build(BuildContext context) {
   
 return Scaffold(
    appBar: getAppBar(),
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
           height: 250,
            
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(10),
           ),
           child: Center(
                              child: isLoading
                  ? const CircularProgressIndicator() // Show spinner while loading
                  : Center(
                    child: Text(
                        question, // Display the question from the API
                        style: const TextStyle(
                          color: Color.fromARGB(255, 8, 0, 0),
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                  ),
                                ),
       
          ),
       const  SizedBox(
          height: 70,
        ) , 
             const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 SizedBox(
                  width: 10,
                ),
              ]
          ),
          GestureDetector(
            onTap: () {
              fetchQuestion();
            } ,
          
                child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(229, 121, 114, 1),
                       borderRadius: BorderRadius.circular(20),
                    ),
                   width: (MediaQuery.of(context).size.width/2)-35 ,
                             height: 50, 
                             child: const Center(
                              child: Text(
                                'NEXT',
                                style: TextStyle(color: Colors.black,fontSize: 20),
                                )
                                ), 
                  ),
          )
              ],
                             
       
             ),
    );
       
    
    

    
  }

  getAppBar() {
     return AppBar(
      backgroundColor:  const Color.fromRGBO(229, 121, 114, 1),
      elevation: 0.0,
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Text('DARE'),
      centerTitle: true,
    );
  }
}