# Tugas Individu 7 PBP (*counter_7*)
**Hugo Sulaiman Setiawan (2106707315)**

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.      
*Stateless widget* merupakan *widget* yang tidak memiliki *state* atau kondisi tertentu serta tampilannya tidak dipengaruhi oleh *state* atau kondisi yang dimilikinya. Misalnya, sebuah *widget* teks yang menampilkan teks statik dapat tergolong *stateless* karena tampilan dari *widget* tersebut (teks) tidak tergantung pada *state*-nya. Tampilan dari *stateless widget* hanya bisa diubah melalui *parent*-nya.

*On the other hand*, *stateful widget* merupakan kebalikan dari *stateless widget*, di mana *stateful widget* dapat memiliki *state* atau kondisi internal yang akan memengaruhi tampilannya. Misalnya, pada program *counter_7* ini, *widget* `MyHomePage` memiliki *state* internal variabel `_counter`. Tampilan dari aplikasi pun akan tergantung pada *state* atau kondisi yang disimpan variabel tersebut (misalnya, teks ganjil/genap tergantung nilai `_counter`). Sehingga, tampilan dari suatu *stateful widget* dapat berubah akibat *parent* ataupun dari dirinya sendiri.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.   
- `Row` <br> *Widget* untuk menampilkan satu atau lebih *widget* dalam satu baris atau *row*.
- `Expanded` <br> *Widget* untuk membuat *child* dari widget ini memakan tempat sebanyak mungkin (agar tidak kosong).
- `Spacer` <br> *Widget* untuk membuat sebesar mungkin *space* atau jarak antar *widget* dalam suatu *Flex container* (seperti *row* atau *column*).
- `Visibility` <br> *Widget* untuk mengatur visibilitas *child* widget ini.
- `FloatingActionButton` <br> *Widget* untuk membuat suatu tombol yang meng-*hover* di atas konten.
- `Text` <br> *Widget* untuk menampilkan teks.

## Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.   
Fungsi dari `setState()` adalah untuk melakukan perubahan pada *state* yang dimiliki suatu *widget*. Perubahan pada *state* yang dimiliki suatu *widget* perlu dilakukan menggunakan `setState()` karena setelah blok kode dalam `setState()` yang mengubah *state* dijalankan, *framework* akan melakukan hal-hal yang diperlukan seperti misalnya me-*render* ulang *widget* tersebut.

Fungsi `setState()` hanya dapat berdampak pada variable yang bukan merupakan `final` ataupun `const`.

## Jelaskan perbedaan antara `const` dengan `final`.     
Variabel dengan modifier `const` akan ditentukan dan disimpan nilainya pada saat kompilasi program, sehingga nilai dari variabel tersebut sudah pasti dan TIDAK dapat diubah dari dalam program saat *runtime*. Sedangkan, variabel dengan modifier `final` nilainya dapat saja ditentukan dari dalam program saat *runtime*, namun nilainya hanya dapat ditentukan satu kali saja.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.  
### Membuat sebuah program Flutter baru dengan nama `counter_7`
Langkah ini dilakukan dengan *command* `flutter create counter_7`.

### Mengubah tampilan program menjadi seperti pada gambar & mengimplementasikan logika pada program
Pertama-tama, saya mengubah judul pada aplikasi dengan mengubah variabel pada kode. Kemudian, saya mengubah teks pada program agar menyesuaikan dengan *state* `_counter`. Saya membuat suatu fungsi untuk mengembalikan teks yang sesuai, serta fungsi untuk mengembalikan *style* warna yang sesuai. Kemudian, *widget* `Text` akan mengambil nilai dari fungsi tersebut untuk ditampilkan.
```dart
String getGageTextString() {
  return _counter % 2 == 0 ? "GENAP" : "GANJIL";
}

Text(
  getGageTextString(),
  style: TextStyle(color: getGageTextColor()),
)
```

Setelah itu, saya mengubah dan membuat fungsi yang dapat mengatur *state* pada variabel `_counter`.
```dart
void _incrementCounter() {
  setState(() {
    _counter++;
  });
}

void _decrementCounter() {
  setState(() {
    if (_counter > 0) {
      _counter--;
    }
  });
}
```

Kemudian, saya membuat dua `floatingActionButton` yang memiliki icon dan *action* yang sesuai serta di-*layout* dengan menggunakan `Row`, `Expanded`, `Visibility`, dan `Spacer` dan menaruhnya pada `Scaffold` yang ada. Bonus juga diimplementasi dengan hanya menunjukkan tombol `-` jika `_counter` bernilai tidak sama dengan nol (atau dalam kata lain, menghilangkan tombol `-` jika `_counter` bernilai nol).
```dart
Row(
  children: <Widget>[
    Expanded(
      child: Visibility(
        visible: (_counter != 0),
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        child: FloatingActionButton(
          onPressed: _decrementCounter,
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
      )
    ),
    const Spacer(flex: 2),
    Expanded(child: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      )
    )
  ],
),
```