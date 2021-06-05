



import 'package:bloc_dios/Controller/CreteCubit.dart';
import 'package:bloc_dios/Model/Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget viewOfCreate(bool isLoading, BuildContext context, TextEditingController titleController, TextEditingController bodyController){
  return Container(
    padding: EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(
                  hintText: "Body",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                Posting  post = Posting(title: titleController.text.toString(), body: bodyController.text.toString(), userId: 1);
                BlocProvider.of<CreatePostCubit>(context).apiPostCreate(post);
              },
              color: Colors.blue,
              child: Text(
                "Create a Post",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),

        isLoading ? Center(
          child: CircularProgressIndicator(),
        ): SizedBox.shrink(),
      ],
    ),
  );
}