void main() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
  };

  var nobleGases = {2: 'helium', 10: 'neon', 18: 2};

  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';
  gifts['nama'] = 'Naswanida Nafiula';
  gifts['nim'] = '244107060063';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';
  nobleGases[19] = 'Naswanida Nafiula';
  nobleGases[20] = '244107060063';

  mhs1['nama'] = 'Naswanida Nafiula';
  mhs1['nim'] = '244107060063';

  mhs2[1] = 'Naswanida Nafiula';
  mhs2[2] = '244107060063';

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}