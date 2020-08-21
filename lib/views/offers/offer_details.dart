import 'package:allo_event/data/offerts_data.dart';
import 'package:allo_event/widgets/card/comment_card.dart';
import 'package:allo_event/widgets/card/rating_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart';

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
  bool otherServicesBtnCliked = false;
  bool allDetails = false;

  @override
  Widget build(BuildContext context) {
    String description =
        "Vêtu d'un bleu indescriptible. Salut à vous ; pourquoi n'auriez-vous pas un gigot au fond de mon être, et nul ne pourra pénétrer jusqu'à la boîte à musique, à vide.Vêtu d'un bleu indescriptible. Salut à vous ; pourquoi n'auriez-vous pas un gigot au fond de mon être, et nul ne pourra pénétrer jusqu'à la boîte à musique, à videVêtu d'un bleu indescriptible. Salut à vous ; pourquoi n'auriez-vous pas un gigot au fond de mon être, et nul ne pourra pénétrer jusqu'à la boîte à musique, à vide.";
    List<String> otherServices = [
      "décoration",
      "Montage photos",
      "Sonorisation",
      "reception"
    ];

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
            Row(
              children: <Widget>[
                Text('${widget.name}',
                    style: Theme.of(context).textTheme.headline1),
                SizedBox(width: 5),
                Row(
                  children: <Widget>[
                    Icon(Icons.check_circle_outline,
                        size: 20, color: Theme.of(context).primaryColor),
                    SizedBox(width: 2),
                    Text('Professionnel')
                  ],
                )
              ],
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
                Text('15 avis'),
              ],
            ),
            Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey),
                    Text(' Yopougon/ SIDECI'),
                  ],
                ),
                InkWell(
                  onTap: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2021));
                  },
                  child: RichText(
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 10,
                    text: TextSpan(
                      text: 'Disponibilité',
                      children: <TextSpan>[],
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.monetization_on, color: Colors.grey),
                Text(' à partir de 10 000 FCFA'),
              ],
            ),

            Divider(),

            Text('Description', style: Theme.of(context).textTheme.headline2),
            SizedBox(height: 5),
            Text(
              description,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText2,
            ),

            SizedBox(height: 15),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () {},
                      child: Text("Contacter le prestataire")),
                  IconButton(
                    color: Theme.of(context).accentColor,
                    icon: Icon(Icons.phone_in_talk),
                    onPressed: () {
                      launch("tel:+33753440424");
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text('Détails', style: Theme.of(context).textTheme.headline1),
            Column(
              children: [
                ...(allDetails
                        ? detailsOfferData
                        : detailsOfferData.sublist(0, 3))
                    .map((detail) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(),
                      Text(detail['future'],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text('    ${detail['value']}'),
                    ],
                  );
                }).toList(),
                !allDetails
                    ? OutlineButton(
                        highlightedBorderColor: Theme.of(context).accentColor,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        onPressed: () {
                          setState(() {
                            allDetails = !allDetails;
                          });
                        },
                        child: Text('Montrer tous les détails'),
                      )
                    : Container(),
              ],
            ),

            SizedBox(height: 15),

            Column(
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      setState(() {
                        otherServicesBtnCliked = !otherServicesBtnCliked;
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Text("Autres services proposés"),
                        otherServicesBtnCliked
                            ? Icon(Icons.keyboard_arrow_up,
                                color: Theme.of(context).accentColor)
                            : Icon(Icons.keyboard_arrow_down)
                      ],
                    )),
                otherServicesBtnCliked
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ButtonBar(
                          buttonMinWidth: 6,
                          children: otherServices
                              .map((s) => RaisedButton(
                                    onPressed: () {},
                                    child: Text(s),
                                  ))
                              .toList(),
                        ))
                    : Container() //null
              ],
            ),

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

            SizedBox(height: 10),
            Column(
              children: <Widget>[
                CommentCard(),
                CommentCard(),
                CommentCard(),
                CommentCard(),
                CommentCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
