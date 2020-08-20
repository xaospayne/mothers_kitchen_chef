import 'package:flutter/material.dart';
import 'package:mothers_kitchen_chef/services/auth_service.dart';
import 'package:mothers_kitchen_chef/widgets/loading_spinner.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading ? LoadingSpinner() :Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: size.width,
              height: size.height,
              child: Image.asset('images/chef_bg.jpg',fit: BoxFit.cover,),
            ),
            Container(
              height: size.height,
              width: size.width,
              color:  Colors.black.withAlpha(200),),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 100.0,),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30.0),
                    Text(
                      'Mothers Kitchen',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 30.0,
                        fontFamily: 'MomsFonts',
                        fontWeight: FontWeight.bold,)
                      ,),
                    SizedBox(height: 30.0),
                    Text('Home Chef',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20.0,
                        fontFamily: 'MomsFonts',
                        fontWeight: FontWeight.bold,),),
                    SizedBox(height: 50.0),
                    Text('Register',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20.0,
                        fontFamily: 'MomsFonts',
                      ),),
                    SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) { if (val.isEmpty || !val.contains('@'))  {return
                        'Please Enter A Valid Email';} return null;},
                      style: TextStyle(color: Colors.white, fontFamily: 'OpenSans',),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: 'Email',labelStyle: TextStyle(color: Colors.white, fontFamily: 'OpenSans',),
                        hintText: 'username@xyz.com',hintStyle: TextStyle(color: Colors.white, fontFamily: 'OpenSans',),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(color:Colors.orange,width: 2.0,),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(color:Colors.white.withAlpha(900),width: 2.0,),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(color:Colors.red,width: 2.0,),
                        ),
                      ),
                      onChanged: (val){setState(() {email = val;});},
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      validator: (val) {if (val.isEmpty || val.length < 7) {
                        return 'Please enter a valid 7 character password';} return null;},
                      obscureText: true,
                      style: TextStyle(color: Colors.white, fontFamily: 'OpenSans',),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: 'Password',labelStyle: TextStyle(color: Colors.white, fontFamily: 'OpenSans',),
                        hintText: 'Password',hintStyle: TextStyle(color: Colors.white, fontFamily: 'OpenSans',),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(color:Colors.orange,width: 2.0,),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(color:Colors.white.withAlpha(900),width: 2.0,),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(color:Colors.red,width: 2.0,),
                        ),
                      ),
                      onChanged: (val){password = val;},
                    ),
                    SizedBox(height: 20,),
                    RaisedButton(
                        onPressed: ()async{
                          if (_formKey.currentState.validate()){
                            setState(() {
                              loading = true;
                            });
                            dynamic result =  await _auth.registerWithEmailAndPassword(email, password);
                            if( result == null){
                              setState(() {
                                error ='Error Registering ';
                                loading = false;
                              });
                            }                     }
                        },
                      elevation: 5.0,
                      padding: EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      color: Colors.white,
                      child: Text('Register',style: TextStyle(
                      color: Colors.orange,
                          letterSpacing: 1,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                      ),),

                    ),
                    SizedBox(height: 12,),
                    Text(error, style: TextStyle(color: Colors.red, fontSize: 14),),
                    Container(
                      child: FlatButton.icon(
                          onPressed: (){
                            widget.toggleView();
                          },
                          icon: Icon(Icons.person,color: Colors.orange,),
                        label: Text('Login',style: TextStyle(color: Colors.white, fontSize: 14),)),

                    )
                  ],
                ),
              ),
            ),



          ],
        )
        ),
    );
  }
}


