# Laporan Praktikum #06 - Layout dan Navigasi

Naswanida Nafiula <br>
SIB 2E / 13 <br>
244107060063 <br>

[Link Repository Praktikum 1-4](https://github.com/nideeuw/layout_flutter.git)

[Link Repository Praktikum 5](https://github.com/nideeuw/belanja.git)

---

## Praktikum 1: Membangun Layout di Flutter
### Langkah 1:
Buatlah sebuah project flutter baru dengan nama **layout_flutter**. Atau sesuaikan style laporan praktikum yang Anda buat.

**Jawab:**

![Langkah 1](img/Praktikum1/Langkah1.png)

### Langkah 2:
Buka file `main.dart` lalu ganti dengan kode berikut. Isi nama dan NIM Anda di `text title`.
```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout: Nama dan NIM Anda',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
```

**Jawab:**

![Langkah 2](img/Praktikum1/Langkah2.png)

### Langkah 3:
Langkah pertama adalah memecah tata letak menjadi elemen dasarnya:

- Identifikasi baris dan kolom.
- Apakah tata letaknya menyertakan kisi-kisi (grid)?
- Apakah ada elemen yang tumpang tindih?
- Apakah UI memerlukan tab?
- Perhatikan area yang memerlukan alignment, padding, atau borders.

Pertama, identifikasi elemen yang lebih besar. Dalam contoh ini, empat elemen disusun menjadi sebuah kolom: sebuah gambar, dua baris, dan satu blok teks.
![Soal Praktikum 3](img/Praktikum1/soalprak3.png)
Selanjutnya, buat diagram setiap baris. Baris pertama, disebut bagian Judul, memiliki 3 anak: kolom teks, ikon bintang, dan angka. Anak pertamanya, kolom, berisi 2 baris teks. Kolom pertama itu memakan banyak ruang, sehingga harus dibungkus dengan widget yang Diperluas.
![Soal Praktikum 3 ke 2](img/Praktikum1/soalprak3ke2.png)
Baris kedua, disebut bagian Tombol, juga memiliki 3 anak: setiap anak merupakan kolom yang berisi ikon dan teks.
![Soal Praktikum 3 ke 3](img/Praktikum1/soalprak3ke3.png)
Setelah tata letak telah dibuat diagramnya, cara termudah adalah dengan menerapkan pendekatan bottom-up. Untuk meminimalkan kebingungan visual dari kode tata letak yang banyak bertumpuk, tempatkan beberapa implementasi dalam variabel dan fungsi.

### Langkah 4:
Pertama, Anda akan membuat kolom bagian kiri pada judul. Tambahkan kode berikut di bagian atas metode build() di dalam kelas `MyApp`:
```dart
Widget titleSection = Container(
  padding: const EdgeInsets.all(...),
  child: Row(
    children: [
      Expanded(
        /* soal 1*/
        child: Column(
          crossAxisAlignment: ...,
          children: [
            /* soal 2*/
            Container(
              padding: const EdgeInsets.only(bottom: ...),
              child: const Text(
                'Wisata Gunung di Batu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Batu, Malang, Indonesia',
              style: TextStyle(...),
            ),
          ],
        ),
      ),
      /* soal 3*/
      Icon(
       ...,
        color: ...,
      ),
      const Text(...),
    ],
  ),
);
```

**soal 1** Letakkan widget `Column` di dalam widget `Expanded` agar menyesuaikan ruang yang tersisa di dalam widget `Row`. Tambahkan properti `crossAxisAlignment` ke `CrossAxisAlignment.start` sehingga posisi kolom berada di awal baris.

**soal 2** Letakkan baris pertama teks di dalam `Container` sehingga memungkinkan Anda untuk menambahkan padding = 8. Teks ‘`Batu, Malang, Indonesia`' di dalam `Column`, set warna menjadi abu-abu.

**soal 3** Dua item terakhir di baris judul adalah ikon bintang, set dengan warna merah, dan teks "41". Seluruh baris ada di dalam `Container` dan beri padding di sepanjang setiap tepinya sebesar 32 piksel. Kemudian ganti isi `body text` `‘Hello World'` dengan variabel `titleSection` seperti berikut:
![Soal Praktikum 4](img/Praktikum1/soalprak4.png)

**Jawab:**

![Langkah 4](img/Praktikum1/Langkah4.png)

---

## Praktikum 2: Implementasi button row
### Langkah 1:
Bagian tombol berisi 3 kolom yang menggunakan tata letak yang sama—sebuah ikon di atas baris teks. Kolom pada baris ini diberi jarak yang sama, dan teks serta ikon diberi warna primer.

Karena kode untuk membangun setiap kolom hampir sama, buatlah metode pembantu pribadi bernama `buildButtonColumn()`, yang mempunyai parameter warna, `Icon` dan `Text`, sehingga dapat mengembalikan kolom dengan widgetnya sesuai dengan warna tertentu.

**lib/main.dart (_buildButtonColumn)**

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ···
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
```

**Jawab:**

![Langkah 1](img/Praktikum2/Langkah1.png)

### Langkah 2:
Buat Fungsi untuk menambahkan ikon langsung ke kolom. Teks berada di dalam `Container` dengan margin hanya di bagian atas, yang memisahkan teks dari ikon.

Bangun baris yang berisi kolom-kolom ini dengan memanggil fungsi dan set warna, `Icon`, dan teks khusus melalui parameter ke kolom tersebut. Sejajarkan kolom di sepanjang sumbu utama menggunakan `MainAxisAlignment.spaceEvenly` untuk mengatur ruang kosong secara merata sebelum, di antara, dan setelah setiap kolom. Tambahkan kode berikut tepat di bawah deklarasi `titleSection` di dalam metode `build()`:

**lib/main.dart (buttonSection)**

```dart
Color color = Theme.of(context).primaryColor;

Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    _buildButtonColumn(color, Icons.call, 'CALL'),
    _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
    _buildButtonColumn(color, Icons.share, 'SHARE'),
  ],
);
```

**Jawab:**

![Langkah 2](img/Praktikum2/Langkah2.png)

### Langkah 3:
Tambahkan variabel `buttonSection` ke dalam `body` seperti berikut:
![Soal Praktikum 3](img/Praktikum2/soalprak3.png)

**Jawab:**

![Langkah 3](img/Praktikum2/Langkah3.png)

---

## Praktikum 3: Implementasi text section
### Langkah 1:
Tentukan bagian teks sebagai variabel. Masukkan teks ke dalam `Container` dan tambahkan padding di sepanjang setiap tepinya. Tambahkan kode berikut tepat di bawah deklarasi `buttonSection`:
```dart
Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: const Text(
    'Carilah teks di internet yang sesuai '
    'dengan foto atau tempat wisata yang ingin '
    'Anda tampilkan. '
    'Tambahkan nama dan NIM Anda sebagai '
    'identitas hasil pekerjaan Anda. '
    'Selamat mengerjakan 🙂.',
    softWrap: true,
  ),
);
```

Dengan memberi nilai `softWrap` = true, baris teks akan memenuhi lebar kolom sebelum membungkusnya pada batas kata.

**Jawab:**

![Langkah 1](img/Praktikum3/Langkah1.png)

### Langkah 2:
Tambahkan widget variabel `textSection` ke dalam `body` seperti berikut:
![Soal Praktikum 2](img/Praktikum3/soalprak2.png)

**Jawab:**

![Langkah 2](img/Praktikum3/Langkah2.png)

---

## Praktikum 4: Implementasi image section
### Langkah 1:
Anda dapat mencari gambar di internet yang ingin ditampilkan. Buatlah folder `images` di root project **layout_flutter**. Masukkan file gambar tersebut ke folder `images`, lalu set nama file tersebut ke file `pubspec.yaml` seperti berikut:

![Soal Praktikum 1](img/Praktikum4/soalprak1.png)

Contoh nama file gambar di atas adalah `lake.jpg`

**Jawab:**

![Langkah 1](img/Praktikum4/Langkah1.png)

![Langkah 1 ke2](img/Praktikum4/Langkah1ke2.png)

### Langkah 2:
Tambahkan aset gambar ke dalam `body` seperti berikut:
![Soal Praktikum 2](img/Praktikum4/soalprak2.png)

`BoxFit.cover` memberi tahu kerangka kerja bahwa gambar harus sekecil mungkin tetapi menutupi seluruh kotak rendernya.

**Jawab:**

![Langkah 2](img/Praktikum4/Langkah2.png)

### Langkah 3:
Pada langkah terakhir ini, atur semua elemen dalam `ListView`, bukan Column, karena `ListView` mendukung scroll yang dinamis saat aplikasi dijalankan pada perangkat yang resolusinya lebih kecil.
![Soal Praktikum 3](img/Praktikum4/soalprak3.png)

**Jawab:**

![Langkah 3](img/Praktikum4/Langkah3.png)

---

## Tugas Praktikum 1

### 1. Selesaikan Praktikum 1 sampai 4, lalu dokumentasikan dan push ke repository Anda berupa screenshot setiap hasil pekerjaan beserta penjelasannya di file `README.md`!

### 2. Silakan implementasikan di project baru "**basic_layout_flutter**" dengan mengakses sumber ini: [Codelabs: layout-basics](https://docs.flutter.dev/codelabs/layout-basics)

**Jawab:**

Output hasil :
![Tugas No 2](img/TugasPraktikum1/No2.png)

[Link Repository Tugas Praktikum 1](https://github.com/nideeuw/basic_layout_flutter.git)

### 3. Kumpulkan link commit repository GitHub Anda kepada dosen yang telah disepakati!

---

## Praktikum 5: Membangun Navigasi di Flutter
### Langkah 1:
Sebelum melanjutkan praktikum, buatlah sebuah project baru Flutter dengan nama **belanja** dan susunan folder seperti pada gambar berikut. Penyusunan ini dimaksudkan untuk mengorganisasi kode dan widget yang lebih mudah.
![Soal Praktikum 1](img/Praktikum5/soalprak1.png)

**Jawab:**

![Langkah 1](img/Praktikum5/Langkah1.png)

![Langkah 1 ke2](img/Praktikum5/Langkah1ke2.png)

### Langkah 2:
Buatlah dua buah file dart dengan nama `home_page.dart` dan `item_page.dart` pada folder **pages**. Untuk masing-masing file, deklarasikan `class HomePage` pada file `home_page.dart` dan `ItemPage` pada `item_page.dart`. Turunkan class dari `StatelessWidget`. Gambaran potongan kode dapat anda lihat sebagai berikut.
![Soal Praktikum 2](img/Praktikum5/soalprak2.png)

**Jawab:**

![Langkah 2](img/Praktikum5/Langkah2.png)

![Langkah 2 ke 2](img/Praktikum5/Langkah2ke2.png)

![Langkah 2 ke 3](img/Praktikum5/Langkah2ke3.png)


### Langkah 3:
Setelah kedua halaman telah dibuat dan didefinisikan, bukalah file `main.dart`. Pada langkah ini anda akan mendefinisikan **Route** untuk kedua halaman tersebut. Definisi penamaan **route** harus bersifat **unique**. Halaman **HomePage** didefinisikan sebagai /. Dan halaman **ItemPage** didefinisikan sebagai **/item**. Untuk mendefinisikan halaman awal, anda dapat menggunakan `named argument initialRoute`. Gambaran tahapan ini, dapat anda lihat pada potongan kode berikut.
![Soal Praktikum 3](img/Praktikum5/soalprak3.png)

**Jawab:**

![Langkah 3](img/Praktikum5/Langkah3.png)

### Langkah 4:
Sebelum melakukan perpindahan halaman dari `HomePage` ke `ItemPage`, dibutuhkan proses pemodelan data. Pada desain mockup, dibutuhkan dua informasi yaitu nama dan harga. Untuk menangani hal ini, buatlah sebuah file dengan nama `item.dart` dan letakkan pada folder **models**. Pada file ini didefinisikan pemodelan data yang dibutuhkan. Ilustrasi kode yang dibutuhkan, dapat anda lihat pada potongan kode berikut.
![Soal Praktikum 4](img/Praktikum5/soalprak4.png)

**Jawab:**

![Langkah 4](img/Praktikum5/Langkah4.png)

Hasilnya terdapat error. Di Dart modern (null safety), semua variabel harus dipastikan nilainya tidak null. Karena name dan price tidak punya nilai default, Dart meminta untuk menambahkan required pada constructor agar pemanggilnya wajib mengisi nilai tersebut, sehingga tidak terjadi error null.

Fix Error:
![Langkah 4 Fix](img/Praktikum5/Langkah4Fix.png)

### Langkah 5:
Pada halaman `HomePage` terdapat `ListView` widget. Sumber data `ListView` diambil dari model List dari object Item. Gambaran kode yang dibutuhkan untuk melakukan definisi model dapat anda lihat sebagai berikut.
![Soal Praktikum 5](img/Praktikum5/soalprak5.png)

**Jawab:**

![Langkah 5](img/Praktikum5/Langkah5.png)

### Langkah 6:
Untuk menampilkan `ListView` pada praktikum ini digunakan `itemBuilder`. Data diambil dari definisi model yang telah dibuat sebelumnya. Untuk menunjukkan batas data satu dan berikutnya digunakan widget `Card`. Kode yang telah umum pada bagian ini tidak ditampilkan. Gambaran kode yang dibutuhkan dapat anda lihat sebagai berikut.
![Soal Praktikum 6](img/Praktikum5/soalprak6.png)

Jalankan aplikasi pada emulator atau pada device anda.

**Jawab:**

![Langkah 6](img/Praktikum5/Langkah6.png)

Output yang keluar setelah aplikasi dijalankan:
![Langkah 6 Output](img/Praktikum5/Langkah6Output.png)

### Langkah 7:
Item pada ListView saat ini ketika ditekan masih belum memberikan aksi tertentu. Untuk menambahkan aksi pada ListView dapat digunakan widget `InkWell` atau `GestureDetector`. Perbedaan utamanya `InkWell` merupakan material widget yang memberikan efek ketika ditekan. Sedangkan `GestureDetector` bersifat umum dan bisa juga digunakan untuk gesture lain selain sentuhan. Pada praktikum ini akan digunakan widget `InkWell`.

Untuk menambahkan sentuhan, letakkan cursor pada widget pembuka `Card`. Kemudian gunakan shortcut quick fix dari VSCode (**Ctrl + .** pada Windows atau **Cmd + .** pada MacOS). Sorot menu `wrap with widget...` Ubah nilai widget menjadi `InkWell` serta tambahkan named argument `onTap` yang berisi fungsi untuk berpindah ke halaman `ItemPage`. Ilustrasi potongan kode dapat anda lihat pada potongan berikut.
![Soal Praktikum 7](img/Praktikum5/soalprak7.png)

Jalankan aplikasi kembali dan pastikan ListView dapat disentuh dan berpindah ke halaman berikutnya. Periksa kembali jika terdapat kesalahan.

**Jawab:**

![Langkah 7](img/Praktikum5/Langkah7.png)

Output yang keluar setelah aplikasi dijalankan:
![Langkah 7 Output](img/Praktikum5/Langkah7Output.png)

![Langkah 7 Output 2](img/Praktikum5/Langkah7Output2.png)

---

## Tugas Praktikum 2

### 1. Untuk melakukan pengiriman data ke halaman berikutnya, cukup menambahkan informasi arguments pada penggunaan `Navigator`. Perbarui kode pada bagian `Navigator` menjadi seperti berikut.
```dart
Navigator.pushNamed(context, '/item', arguments: item);
```

### 2. Pembacaan nilai yang dikirimkan pada halaman sebelumnya dapat dilakukan menggunakan ModalRoute. Tambahkan kode berikut pada blok fungsi build dalam halaman ItemPage. Setelah nilai didapatkan, anda dapat menggunakannya seperti penggunaan variabel pada umumnya. ([https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments](https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments))
```dart
final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
```

### 3. Pada hasil akhir dari aplikasi **belanja** yang telah anda selesaikan, tambahkan atribut foto produk, stok, dan rating. Ubahlah tampilan menjadi `GridView` seperti di aplikasi marketplace pada umumnya.

### 4. Silakan implementasikan Hero widget pada aplikasi belanja Anda dengan mempelajari dari sumber ini: [https://docs.flutter.dev/cookbook/navigation/hero-animations](https://docs.flutter.dev/cookbook/navigation/hero-animations)

### 5. Sesuaikan dan modifikasi tampilan sehingga menjadi aplikasi yang menarik. Selain itu, pecah widget menjadi kode yang lebih kecil. Tambahkan **Nama** dan **NIM** di footer aplikasi **belanja** Anda.

### 6. Selesaikan Praktikum 5: Navigasi dan Rute tersebut. Cobalah modifikasi menggunakan plugin [go_router](https://pub.dev/packages/go_router), lalu dokumentasikan dan push ke repository Anda berupa screenshot setiap hasil pekerjaan beserta penjelasannya di file `README.md`. Kumpulkan link commit repository GitHub Anda kepada dosen yang telah disepakati!