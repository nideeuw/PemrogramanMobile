void main() {
  String nama = "Naswanida Nafiula";
  String nim = "244107060063";
  
  for (int i = 0; i <= 201; i++) {
    bool isPrime = true;
    if (i < 2) {
      isPrime = false;
    } else {
      for (int j = 2; j < i; j++) {
        if (i % j == 0) {
          isPrime = false;
          break;
        }
      }
    }
    if (isPrime) {
      print('$i Bilangan Prima ditemukan: $i');
      print('    Nama: $nama | NIM: $nim');
    } else {
      print('$i');
    }
  }
}