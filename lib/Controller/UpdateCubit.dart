import 'package:bloc_dios/Model/Model.dart';
import 'package:bloc_dios/Network/Network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UpdatePost.dart';

class UpdatePostCubit extends Cubit<UpdatePostState>  {
  UpdatePostCubit() : super(UpdatePostInit());


  void apiPostUpdate(Posting post) async{
    post.id = 1;
    print(post.toJson());
    emit(UpdatePostLoading());
    final response = await Network().PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    print(response);
    if (response != null) {
      emit(UpdatePostLoaded(isUpdated: true));
    } else {
      emit(UpdatePostError(error: "Couldn't update post"));
    }
  }
}