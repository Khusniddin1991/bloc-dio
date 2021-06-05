import 'package:bloc_dios/Controller/UpdateCubit.dart';
import 'package:bloc_dios/Controller/UpdatePost.dart';
import 'package:bloc_dios/Model/Model.dart';
import 'package:bloc_dios/View/UpdatePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePage extends StatelessWidget {
  Posting post;

  UpdatePage({this.post});

  TextEditingController titleController = new TextEditingController();
  TextEditingController bodyController = new TextEditingController();

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    titleController.text = post.title;
    bodyController.text = post.body;

    return BlocProvider(
      create: (context) => UpdatePostCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Update a Post"),
        ),
        body: BlocBuilder<UpdatePostCubit, UpdatePostState>(
          builder: (BuildContext context, UpdatePostState state) {
            if(state is UpdatePostLoading){
              String title = titleController.text.toString();
              String body = bodyController.text.toString();
              Posting post = Posting(id: this.post.id,title: title, body: body, userId: this.post.userId);
              return viewOfUpdate(true,context,post, titleController, bodyController);
            }
            if(state is UpdatePostLoaded){
              _finish(context);
            }
            if(state is UpdatePostError){

            }
            return viewOfUpdate(false,context,post, titleController, bodyController);
          },
        ),
      ),
    );
  }

}