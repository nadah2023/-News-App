import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_6/controller/Cubit.dart';
import 'package:task_6/controller/State.dart';
import 'package:task_6/veiw/clickable.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

   @override
     State<HomeScreen> createState() => _HomeScreen() ;
 
  }

  class _HomeScreen extends State<HomeScreen>{
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, NewsState>(builder: (context, state) {
      final cubit = HomeCubit.get(context);
      
    if(state is SucessNews){
    return Scaffold(
      appBar: AppBar(title: const Text("Local News",style: TextStyle(color:Color.fromARGB(255, 0, 245, 212)),),
      backgroundColor:  Colors.white),

      body:  ListView.builder(
            itemCount: cubit.titles.length,
            itemBuilder: (context, index) {
              return  ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  Container(
                    
                    height: 150,
                    width:double.infinity,
                    
                      decoration:  const BoxDecoration(
                       // borderRadius: BorderRadius.circular(0),
                        shape:BoxShape.rectangle,
                        color:  Colors.white , 
                        ),
                      
                    child:  

                      Row(
                        children:
                         [
                          SizedBox(
                            width: 250,
                            child:  Column(
                    
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    
                   Text(cubit.authors[index],style: const TextStyle(fontStyle: FontStyle.italic,color: Colors.blue,fontSize: 14),),

                  const Padding(padding: EdgeInsets.all(6)),
                  Text(cubit.titles[index],style: const TextStyle(color: Colors.black,fontSize: 9),),
                  const Padding(padding: EdgeInsets.all(12)),
                  Text(cubit.publishedAt[index],style: const TextStyle(color: Colors.grey,fontSize: 7),),
               //  const  Text("______________________",style:  TextStyle(color: Colors.grey),),
                      ],
                    )
                          ),
                          
                         SizedBox(
                          width: 100,
                          height: 100,
                          child:ClickablePhoto(
                            imageUrl: (index % 2 == 0 )? "https://media.gettyimages.com/id/1369916731/vector/breaking-news-background-stock-illustration.jpg?s=612x612&w=0&k=20&c=N3duJTBxcreQLBl-ZnYzX2kqzi1zHK_FodmYD25BtgU="
                            :"https://media.gettyimages.com/id/1202550100/photo/breaking-news-reporter-reporting-on-coronavirus-from-china.jpg?s=612x612&w=0&k=20&c=N7J2tfneAom44NgWXravrBvvKfvDuLFsdMWcjg2tYYs=", 
                            linkUrl: cubit.urls[index]) ,
                        )  
                  
                  
                              
                        

                        ],
                    ),
                    
                     
                    
                    
                    
                    ),
                  
                        


                  

                ],
              )

              ,
              );
            },
          ),
        
    );
    
  
  }
  else if(state is Apifailed){
    return Scaffold(
      appBar: AppBar(title: const Text("Local News",style: TextStyle(color: Color.fromARGB(255, 7, 255, 234)),),
      backgroundColor: const Color.fromARGB(251, 210, 201, 241),),

      body:Center(child:Text(state.erorr.toString())  ,)
    );
  }

  else{
    return Scaffold(
      appBar: AppBar(title: const Text("Local News",style: TextStyle(color: Color.fromARGB(255, 7, 255, 234)),),
      backgroundColor: const Color.fromARGB(251, 210, 201, 241),),

      body:const Center(child: Text("Loading...")  ,)
    );
  }
  
  });


  }
    
  }
  

  
  
  
  
