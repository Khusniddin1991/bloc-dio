import 'package:bloc_dios/Model/Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Itemofposts.dart';

Widget viewOfHome(List<Posting> items, bool isLoading) {
  return Stack(
    children: [
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return itemOfPost(ctx, items[index]);
        },
      ),
      isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SizedBox.shrink(),
    ],
  );
}