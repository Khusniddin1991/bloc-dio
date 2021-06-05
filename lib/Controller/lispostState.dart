import 'package:bloc_dios/Model/Model.dart';
import 'package:equatable/equatable.dart';

abstract class ListPostsState extends  Equatable{



  List<Object> get  props=>[];

}

class ListPostInit extends ListPostsState{

}
class ListPostLoading extends ListPostsState{
  String wait;
  ListPostLoading({this.wait});
}
class ListPostLoaded extends ListPostsState{
  final List<Posting> posts;
  final bool delated;

  ListPostLoaded({this.posts,this.delated});


}
class ListPostError extends ListPostsState{
  final error;
  ListPostError({this.error});

}