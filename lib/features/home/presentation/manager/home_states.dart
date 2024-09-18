

 class HomeStates{}
 class LoadingState extends HomeStates {}

 class HomeInitial extends HomeStates {}
 class ChangedIndex extends HomeStates {}

  class GetHistoricalCharactersLoading extends LoadingState {}
  class GetHistoricalCharactersSuccess extends HomeStates {
    final List characters;
    GetHistoricalCharactersSuccess(this.characters);
  }
  class GetHistoricalCharactersError extends HomeStates {
    final String error;
    GetHistoricalCharactersError(this.error);
  }

  class GetHistoricalSouvenirsLoading extends LoadingState {}
  class GetHistoricalSouvenirsSuccess extends HomeStates {
    final List souvenirs;
    GetHistoricalSouvenirsSuccess(this.souvenirs);
  }
  class GetHistoricalSouvenirsError extends HomeStates {
    final String error;
    GetHistoricalSouvenirsError(this.error);
  }

