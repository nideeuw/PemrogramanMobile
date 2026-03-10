void main() {
  final list = List<dynamic>.filled(5, null);
  assert(list.length == 5);
  assert(list[1] == null);
  print(list.length);
  print(list[1]);

  list[1] = 'Naswanida Nafiula';
  list[2] = '244107060063';
  assert(list[1] == 'Naswanida Nafiula');
  assert(list[2] == '244107060063');
  print(list[1]);
  print(list[2]);
}