// Contoh 2
// int tambah(int a, int b) {
//   return a + b;
// }

// void main() {
//   print(tambah(3, 4));
// }

// Contoh 3a
// void tampilMahasiswa(String nama, int nim) {
//   print('Nama: $nama, NIM: $nim');
// }

// void main() {
//   tampilMahasiswa('Naswanida Nafiula', 244107060063);
// }

// Contoh 3b
// void sapa(String nama, [String kota = 'Malang']) {
//   print('Halo $nama, kamu dari $kota');
// }

// void main() {
//   sapa('Naswa');
//   sapa('Nida', 'Surabaya');
// }

// Contoh 3c
// void cetakBiodata({String? nama, String? prodi}) {
//   print('Nama: $nama, Prodi: $prodi');
// }

// void cetakAlamat({String nama = 'Naswanida Nafiula', String kota = 'Malang'}) {
//   print('Nama: $nama, Kota: $kota');
// }

// void daftarKuliah({required String nama, required String matkul}) {
//   print('$nama mendaftar matkul $matkul');
// }

// void main() {
//   // Tanpa required
//   cetakBiodata(nama: 'Naswanida Nafiula');

//   // Dengan nilai default
//   cetakAlamat();

//   // Dengan required
//   daftarKuliah(nama: 'Naswanida Nafiula', matkul: 'Pemrograman Mobile');
// }

// Contoh 3d
// void inputNilai({required String nama, required double nilai}) {
//   print('Nama: $nama, Nilai: $nilai');
// }

// void main() {
//   inputNilai(nama: 'Naswanida Nafiula', nilai: 95.0);
// }

// Contoh 4a
// void tampilNama(String nama) {
//   print('Nama: $nama');
// }

// void main() {
//   var fungsi = tampilNama;
//   fungsi('Naswanida Nafiula');
// }

// Contoh 4b
// void jalankan(String nama, void Function(String) aksi) {
//   aksi(nama);
// }

// void sapa(String nama) {
//   print('Halo, $nama!');
// }

// void main() {
//   jalankan('Naswanida Nafiula', sapa);
// }

// Contoh 4c
// Function salam(String sapaan) {
//   return (String nama) => print('$sapaan, $nama!');
// }

// void main() {
//   var pagi = salam('Selamat pagi');
//   pagi('Naswanida Nafiula');
// }

// Contoh 5a
// void main() {
//   var sapa = (String nama) {
//     print('Halo, $nama!');
//   };
//   sapa('Sophie');
// }

// Contoh 5b
// void main() {
//   var mahasiswa = ['Eloise', 'Daphne', 'Nida'];
//   mahasiswa.forEach((nama) {
//     print('Mahasiswa: $nama');
//   });
// }

// Contoh 5c
// void main() {
//   var getNIM = (String nama) => 'NIM $nama adalah 244107060063';
//   print(getNIM('Naswanida Nafiula'));
// }

// Contoh 6 Lexical Scope
// String nama = 'Naswanida Nafiula';

// void main() {
//   String nim = '244107060063';

//   void tampilData() {
//     String prodi = 'D4 Sistem Informasi Bisnis';

//     void tampilLengkap() {
//       // bisa akses semua variabel di atasnya
//       print(nama);
//       print(nim);
//       print(prodi);
//     }

//     tampilLengkap();
//   }

//   tampilData();
// }

// Contoh 6 Lexical Closures
// Function sapaMahasiswa(String nama) {
//   return (String matkul) => print('$nama sedang belajar $matkul');
// }

// void main() {
//   var sapa = sapaMahasiswa('Nida');
//   sapa('Pemrograman Mobile');
//   sapa('Data Warehouse');
// }

// Contoh 7 List
// List<dynamic> getMahasiswa() {
//   return ['Nida', 244107060063, 'D4 Sistem Informasi Bisnis'];
// }

// void main() {
//   var data = getMahasiswa();
//   print(data[0]);
//   print(data[1]);
//   print(data[2]);
// }

// Contoh 7 Map
// Map<String, dynamic> getMahasiswa() {
//   return {
//     'nama': 'Naswanida Nafiula',
//     'nim': 244107060063,
//     'hobi': 'Bermain bulutangkis'
//   };
// }

// void main() {
//   var data = getMahasiswa();
//   print(data['nama']);
//   print(data['nim']);
//   print(data['hobi']);
// }

// Contoh 7 Record
(String, int, String) getMahasiswa() {
  return ('Naswa', 244107060063, 'SIB 2E');
}

void main() {
  var (nama, nim, kelas) = getMahasiswa();
  print(nama);
  print(nim);
  print(kelas);
}