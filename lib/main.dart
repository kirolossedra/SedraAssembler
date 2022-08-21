import 'package:flutter/material.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';






void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
      ),
      home: const FirstPage(title:'Sedra Assembler') ,
    );
  }
}






class RamPage extends StatefulWidget {

  const RamPage({Key? key, required this.title}) : super(key: key);


  final String title;





  @override
  State<StatefulWidget> createState() {
    return _RamState();
  }
}

class _RamState extends State<RamPage> {

 List<int> ram = [0,0,0,0,0,0,0,0];



 bool flag = true ;
 String output = "";


 Future<void> _clp() async {
    Clipboard.setData(ClipboardData(text: output));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }
   String _16rbin(int a){
    int counter =16;
    String result= "";
    while (counter>0){
      result+=(a%2).toString();
      a=(a/2).floor();
      counter--;
      
    }
    return result.split('').reversed.join();

  }



 _changeRam(int location , String Value){
   
 setState(() {
   
   output = "";


   ram[location] = int.parse(Value);


   for(int i=0; i<8; i++){
     if(ram[i]>32767){
       ram[i]= 0;

     }
     
       output+=_16rbin(ram[i]);
       output+=',';

     
   }
       
       
    });


 }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Memory Mapping'),
      ),
      body: SingleChildScrollView( 


        child: Column(children: [


          ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(), 
              padding: const EdgeInsets.all(14)
          ),
          child: const Icon(
            Icons.copy,
            size: 20,
          ),
          onPressed: (flag)?() {

  setState(() {

    _clp();

  
    
    });



          }:null,
),



           TextField (   
      
      
      
      onChanged: (text) {  



             _changeRam(0,text); 
           
          
             
  } ,
  decoration: InputDecoration(  
    
    border: InputBorder.none,  
    labelText: 'r0',  
    hintText: 'r0'  
  ),  
) ,
  TextField (   
      
      
      
      onChanged: (text) {  



             _changeRam(1,text); 
           
          
             
  } ,
  decoration: InputDecoration(  
    
    border: InputBorder.none,  
    labelText: 'r1',  
    hintText: 'r1'  
  ),  
) ,
  TextField (   
      
      
      
      onChanged: (text) {  



             _changeRam(2,text); 
           
          
             
  } ,
  decoration: InputDecoration(  
    
    border: InputBorder.none,  
    labelText: 'r2',  
    hintText: 'r2'  
  ),  
) ,
  TextField (   
      
      
      
      onChanged: (text) {  



             _changeRam(3,text); 
           
          
             
  } ,
  decoration: InputDecoration(  
    
    border: InputBorder.none,  
    labelText: 'r3',  
    hintText: 'r3'  
  ),  
) ,
  TextField (   
      
      
      
      onChanged: (text) {  



             _changeRam(4,text); 
           
          
             
  } ,
  decoration: InputDecoration(  
    
    border: InputBorder.none,  
    labelText: 'r4',  
    hintText: 'r4'  
  ),  
)
,
  TextField (   
      
      
      
      onChanged: (text) {  



             _changeRam(5,text); 
           
          
             
  } ,
  decoration: InputDecoration(  
    
    border: InputBorder.none,  
    labelText: 'r5',  
    hintText: 'r5'  
  ),  
) ,
  TextField (   
      
      
      
      onChanged: (text) {  



             _changeRam(6,text); 
           
          
             
  } ,
  decoration: InputDecoration(  
    
    border: InputBorder.none,  
    labelText: 'r6',  
    hintText: 'r6'  
  ),  
) ,
  TextField (   
      
      
      
      onChanged: (text) {  



             _changeRam(7,text); 
           
          
             
  } ,
  decoration: InputDecoration(  
    
    border: InputBorder.none,  
    labelText: 'r7',  
    hintText: 'r7'  
  ),  
) , 



















        ],





        ),




      )



    );
  }
}



class FirstPage extends StatelessWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child:Column( mainAxisAlignment: MainAxisAlignment. center
        ,
          children: [ 


            InkWell(
          splashColor: Colors.black26,
          onTap: (


           



          ){
               Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const CpuPage(title: 'CpuPage');
   }));



          }
          ,

          child:Ink.image(
         image: AssetImage('assets/images/cpu.jpg'),
         height: 200,
         width: 200,
         fit: BoxFit.cover,
         
         
         
         
         
         )




        ) , Text('Instructions' , 


        style: GoogleFonts.dancingScript(

          fontSize: 36.0,
          color: Color.fromARGB(255, 171, 14, 119),
          fontWeight: FontWeight.bold




        ),
                
        
        ),
    SizedBox(height: 140)
     , InkWell(
          splashColor: Colors.black26,
          onTap: (){


             Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const RamPage(title: 'RamPage');
   }));



          }
          ,

          child:Ink.image(
         image: AssetImage('assets/images/ram.jpg'),
         height: 200,
         width: 200,
         fit: BoxFit.cover,
         
         
         
         
         
         )




        ), Text('Memory Mapping' , 


        style: GoogleFonts.dancingScript(

          fontSize: 36.0,
          color: Color.fromARGB(255, 171, 14, 119),
          fontWeight: FontWeight.bold




        ),
                
        
        )






          ],


        )
      ),
    );
  }
}












