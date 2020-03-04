import 'dart:convert';
import 'dart:io';

import 'package:census/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:census/widgets/customTF.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final _user = User();

  Future<http.Response> _signin(BuildContext context, User user) async{
    final http.Response response = await http.post("http://a110aa08.ngrok.io/login",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
//        HttpHeaders.authorizationHeader: 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkYW4iLCJleHAiOjE1ODQxNDYwMjh9.lCGmkiRMU1GR218Q3-DShjBXXTeboiwExZ-buw52iVsHhOF-SOhO7UZFM08o09T1KwcTLxKepybWB5lrOB3ixw'
      },
      body: jsonEncode(<String,String>{
        'username': user.username,
        'password':user.password,

      }),
    );
    if( response.statusCode == 200) {
      Navigator.pushNamed(context,'/home');
    }else{
      _showDialog(context, Text('Invalid Credentials'));
    }
  }

  _showDialog(BuildContext context, Text text) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: text));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/sigin1.png"),
              fit: BoxFit.cover,
            )
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Container(
            height: double.infinity,
            child: SingleChildScrollView(
//              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 90.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Welcome         Back",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                  SizedBox(
                    height: 100
                  ),
                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.star
                    children: <Widget>[
                      Container(
                        child: Builder(
                          builder: (context) => Form(
                              key: _formkey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  TextFormField(
                                    decoration:
                                    InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                        labelText: 'Username'),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter your username';
                                      }
                                    },
                                    onSaved: (val) =>
                                        setState(() => _user.username = val),
                                  ),
                                  SizedBox(height: 10.0,),
                                  TextFormField(
                                    decoration:
                                    InputDecoration(
                                      prefixIcon: Icon(Icons.lock),
                                        labelText: 'Password'),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter your first name';
                                      }
                                    },
                                    onSaved: (val) =>
                                        setState(() => _user.password = val),
                                  ),

                                  Container(
//                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(vertical: 30),
                                      child: Row(

                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("Sign In",
                                            style: TextStyle(
                                                fontSize: 40.0,
                                                fontWeight: FontWeight.w300
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              final form = _formkey.currentState;
                                              if (form.validate()) {
                                                form.save();
                                                print(_user);
                                                _showDialog(context, Text('Authenticating'));
                                                _signin(context, _user);
                                              }
                                            },
                                            child: Container(
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black,
                                                boxShadow: [],
                                              ),
                                              child: Icon( Icons.arrow_forward,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                  )
                                ],
                              )),
                        ),
                      ),
                      GestureDetector(
                          onTap: () => Navigator.pushNamed(context,'/register'),
                          child: Container(
                            height: 30.0,
                            alignment: Alignment.bottomLeft,
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Don't have an account ? ",
                                    ),
                                    TextSpan(
                                        text: "   Sign Up",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400
                                        )
                                    )
                                  ]
                              ),
                            ),
                          )
                      ),

                    ],
                  )
                ],
              ),
            ),
          )
        )
      ],

    );
  }
}