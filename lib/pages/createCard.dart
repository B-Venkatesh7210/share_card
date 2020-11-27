import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_card/model/UserModel.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:image_picker/image_picker.dart';

class CreateCard extends StatefulWidget {
  @override
  _CreateCardState createState() => _CreateCardState();
}

class _CreateCardState extends State<CreateCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController webController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  File _image;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.blue500,
        leadingWidth: 10,
        title: "Add info".text.semiBold.size(20).white.make(),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: VStack([
          GestureDetector(
            onTap: (){
              showDialog(context:context,builder: (context){
                return Dialog(
                  child: HStack([
                    FlatButton(
                      onPressed:() async{
                        final pickedFile = await picker.getImage(source: ImageSource.camera);
                        setState(() {
                          if (pickedFile != null) {
                            _image = File(pickedFile.path);
                          } else {
                            print('No image selected.');
                          }
                        });
                      },
                      child:"Camera".text.white.semiBold.size(16).make(),
                      color:Colors.blue
                    ),
                    10.widthBox,
                    FlatButton(
                      onPressed:() async{
                        final pickedFile = await picker.getImage(source: ImageSource.gallery);
                        setState(() {
                          if (pickedFile != null) {
                            _image = File(pickedFile.path);
                          } else {
                            print('No image selected.');
                          }
                        });
                      },
                      child:"Gallery".text.white.semiBold.size(16).make(),
                      color:Colors.blue
                    ),
                  ],alignment: MainAxisAlignment.center,),
                );
              });
            },
            child:_image==null? CircleAvatar(
              child:Icon(Icons.person,color:Vx.blue700,size:50),
              radius: 50,
              backgroundColor: Vx.blue200,
            ).centered():Image.file(_image,fit: BoxFit.cover,width: context.percentWidth*50).centered(),
          ),
          20.heightBox,
          TextFormField(
            controller: nameController,
            validator: (v)=>v.trim().length<2?" Enter valid name":null,
            decoration: InputDecoration(
              hintText: "Name",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Vx.gray700,
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Vx.gray700,
                  width: 1,
                ),
              ),
            )
          ).w(double.infinity).h(50),
          10.heightBox,
          TextFormField(
            controller: emailController,
            validator: (value){
              {
                Pattern pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regex = new RegExp(pattern);
                if (!regex.hasMatch(value))
                  return 'Enter Valid Email';
                else
                  return null;
              }
            },
            decoration: InputDecoration(
              hintText: "Email",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Vx.gray700,
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Vx.gray700,
                  width: 1,
                ),
              ),
            )
          ).w(double.infinity).h(50),
          10.heightBox,
          TextFormField(
            controller: companyNameController,
            validator: (v)=>v.trim().length<2?" Enter valid name":null,
            decoration: InputDecoration(
              hintText: "Company name",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Vx.gray700,
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Vx.gray700,
                  width: 1,
                ),
              ),
            )
          ).w(double.infinity).h(50),
          10.heightBox,
          TextFormField(
            controller: locationController,
            validator: (v)=>v.trim().length<2?" Enter valid location":null,
            decoration: InputDecoration(
              hintText: "Location",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Vx.gray700,
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Vx.gray700,
                  width: 1,
                ),
              ),
            )
          ).w(double.infinity).h(50),
          10.heightBox,
          TextFormField(
            controller: webController,
            validator: (v)=>v.trim().length<2?" Enter valid website":null,
            decoration: InputDecoration(
              hintText: "Website",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Vx.gray700,
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Vx.gray700,
                  width: 1,
                ),
              ),
            )
          ).w(double.infinity).h(50),
          10.heightBox,
          TextFormField(
            controller: positionController,
            validator: (v)=>v.trim().length<1?" Enter valid position":null,
            decoration: InputDecoration(
              hintText: "Position",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Vx.gray700,
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Vx.gray700,
                  width: 1,
                ),
              ),
            )
          ).w(double.infinity).h(50),
          10.heightBox,
          TextFormField(
            decoration: InputDecoration(
              hintText: "Specialization",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Vx.gray700,
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Vx.gray700,
                  width: 1,
                ),
              ),
            )
          ).w(double.infinity).h(50),
          15.heightBox,
          FlatButton(
            onPressed: (){
            },
            child: "Save info".text.size(22).semiBold.white.make().py12(),
            color: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
          ).w(double.infinity),
        ]).p20().scrollVertical(),
      ),
    );
  }
}