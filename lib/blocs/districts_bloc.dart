import 'package:rxdart/rxdart.dart';
import 'package:bloc_example/blocs/bloc_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import 'dart:async';
import 'package:bloc_example/repositories/district_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/models/districts.dart';
import 'package:equatable/equatable.dart';


//Event and State Classes
abstract class DistrictEvents extends Equatable {}

abstract class DistrictState extends Equatable {
  DistrictState([List props = const []]) : super(props);
}


//Events
class Fetch extends DistrictEvents {
  @override
  String toString() => 'Fetching Districts';
}

//State
class DistrictsEmpty extends DistrictState {
  @override
  String toString() => 'There are currently no districts';
}

class DistrictsLoading extends DistrictState {
  @override
  String toString() => 'Loading Districts';
}

class DistrictsLoaded extends DistrictState {
  DistrictList districts;
  int totalDistricts;

  DistrictsLoaded({this.districts, this.totalDistricts})
      : super([districts, totalDistricts]);
}

class DistrictsError extends DistrictState {
  @override
  String toString() => 'Woops, something happened';
}

class DistrictsBloc extends Bloc<DistrictEvents, DistrictState> {
  DistrictRepository districtsRepository = DistrictRepository();

  @override
  DistrictState get initialState => DistrictsEmpty();

  @override
  Stream<DistrictState> mapEventToState(DistrictState currentState, DistrictEvents event) async* {
    if(event == Fetch()) {
      yield DistrictsLoading();
      DistrictList districtList =
          await districtsRepository.fetchDistricts();
      yield DistrictsLoaded(
        districts: districtList,
        totalDistricts: districtList.districts.length
      );
    }
  }

}

























//class DistrictsBloc implements BlocBase {
//
//  //Streams
//  BehaviorSubject<DistrictList> _districtsController =
//      BehaviorSubject<DistrictList>();
//
//  Sink<DistrictList> get _inDistricts => _districtsController.sink;
//
//  Stream<DistrictList> get outDistricts => _districtsController.stream;
//
//  PublishSubject<String> _districtEventController = PublishSubject<String>();
//
//  Sink<String> get getDistricts => _districtEventController.sink;
//
//  //Constructor
//  DistrictsBloc() {
//    districtsRepository.fetchDistricts().then((districts) {
//      _inDistricts.add(districts);
//    });
//
//    _districtEventController.listen((data) async {
//      DistrictList updated =
//          await districtsRepository.fetchDistricts(updated: true);
//      _inDistricts.add(updated);
//    });
//  }
//
//  @override
//  void dispose() {
//    _districtsController.close();
//    _districtEventController.close();
//  }
