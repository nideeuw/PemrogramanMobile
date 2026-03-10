(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

void main() {
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  var tukarRecord = tukar((4, 5));
  print(tukarRecord);

  // Record type annotation in a variable declaration:
  (String, int) mahasiswa = ('Naswanida Nafiula', 244107060063);
  print(mahasiswa);

  var mahasiswa2 = ('Naswanida Nafiula', a: 2, b: true, '244107060063');

  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}