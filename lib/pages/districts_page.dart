import 'package:bloc_example/blocs/bloc_provider.dart';
import 'package:bloc_example/blocs/districts_bloc.dart';
import 'package:bloc_example/models/districts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DistrictsPage extends StatefulWidget {
  final String title;

  DistrictsPage({this.title});

  @override
  DistrictsPageState createState() {
    return new DistrictsPageState();
  }
}

class DistrictsPageState extends State<DistrictsPage> {
    final DistrictsBloc _districtsBloc = DistrictsBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder(
          bloc: _districtsBloc,
          builder: (BuildContext context, DistrictState state) {
            if (state is DistrictsLoaded) {
              return Center(
                  child: ListView.builder(
                      itemCount: state.totalDistricts,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('${state.districts.districts[index].name}'),
                        );
                      }));
            }
            if(state is DistrictsLoading) {
              return Center(
                child: Text(DistrictsLoading().toString()),
              );
            }

            if(state is DistrictsEmpty) {
              return Center(
                child: Text(DistrictsEmpty().toString()),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(onPressed: () => _districtsBloc.dispatch(Fetch())),
    );
  }
}
