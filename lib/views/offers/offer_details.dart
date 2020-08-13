import 'package:allo_event/widgets/card/rating_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class OfferDetailsView extends StatefulWidget {
  final String name;

  const OfferDetailsView({Key key, this.name}) : super(key: key);
  @override
  _OfferDetailsViewState createState() => _OfferDetailsViewState();
}

class _OfferDetailsViewState extends State<OfferDetailsView> {
  List<String> images = [
    "assets/images/events/mariage.jpg",
    "assets/images/events/concert.jpg",
    "assets/images/events/gala.jpg",
    "assets/images/events/anniversaire.png",
    "assets/images/events/autre.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    String description =
        "Vêtu d'un bleu indescriptible. Salut à vous ; pourquoi n'auriez-vous pas un gigot au fond de mon être, et nul ne pourra pénétrer jusqu'à la boîte à musique, à vide.Vêtu d'un bleu indescriptible. Salut à vous ; pourquoi n'auriez-vous pas un gigot au fond de mon être, et nul ne pourra pénétrer jusqu'à la boîte à musique, à videVêtu d'un bleu indescriptible. Salut à vous ; pourquoi n'auriez-vous pas un gigot au fond de mon être, et nul ne pourra pénétrer jusqu'à la boîte à musique, à vide.";

    return Scaffold(
      appBar: AppBar(title: Text('Détails')),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  );
                },
                autoplay: false,
                itemCount: images.length,
                itemWidth: 500,
                itemHeight: 400.0,
                layout: SwiperLayout.TINDER,
                scrollDirection: Axis.horizontal,
                pagination: new SwiperPagination(
                    margin: EdgeInsets.only(right: 20),
                    alignment: Alignment.bottomRight,
                    builder: SwiperPagination.fraction),
              ),
            ),
            SizedBox(height: 5),
            Center(
                child: Text('${widget.name}',
                    style: Theme.of(context).textTheme.headline1)),
            SizedBox(height: 10),
            Text('Description', style: Theme.of(context).textTheme.headline2),
            SizedBox(height: 5),
            Text(
              description,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText2,
            ),

            SizedBox(height: 15),
            Center(
              child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return null;
                    }));
                  },
                  child: Text("Contacter le prestataire")),
            ),
            SizedBox(height: 15),
            Divider(
              indent: 15,
              endIndent: 15,
            ),
            Center(
              child: Text('Avis et Commentaires',
                  style: Theme.of(context).textTheme.headline1),
            ),
            SizedBox(height: 10),
            //avis rating...
            RatingCard(),

            SizedBox(height: 80)
            // list des commentaires...
          ],
        ),
      ),
    );
  }
}