class CpuPage extends StatefulWidget {
  const CpuPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<CpuPage> createState() => _CpuState();
}

class _CpuState extends State<CpuPage> {
  
  String temp= "";
  String showText = "";
  final String st_loc = "Localization Error , Start is not found";
  final String st_wng = "Wrong Entry Point";
  final String end_wng = " Wrong End Point";
  
  final String ed_loc = " Localization Error , session is  not ended";
  final String cons_er = "Consistency Error session start and end are for different devices";
  final String quatr_er = "Sedra-Quattro Architecture Violation there is an instruction which is more or less than 4 words";
  final String mul_st = "Multiple Entry points detected for instruction Memory";
  final String mul_ed = " Multiple End points detected for instruction Memory";
  final String reg = "Register number incompatible with start device model";
  String instr = "";
  bool flag = false;
  bool reg_flag = false;


  String syntax= " ";
var msgController = TextEditingController();




  
  String _16bin(int a){
    int counter =3;
    String result= "";
    while (counter>0){
      result+=(a%2).toString();
      a=(a/2).floor();
      counter--;
      
    }
    return result.split('').reversed.join();

  }


   Future<void> _copyToClipboard() async {
    Clipboard.setData(ClipboardData(text: instr));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }
  void _getString(String s){
      setState(() {
        temp="";
        
        for(int i=0; i<s.length; i++){
          if( i!=0 && s[i-1] == s[i] && s[i-1] == " " ){

          }else{
            temp = temp+s[i];
          }

        }
        showText = "";
        int counter=0;
        for(int i=0; i<temp.split(' ').length; i++){
          showText+=temp.split(' ')[i];
          showText+=' ';
          counter++;
          if(counter==4){
            counter=0;
            showText+='\n';
          }
         
          


        }

       
    });
    

  }


