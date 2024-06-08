enum FromWho {mine, theirs}

class Message{
  final String text;
  final String? imageURL;
  final FromWho fromWho;

  //CONSTRUCTOR
  Message({
    required this.text,
    this.imageURL,
    required this.fromWho,
  });

  
}