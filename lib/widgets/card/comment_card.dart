import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CommentCard extends StatefulWidget {
  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  String comment =
      "Vêtu d'un bleu indescriptible. Salut à vous ; pourquoi n'auriez-vous pas un gigot au fond de mon être, et nul ne pourra pénétrer jusqu'à la boîte à musique, à vide.Vêtu d'un bleu indescriptible. Salut à vous ; pourquoi n'auriez-vous pas un gigot au fond de mon être, et nul ne pourra pénétrer jusqu'à la boîte à musique, à videVêtu d'un bleu indescriptible. Salut à vous ; pourquoi n'auriez-vous pas un gigot au fond de mon être, et nul ne pourra pénétrer jusqu'à la boîte à musique, à vide.";
  bool liked = false;
  int numberOfLike = 24;
  bool descTextShowFlag = false;
  @override
  Widget build(BuildContext context) {
    final leftSection = Container(
      child: CircleAvatar(child: Icon(Icons.person)),
    );

    final middleSection = Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "George Boya",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                SmoothStarRating(
                  rating: 4.4,
                  isReadOnly: true,
                  size: 15,
                  color: Colors.amber,
                  borderColor: Colors.amber[400],
                  filledIconData: Icons.star,
                  halfFilledIconData: Icons.star_half,
                  defaultIconData: Icons.star_border,
                  starCount: 5,
                  allowHalfRating: true,
                  spacing: 2.0,
                ),
                SizedBox(width: 5),
                Text('14 août 2020')
              ],
            ),
          ],
        ),
      ),
    );

    final rightSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.thumb_up,
                    color: liked ? Colors.grey[800] : Colors.grey,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        if (liked == false) {
                          liked = true;
                          numberOfLike++;
                        }
                      },
                    );
                  }),
              Positioned(bottom: 0, right: 17, child: Text('$numberOfLike'))
            ],
          ),
          PopupMenuButton(onSelected: (x) {
            if (x == 1) {
              setState(() {
                if (liked == true) {
                  liked = false;
                  numberOfLike--;
                }
              });
            }
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                  value: 0,
                  height: 50,
                  child: ListTile(
                    //leading: Icon(Icons.help_outline),
                    title: Text("Historique des modifications"),
                    onTap: null,
                  )),
              PopupMenuItem(
                value: 1,
                child: InkWell(
                  onTap: null,
                  child: ListTile(
                    //leading: Icon(Icons.info_outline),
                    title: Text('unitile'),
                    onTap: null,
                  ),
                ),
              ),
              PopupMenuItem(
                  value: 2,
                  height: 50,
                  child: ListTile(
                    //leading: Icon(Icons.help_outline),
                    title: Text('Signaler'),
                    onTap: null,
                  )),
            ];
          }),
        ],
      ),
    );
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[leftSection, middleSection, rightSection]),
          Column(
            children: <Widget>[
              Text(comment,
                  maxLines: descTextShowFlag ? null : 4,
                  textAlign: TextAlign.justify),
              InkWell(
                onTap: () {
                  setState(() {
                    descTextShowFlag = !descTextShowFlag;
                  });
                },
                child: descTextShowFlag
                    ? Icon(Icons.keyboard_arrow_up,
                        color: Theme.of(context).accentColor)
                    : Icon(Icons.keyboard_arrow_down, color: Colors.grey[400]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
