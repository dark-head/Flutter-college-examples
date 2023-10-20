import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test/model/articles.dart';

class ClassAndModules {
  //widgets eg dialog box, toast, cards, error handleling
  //

  static String formatDateTimestring(String date) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime format = (dateFormat.parse(date));
    DateFormat longdate = DateFormat("MMM dd, yyyy");
    date = longdate.format(format);
    return date;
  }

  static verticallistitem(var size, Articles article) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //stack
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        article.urlToImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
                      left: 85,
                      top: 60,
                      child: Icon(
                        Icons.play_circle,
                        color: Colors.white,
                        size: 30,
                      ))
                ],
              )
            ],
          ),
          // text
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width / 2,
                child: Text(
                  article.title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black),
                  maxLines: 2,
                ),
              ),
              //row
              // button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      article.author!,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      formatDateTimestring(article.publishedAt!),
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  )
                ],
              )
              // tex
            ],
          )
        ],
      ),
    );
  }
}
