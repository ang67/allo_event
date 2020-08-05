import 'package:flutter/material.dart';

class OfferItemView extends StatefulWidget {
  @override
  _OfferItemViewState createState() => _OfferItemViewState();
}

class _OfferItemViewState extends State<OfferItemView> {
  bool addFavorite = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 190,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/services/sono.jpg'),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black, Colors.black12]),
                  ),
                ),
              ),
              Positioned(
                  child: IconButton(
                    icon: addFavorite
                        ? Icon(
                            Icons.favorite_border,
                            color: Colors.white70,
                          )
                        : Icon(
                            Icons.favorite,
                            color: Theme.of(context).accentColor,
                          ),
                    onPressed: () {
                      setState(() {
                        addFavorite = !addFavorite;
                      });
                    },
                  ),
                  right: 0,
                  bottom: 0),
              Positioned(
                child: Text("TSono Pro", style: TextStyle(color: Colors.white)),
                bottom: 15,
                left: 10,
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              Text("Avis:   ", style: TextStyle(color: Colors.green)),
              Text("4,4"),
              Icon(Icons.star, size: 12, color: Colors.yellow[700]),
              SizedBox(width: 120),
              Icon(Icons.comment, size: 20, color: Colors.black38),
              Text(' Commentaires...')
            ],
          ),
          SizedBox(height: 10),
          Text('Description', style: Theme.of(context).textTheme.headline2),
          SizedBox(height: 5),
          Text(
            "Vêtu d'un bleu indescriptible. Salut à vous ; pourquoi n'auriez-vous pas un gigot au fond de mon être, et nul ne pourra pénétrer jusqu'à la boîte à musique, à vide.Vêtu d'un bleu indescriptible. Salut à vous ; pourquoi n'auriez-vous pas un gigot au fond de mon être, et nul ne pourra pénétrer jusqu'à la boîte à musique, à videVêtu d'un bleu indescriptible. Salut à vous ; pourquoi n'auriez-vous pas un gigot au fond de mon être, et nul ne pourra pénétrer jusqu'à la boîte à musique, à vide.",
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
          ),
          SizedBox(height: 5),
          Center(
            child: RaisedButton(
                color: Theme.of(context).accentColor,
                onPressed: () {},
                child: Text("Contacter le prestataire")),
          )
        ],
      ),
    );
  }
}
