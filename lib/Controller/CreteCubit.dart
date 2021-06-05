import 'package:bloc_dios/Model/Model.dart';
import 'package:bloc_dios/Network/Network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CreatePostBloc.dart';

class CreatePostCubit extends Cubit<CreatePostState>  {
  CreatePostCubit() : super(CreatePostInit());


  void apiPostCreate(Posting post) async{
    print(post.toJson());
    emit(CreatePostLoading());
    final response = await Network().POST(Network.API_CREATE, Network.paramsCreate(post));
    print(response);
    if (response != null) {
      emit(CreatePostLoaded(isCreated: true));
    } else {
      emit(CreatePostError(error: "Couldn't create post"));
    }
  }
}