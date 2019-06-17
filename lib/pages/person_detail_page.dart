import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_person/shared_state/person_detail_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class PersonDetailPage extends StatefulWidget {
  final String name;
  final String spacecraft;

  PersonDetailPage(this.name, this.spacecraft);

  @override
  _PersonDetailPageState createState() => _PersonDetailPageState();
}

class _PersonDetailPageState extends State<PersonDetailPage> {
  PersonDetailBloc personDetailBloc = PersonDetailBloc();

  @override
  void initState() {
    personDetailBloc
        .dispatch(PersonDetailEvent("${widget.name} ${widget.spacecraft}"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: BlocBuilder(
            bloc: personDetailBloc,
            builder: (context, PersonDetailState state) => ListView(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: state.loading
                                ? Center(child: CircularProgressIndicator())
                                : Image.network(
                                    state.personDetails.thumbnailImage),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Hero(
                                child: Material(child: Text(widget.name)),
                                tag: 'name${widget.name}',
                              ),
                              Hero(
                                child: Material(child: Text(widget.spacecraft)),
                                tag: 'craft${widget.name}',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    state.loading
                        ? Center(child: CircularProgressIndicator())
                        : Html(
                            data: state.personDetails.pageExtract,
                          ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
