import 'package:flutter/material.dart';


class AlertDialogApp extends StatefulWidget {
 

  @override
  _AlertDialogAppState createState() => _AlertDialogAppState();
}

class _AlertDialogAppState extends State<AlertDialogApp> {
      bool _isInitialValue = true;
    final _formKey = GlobalKey<FormState>();  
    final scaffoldKey = GlobalKey<ScaffoldState>();
    void _showSnack() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.teal,
      content: Text("your successfully login"),
          //padding: EdgeInsets.all(10.0),
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
               duration: const Duration(seconds: 10),
                   behavior: SnackBarBehavior.floating,
    ));
  }
     void _show(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (_) => AlertDialog(
              title: Text(' DSC ALZAHR '),
              content: Text(' Are you sure you want to sing in?'),
              actions: [
                TextButton(
                   onPressed: ()=> Navigator.of(ctx).pop(),
                    child: Text('Close ')),
                     TextButton(
                     onPressed: () {
                      _showSnack();
                      Navigator.of(ctx).pop();
                    },
                    
                    child: Text('OK '))
              ],
            ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:PreferredSize(child: AppBar(
        title: Text("DSCSESSION4"),
        centerTitle: true,


      ),
      preferredSize: Size.fromHeight(100),
      ),
      body: Center(
        child:Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(  
            decoration: const InputDecoration(  

                
                border: OutlineInputBorder(),
                icon: const Icon(Icons.person),  
                hintText: 'Enter your name',  
                labelText: 'Name',  
            ),  
            validator: (value){
                if(value.isEmpty){
                 return "Name is required"; 
                }
                return null;
            },
          ),
              ),
                  Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),            
                  child: TextFormField(  
            decoration: const InputDecoration(  
              border: OutlineInputBorder(),
              icon: const Icon(Icons.lock),  
              hintText: 'Enter your Password',  
              labelText: 'Pass',  
            ),
            validator: (value){
              if(value.isEmpty){
               return "Password is required"; 
              }
              return null;
            },  
          ),
                  ),
         SizedBox(height: 15,),
         ElevatedButton(child: Text("Log In"),
          onPressed: () => _show(context),
        // onPressed: (){
           /*
           if(_formKey.currentState.validate()){
             scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Data is storeed")));
           }
           */
        // }
         ),
         SizedBox(height: 50,),
                          AnimatedContainer(
	
                duration: const Duration(seconds: 2),
	
                color: _isInitialValue ? Colors.blue : Colors.red,
	
                width: _isInitialValue ? 150 : 50,
	
                height: _isInitialValue ? 100 : 50,
	
                alignment: _isInitialValue ? Alignment(-1.0, -1.0) : Alignment(1.0, 1.0),
	
                padding: EdgeInsets.all(_isInitialValue ? 0 : 20),
	
  //              decoration: BoxDecoration(
	
  //                color: _isInitialValue ? Colors.blue : Colors.red,
	
  //                border: Border.all(width: _isInitialValue ? 0 : 10),
	
  //              ),
	
                foregroundDecoration: BoxDecoration(
	
                  color: _isInitialValue ? Colors.blue : Colors.red,
	
                  border: Border.all(width: _isInitialValue ? 0 : 10),
	
                ),
	
                constraints: BoxConstraints(
	
                  maxWidth: _isInitialValue ? 100 : 50,
	
                  maxHeight: _isInitialValue ? 100 : 50,
	
                ),
	
	
                curve: Curves.bounceInOut,
	
                child: const SizedBox(width: 100, height: 100),
	
                onEnd: () {
	
                  print('Animation ends');
	
                },
	
              ),
                            OutlinedButton(
	
                child: const Text('Change value'),
	
                onPressed: () {
	
                  setState(() {
	
                    _isInitialValue = !_isInitialValue;
	
                  });
	
                },
	
              ),
            ],
          ),

        ), 
      
      ),

    );
      
    
  }
}