

abstract class NewsState{}

class Initalstate extends NewsState{}
class Getfailednews extends NewsState{}
class LoadingNews extends NewsState{}
class FailedNews extends NewsState{}
class SucessNews extends NewsState{}
class Apifailed extends NewsState{
  final String erorr;
  Apifailed(this.erorr);

}

