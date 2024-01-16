import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CategoryModel{
  final String tvTitle;
  int type =0;

  CategoryModel(this.tvTitle,this.type);
}

List<CategoryModel>modelArrayList = [];