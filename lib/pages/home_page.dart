import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:space_person/shared_state/number_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    NumberInSpaceBloc spaceBloc = Provider.of<NumberInSpaceBloc>(context);

    spaceBloc.dispatch(NumberInSpaceEvent());

    return Scaffold(
      body: Center(
        child: BlocBuilder(
          bloc: spaceBloc,
          builder: (context, NumberInSpaceState state) {
            if (state.loading) {
              return CircularProgressIndicator();
            } else if (state.errorLoading != null) {
              return Text(
                state.errorLoading,
                style: TextStyle(color: Colors.red),
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "${state.numberInSpace}",
                            style: Theme.of(context).textTheme.display4,
                          ),
                          Text("People in Space Right Now"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: ListView.builder(
                      itemCount: state.numberInSpace,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.peopleInSpace[index].name),
                          subtitle: Text(state.peopleInSpace[index].craft),
                        );
                      },
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
