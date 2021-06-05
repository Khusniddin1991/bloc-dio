
import 'package:bloc_dios/Model/Model.dart';
import 'package:bloc_dios/Network/Network.dart';
import 'package:bloc_dios/Pages/CreatePage.dart';
import 'package:bloc_dios/Pages/UpdatePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lispostState.dart';

class ListPostCubit extends Cubit<ListPostsState>{
  ListPostCubit() : super(ListPostInit());
  void apiPostList() async {
    emit(ListPostLoading());
    final response = await Network().GET(Network.API_LIST);
    if(response!=null){
      emit(ListPostLoaded(posts: response));
    }else{
      emit(ListPostError(error: "something is not right here"));
    }
  }


  void apiPostDelete(Posting post) async {
    emit(ListPostLoading());
    final response = await Network.DEL(
        Network.API_DELETE + post.id.toString());
    print(response);
    if (response != null) {
      apiPostList();
    } else {
      emit(ListPostError(error: "Couldn't delete post"));
    }
  }

  void callCreatePage(BuildContext context) async {
    var results = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CreatePage()));
    if (results != null) {
      BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
  }
  void callUpdatePage(BuildContext context,Posting post) async {
    print(post.toJson());
    var results = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UpdatePage(
          post: post,
        )));
    if (results != null) {
      BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
  }

}