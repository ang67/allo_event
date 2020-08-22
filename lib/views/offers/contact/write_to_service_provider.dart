import 'package:flutter/material.dart';

class WriteToServiceProvider extends StatefulWidget {
  final String name;

  const WriteToServiceProvider({Key key, this.name}) : super(key: key);
  @override
  _WriteToServiceProviderState createState() => _WriteToServiceProviderState();
}

class _WriteToServiceProviderState extends State<WriteToServiceProvider> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';

  String telephone = '';
  String firstname = '';

  String error = '';
  bool _termsChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Plus d'information ?",
        ),
      ),
      body: ListView(
        children: <Widget>[
          RichText(
              text: TextSpan(
                  text: "Renseignement auprès de ",
                  style: Theme.of(context).textTheme.bodyText1,
                  children: <TextSpan>[
                TextSpan(
                  text: "${widget.name}",
                  style: Theme.of(context).textTheme.headline2,
                )
              ])),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    TextFormField(
                        cursorColor: Theme.of(context).primaryColor,
                        keyboardType: TextInputType.text,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(),
                        decoration: InputDecoration(
                          hintText: ' Prénom...',
                          hintStyle:
                              TextStyle(color: Colors.black38, fontSize: 14),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black38, width: 0.5)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.0)),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Saisir votre prénom' : null,
                        onChanged: (val) {
                          setState(() => firstname = val);
                        }),
                    SizedBox(height: 10.0),
                    TextFormField(
                        cursorColor: Theme.of(context).primaryColor,
                        keyboardType: TextInputType.phone,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(),
                        decoration: InputDecoration(
                          hintText: ' Téléphone...',
                          hintStyle:
                              TextStyle(color: Colors.black38, fontSize: 14),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black38, width: 0.5)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.0)),
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),
                        ),
                        validator: (val) => val.isEmpty
                            ? 'Saisir un numéro de téléphone'
                            : null,
                        onChanged: (val) {
                          setState(() => telephone = val);
                        }),
                    SizedBox(height: 10.0),
                    TextFormField(
                        cursorColor: Theme.of(context).primaryColor,
                        keyboardType: TextInputType.emailAddress,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(),
                        decoration: InputDecoration(
                          hintText: ' Email...',
                          hintStyle:
                              TextStyle(color: Colors.black38, fontSize: 14),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black38, width: 0.5)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.0)),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Saisir un email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        }),
                    SizedBox(height: 10.0),
                    Center(
                        child: Text("Votre message :",
                            style: Theme.of(context).textTheme.headline2)),
                    TextFormField(
                        cursorColor: Theme.of(context).primaryColor,
                        keyboardType: TextInputType.text,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(),
                        maxLines: 8,
                        decoration: InputDecoration.collapsed(
                          border: OutlineInputBorder(),
                          hintText: ' Message...',
                          hintStyle:
                              TextStyle(color: Colors.black38, fontSize: 14),
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Saisir votre message' : null,
                        onChanged: (val) {
                          setState(() => firstname = val);
                        }),
                    SizedBox(height: 10.0),
                    CheckboxListTile(
                        value: _termsChecked,
                        title: Text(
                            "Je suis d'accord avec les termes et les conditions"),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (value) {
                          setState(() => _termsChecked = value);
                        }),
                    Text('$error',
                        style: TextStyle(color: Theme.of(context).errorColor)),
                    SizedBox(height: 5.0),
                    RaisedButton(
                        disabledElevation: 1.0,
                        onPressed: !_termsChecked
                            ? null
                            : () {
                                if (_formKey.currentState.validate()) {
                                  print('Message envoyé !');
                                  _formKey.currentState.reset();
                                  Navigator.pop(
                                    context,
                                  );
                                }
                              },
                        disabledColor: Colors.white70,
                        color: Theme.of(context).accentColor,
                        child: Text("Envoyer")),
                    SizedBox(height: 15.0),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
