Map<String, int> getIDLimitsByGeneration(int generationNumber) {
  switch (generationNumber) {
    case 1:
      return {'from': 0, 'to': 150};
    case 2:
      return {'from': 151, 'to': 250};
    case 3:
      return {'from': 251, 'to': 385};
    case 4:
      return {'from': 386, 'to': 492};
    case 5:
      return {'from': 493, 'to': 648};
    case 6:
      return {'from': 649, 'to': 720};
    case 7:
      return {'from': 721, 'to': 808};
    case 8:
      return {'from': 809, 'to': 897};
    default:
      throw ArgumentError('Invalid generation number');
  }
}