  void _asm(){
      setState(() {
        int start = 0;
        int end =0;
        flag = false ;
        reg_flag=false;

        syntax = "";
        instr = "";
        int counter =0;
        for(int i=0; i<temp.split(' ').length; i++){
          if(temp.split(' ')[i]=="start"){
            start++;
          }
          if(temp.split(' ')[i]=="end"){
            end++;

          }
        }
        if(temp.split(' ')[0] != 'start'){
          counter++;
          syntax+="$counter. ";
          if(end>0){
          syntax+=st_wng;
          syntax+='\n';
          }
          else{
            syntax+=st_loc;
            syntax+='\n';
          }
          
          
        }
        if(temp.split(' ').length%4 != 0){
          counter++;
          syntax+="$counter. ";
          syntax+=quatr_er;
          syntax+='\n';

        }
        if(temp.split(' ')[temp.split(' ').length -3].toLowerCase() != temp.split(' ')[1].toLowerCase()  ){
          counter++;
          syntax+="$counter. ";
          syntax+=cons_er;
          syntax+='\n';


        }
            if(temp.split(' ')[temp.split(' ').length-4] != "end" ){
          counter++;
          syntax+="$counter. ";
         if(end>0){
           syntax+=end_wng;
           syntax+='\n';

         } else{
            syntax+=ed_loc;
          syntax+='\n';
         }


        }
        if(start>1){
           counter++;
          syntax+="$counter. ";
           syntax+=mul_st;
          syntax+='\n';

        }
        if(end>1){
           counter++;
          syntax+="$counter. ";
          syntax+=mul_ed;
          syntax+='\n';

        }
        if(counter==0){
          
          for(int i=1; i<temp.split(' ').length/4 -1 ; i++){


            var one = int.parse(temp.split(' ')[i*4+1][1]);
            var two = int.parse(temp.split(' ')[i*4+2][1]);
            var three = int.parse(temp.split(' ')[i*4+3][1]);
            if( temp.split(' ')[1].toLowerCase() == 'sedra16' && (one>7 || two>7 || three >7)){
              
              reg_flag= true;
              break;
            }
            flag = true;
            if(temp.split(' ')[i*4]== "addar"){
              instr+="000000";
              
           }
           if(temp.split(' ')[i*4]== "subar"){
              instr+="000001";
              
           }
           if(temp.split(' ')[i*4]== "addlog"){
              instr+="000010";
              
           }
           if(temp.split(' ')[i*4]== "mullog"){
              instr+="000011";
              
           }
              
              instr+=_16bin(one);
              instr+=_16bin(two);
              instr+=_16bin(three);
              instr += " , ";
       

            

          }
        }
        if(reg_flag){
          counter++;
          
          syntax+="$counter. ";
          syntax+="Register number is incompatible with device in session";
          syntax+='\n';
        }
        
       

       
    });
    

  }




  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: const Text('Create an Assembly Program'),
      ),
      body: SingleChildScrollView(
child: Column(
    children: <Widget>[
       Container(


        child:Row(
          
children: [ 


Expanded(child: Column(

children: [


    TextField (   
      controller: msgController,
      
      
      onChanged: (text) {  



             _getString(text); 
           
          
             
  } ,
  decoration: InputDecoration(  
    
    border: InputBorder.none,  
    labelText: 'Code',  
    hintText: 'Code Section'  
  ),  
)  ,







],




)





),

Expanded(child: Column(

children: [ 


     MaterialButton(
                    minWidth: double.infinity,
                    height: 30,
                    onPressed: (){



                        setState(() {

                           _asm();

  
    
    });



                     
                      

                    },
                    color: Color.fromARGB(255, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Text(
                      "Assemble",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 10
                      ),
                    ),
                  )







],




)





),


Expanded(child: Column(

children: [  

   ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(), 
              padding: const EdgeInsets.all(14)
          ),
          child: const Icon(
            Icons.copy,
            size: 20,
          ),
          onPressed: (flag)?() {

  setState(() {

    _copyToClipboard();

  
    
    });



          }:null,
) ,  







     







],




)





) ,




Expanded(child: Column(

children: [

   ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(), 
              padding: const EdgeInsets.all(14)
          ),
          child: const Icon(
            Icons.delete,
            size: 20,
          ),
          onPressed: () {

  setState(() {


    temp="";
    syntax="";
    showText="";
    instr = "";
    msgController.clear();


  
    
    });



          },
) ,  







     







],




)





)







],




        ),





        
      ) , 
      Row(children: [
Expanded(child: Row(
  
  
  
  

children: [


  EasyRichText(
  '$showText',
  defaultStyle: TextStyle(color: Colors.black , fontSize: 30) ,
  patternList: [
    EasyRichTextPattern(


      targetString: 'start',
      style: TextStyle(color: Colors.green , fontSize:30),
    ),

     EasyRichTextPattern(


      targetString: 'SEDRA16',
      style: TextStyle(color: Color.fromARGB(255, 193, 10, 144) , fontSize:30),
    ),
     EasyRichTextPattern(


      targetString: 'sedra16',
      style: TextStyle(color: Color.fromARGB(255, 193, 10, 144) , fontSize:30),
    ),


    EasyRichTextPattern(


      targetString: 'sedra64',
      style: TextStyle(color: Color.fromARGB(255, 91, 7, 217) , fontSize:30),
    ),EasyRichTextPattern(


      targetString: 'SEDRA64',
      style: TextStyle(color: Color.fromARGB(255, 91, 7, 217) , fontSize:30),
    )
    
    
    
    ,EasyRichTextPattern(


      targetString: 'end',
      style: TextStyle(color: Colors.green , fontSize:30),
    )

   ,
    
    EasyRichTextPattern(
      targetString: 'bold',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    EasyRichTextPattern(
      targetString: 'italic',
      style: TextStyle(fontStyle: FontStyle.italic , fontSize:13),
    ),
     EasyRichTextPattern(


      targetString: 'addar',
      style: TextStyle(color: Color.fromARGB(255, 13, 10, 193) , fontSize:30),
    ),
     EasyRichTextPattern(


      targetString: 'addlog',
      style: TextStyle(color: Color.fromARGB(255, 25, 10, 193) , fontSize:30),
    ),
       EasyRichTextPattern(


      targetString: 'mullog',
      style: TextStyle(color: Color.fromARGB(255, 25, 10, 193) , fontSize:30),
    ),
       EasyRichTextPattern(


      targetString: 'mullar',
      style: TextStyle(color: Color.fromARGB(255, 25, 10, 193) , fontSize:30),
    ),
       EasyRichTextPattern(


      targetString: 'subar',
      style: TextStyle(color: Color.fromARGB(255, 25, 10, 193) , fontSize:30),
    ),
  ],
),

                          




],



)




) ,







      ],





      )



      
      
      
      
     
      
      
      
      ,  
 Text(  
                                  "$syntax", style: TextStyle(  
                                  fontWeight: FontWeight.bold  , fontSize: 20
                                  ,color:Color.fromRGBO(255, 0, 0, 1)
                              )  
                              )
  ,] 
      
      
      
      )
      
      
      
      )
    );
}

}

