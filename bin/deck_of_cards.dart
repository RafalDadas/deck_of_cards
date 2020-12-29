void main() {
  var deck = Deck();
  print(deck);
}

class Deck {
  List<Card> cards = [];

  Deck() {
    var ranks = <String>[
      'Ace',
      'Two',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine',
      'Ten',
      'Jack',
      'Queen',
      'King',
    ];
    var suits = <String>[
      'Diamonds',
      'Hearts',
      'Clubs',
      'Spades',
    ];

    for (var suit in suits) {
      for (var rank in ranks) {
        var card = Card(
            suit: suit,
            rank: rank,
        );
        cards.add(card);
      }
    }
  }

  void shuffle() {
    cards.shuffle();
  }

  Iterable<Card> cardsWithSuit(String suit) {
    return cards.where((card) => card.suit == suit);
  }

  List<Card> deal(int handSize) {
    var hand = cards.sublist(0, handSize);
    cards = cards.sublist(handSize);

    return hand;
  }

  void removeCard(String suit, String rank) {
    cards.removeWhere((card) => card.suit == suit && card.rank == rank);
  }

  @override
  String toString() {
    return cards.toString();
  }
}

class Card {
  String suit;
  String rank;

  Card({this.suit, this.rank});

  @override
  String toString() {
    return '$rank of $suit';
  }
}
