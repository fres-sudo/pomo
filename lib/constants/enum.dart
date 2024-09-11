enum FetchType { day, month;

  String get type => switch(this) {
    FetchType.month => "month",
    FetchType.day => "day",
  };
}