# Tugas Individu 7 PBP (*counter_7*)
**Hugo Sulaiman Setiawan (2106707315)**

### [Readme untuk Tugas Individu 8 PBP](#tugas-individu-8-pbp-budget)
### [Readme untuk Tugas Individu 9 PBP](#tugas-individu-9-pbp-mywatchlist--integrasi-web-service-pada-flutter)

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
#### [Back to top](#tugas-individu-7-pbp-counter_7)

<hr>

# Tugas Individu 8 PBP (*Budget*)
**Hugo Sulaiman Setiawan (2106707315)**

## Jelaskan perbedaan `Navigator.push` dan `Navigator.pushReplacement`.
`Navigator.push` dan  `Navigator.pushReplacement` sama-sama mem-*push* sebuah *route* baru ke `Navigator` (yang pada dasarnya mirip dengan operasi *push* pada *Stack*). Namun, `Navigator.pushReplacement` akan menghapus *route* sebelumnya setelah *route* yang baru telah selesai *loading* dan sudah digunakan. Sehingga, *route* baru yang dipush dengan `Navigator.pushReplacement` akan menggantikan *route* lama yang sudah ada pada `Navigator`.

## Sebutkan *widget* apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
Selain *widget* yang sudah digunakan pada [tugas sebelumnya](#tugas-individu-7-pbp-counter_7), berikut adalah beberapa *widget* yang baru digunakan pada pembuatan proyek kali ini:

- `ListView` <br>
*Widget* untuk menampilkan beberapa *widget* secara linear searah (tepatnya pada arah *scrolling*) yang bisa di-*scroll*.
- `SingleChildScrollView` <br>
*Widget* yang memiliki fungsi yang mirip dengan `ListView`, yaitu untuk menampilkan beberapa *widget* secara linear searah (tepatnya pada arah *scrolling*) yang bisa di-*scroll*. Namun, sesuai namanya (**SingleChild**) hanya dapat menerima satu elemen sebagai *child*. Biasanya *widget* ini dikombinasikan dengan widget seperti misalnya *Column* untuk menampilkan beberapa widget, yang dapat berbeda-beda ukurannya. 
- `Card` <br>
*Widget* untuk membuat sebuah *card* yang dapat digunakan untuk menampilkan *widget*-*widget* lain.
- `Drawer` <br>
*Widget* untuk membuat sebuah *drawer* yang dapat ditampilkan dari sisi *scaffold*; biasanya digunakan untuk menampung *navigation links*.
- `Form` <br>
*Widget* yang dapat digunakan untuk menjadi *parent* terhadap `FormField` seperti misalnya:
  - `TextFormField` <br>
  *Widget* yang digunakan untuk menerima input *text* dari pengguna.
  - `DropdownButtonFormField` <br>
  *Widget* yang digunakan untuk membuat suatu *dropdown box* yang berfungsi sebagai input dari pengguna. *Item* untuk *dropdown box* dibuat dengan *widget* `DropdownMenuItem`. 
- `Consumer<T>` <br>
*Widget* yang digunakan untuk menerima data yang ada pada `Provider<T>`, tepatnya `Provider<BudgetModel>` dan dipass kepada *builder*, agar nilai-nilai yang disediakan pada *provider* dapat digunakan dalam pembuatan *widget*. (tepatnya untuk membuat *card* dengan isian *budget* pada halaman **Data Budget**).

## Sebutkan jenis-jenis event yang ada pada Flutter.
Berikut adalah beberapa dari *event* yang ada pada Flutter:
- `onPressed` <br>
- `onChanged` <br>
- `onSaved` <br>
- `onTap` <br>

## Jelaskan bagaimana cara kerja `Navigator` dalam "mengganti" halaman dari aplikasi Flutter.
Cara kerja `Navigator` dalam menampilkan halaman (dalam terminologi Flutter, bahasa yang tepat untuk term ini adalah *routes*) dapat diandaikan bekerja seperti struktur data *Stack*. 

Ketika perintah `Navigator.push` diberikan, maka *route* yang hendak di-*push* akan masuk ke atas *stack* `Navigator`. `Navigator` pun akan menampilkan *route* yang ada pada *top of stack*. Jika sebuah *route* baru di-*push* setelah itu, maka *route* baru itulah yang akan ada pada *top of stack* dan akan ditampilkan. *Route* yang sebelumnya ditampilkan akan berada di belakang *route* yang baru saja di-*push*.

Jika hendak menutup halaman/*route* yang ada pada *top of stack*, maka dapat menggunakan perintah `Navigator.pop`. *Route* yang akan mengeluarkan *route* yang sedang berada pada *top of stack*. Kemudian, *route* yang ada pada belakang *route* yang di-*pop* akan berada di *top of stack*, sehingga *route* tersebutlah yang akan ditampilkan ke pengguna.

Perandaian lain untuk cara kerja `Navigator` adalah sebagai berikut: andaikan `Navigator` adalah suatu tumpukan kertas, dan masing-masing kertas merupakan suatu halaman/*route*. Tentu, kertas/*route* yang terlihat oleh pengguna adalah kertas/*route* yang ada pada atas tumpukan kertas. Jika hendak menampilkan kertas/*route* lain, kita akan menaruh kertas/*route* tersebut pada paling atas tumpukan (`Navigator.push`). Kertas/*route* akan menutup kertas/*route* yang sebelumnya terlihat.

 Sebaliknya, jika kita hendak menutup kertas/*route* yang sedang terlihat, maka kita akan "membuang" kertas pada paling atas tumpukan, dan kemudian akan terlihat kertas/*route* yang ada pada sebelum kertas/*route* yang baru saja di-"buang".

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
### Menambahkan *drawer* serta menambahkan tiga tombol navigasi
Untuk memudahkan *development* (serta untuk memenuhi sebagian poin bonus), *drawer* serta tombol navigasi diimplementasikan dalam file terpisah, `drawer.dart`, di mana sebuah *widget* `MyDrawer` didefinisikan, yang mencakup sebuah *drawer* serta tombol-tombol navigasi sesuai ketentuan soal. 

### Menambahkan halaman *form*
Halaman *form* dibuat pada file `form.dart`. Halaman *form* ini mengandung elemen-elemen input berupa `TextFormField` dan `DropdownButtonFormField` yang dibungkus dalam `Form`. Selain itu, diperlukan *validator* untuk memvalidasi input yang diberikan oleh user sesuai dengan ketentuan (misalnya, input untuk nominal harus berupa angka). Hasil dari input pengguna akan disimpan dalam variabel, yang terkandung dalam *state* dari halaman form tersebut.

### Menyimpan *budget*
Ketika tombol pada halaman *form* ditekan, maka isian form akan divalidasi, kemudian akan disimpan dengan menggunakan `BudgetModel extends ChangeNotifier`, yang dalam internalnya menyimpan `Budget`-`Budget` dengan menggunakan `List<Budget>`, yang kemudian dapat diakses dengan `UnmodifiableListView<Budget>`. Data akan disimpan oleh instance `ChangeNotifierProvider` untuk `BudgetModel` yang ada pada `main` dengan:
```dart
Provider.of<BudgetModel>(context, listen: false).add(newBudget);
```

### Menambahkan halaman data *budget*
Halaman data *budget* dibuat pada file `show_budget.dart`. Bodi pada halaman ini pada dasarnya akan dibangun dengan menggunakan `Consumer<BudgetModel>`, yang *builder*-nya akan membuat suatu `ListView` yang mengandung `Card`-`Card` yang masing-masingnya menampilkan data dari satu *instance* `Budget` yang ada pada `BudgetModel`.

#### [Back to top](#tugas-individu-7-pbp-counter_7)
<hr>

# Tugas Individu 9 PBP (*MyWatchlist | Integrasi Web Service pada Flutter*)
**Hugo Sulaiman Setiawan (2106707315)**

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat *model* terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Bisa saja dilakukan *fetch* JSON secara langsung untuk kemudian di-*parse* secara manual, tanpa melalui *model*, baik menggunakan *class* atau tidak (menyimpan *fields* secara manual). Namun, tentu akan mengurangi keterbacaan, membuka peluang yang lebih besar untuk kesalahan dalam *parsing*, dan *in general* bukan merupakan *best practice* yang sebaiknya diterapkan.

## Sebutkan *widget* apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
Selain *widget* yang sudah digunakan pada [tugas 7](#tugas-individu-7-pbp-counter_7) dan [tugas 8](#tugas-individu-8-pbp-budget), berikut adalah beberapa *widget* yang baru digunakan pada pembuatan tugas kali ini:
- `FutureBuilder` <br>
*Widget* yang akan mengkonstruksi serta meng-*update* *widget*-*widget* berdasarkan *snapshot* terbaru dari suatu `Future`.
- `GestureDetector` <br>
Mendeteksi gestur yang dilakukan padanya (seperti misalnya *tap* yang dilakukan padanya), dan akan memanggil fungsi *callback* yang sesuai dengan gestur yang terjadi. `GestureDetector` tidak memiliki tampilan apapun, sehingga ia memiliki `child` untuk tampilannya (dalam tugas kali ini, `child` berupa `Container` yang mencakup judul dan *checkbox* per `Watchlist`). 

## Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter
1. *Fetch* data pada server dengan `http.get`, menerima data berupa *response*.
2. *Deserialize response* sehingga menjadi suatu *JSON object*.
3. Setiap anggota *JSON object* yang telah dibuat pada langkah 2 akan dibuat objek `Watchlist`-nya dengan `Watchlist.fromJson`. 
4. Objek `Watchlist` dari anggota *JSON object* yang telah berhasil di-*parse* akan ditambahkan ke `listMyWatchlist`.
5. Setelah semua isi *response* di-*parse* menjadi `Watchlist` yang ada pada `listMyWatchlist`, *list* tersebut akan diserahkan kepada `FutureBuilder` untuk kemudian dikonstruksi *widget*-*widget* yang sesuai.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
### Menambahkan tombol navigasi pada drawer/hamburger untuk ke halaman `myWatchlist`
Cukup menambahkan `ListTile` pada `MyDrawer` yang sudah di-*refactor* sebelumnya pada file `widget/drawer.dart` seperti berikut:
```dart
ListTile(
  title: const Text('My Watch List'),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyWatchlistPage()),
    );
  },
),
```

### Membuat satu file dart yang berisi model `watchlist`
Saya membuat file `model/mywatchlist_model.dart` yang berisikan model `watchlist` yang di-*generate* dengan [Quicktype](https://app.quicktype.io/) (seperti pada tutorial).

### Menambahkan *dependencies* yang diperlukan
Untuk tugas kali ini, saya memanfaatkan 2 *package*, yakni *http* (untuk mengambil data dari *server* dengan `http.get`) dan *intl* (untuk menyajikan tanggal dalam bentuk yang lebih *human-readable*). Kedua *package* tersebut dapat ditambahkan sebagai *dependency* dengan perintah `flutter pub add <nama_package>`.

### Membuat fungsi untuk mengambil data yang ada pada endpoint JSON di Django yang telah di-*deploy* ke Heroku sebelumnya [(pada Tugas 3)](https://github.com/hugo-setiawan/pbp-tugas/tree/main/mywatchlist) (BONUS: *refactored* ke file terpisah)
Saya mengimplementasikan fungsi `fetchMyWatchlist(urlString)` pada file `data/mywatchlist_data.dart`. Fungsi tersebut menerima parameter berupa string URL yang bertujuan kepada *endpoint* JSON untuk Tugas 3 (*mywatchlist*) yang ada pada Heroku. Fungsi tersebut mengembalikan `Future<List<Watchlist>>`, dimana `List<Watchlist>` dapat diakses setelah data sudah diterima dan di-*parse*.

### Menambahkan halaman `mywatchlist` yang berisi semua watch list yang 
Halaman `MyWatchlistPage` dibuat pada file `page/mywatchlist.dart` dengan memanfaatkan `FutureBuilder`. `FutureBuilder` meng-*handle* kasus di mana data `watchlist` masih belum diterima (masih menunggu), data `watchlist` kosong, dan data `watchlist` ada. 

Jika data `watchlist` sudah ada, maka akan disusun dengan `ListView.builder`, di mana setiap elemen `ListView` merupakan `GestureDetector` yang berisikan teks nama film pada `watchlist` tersebut serta *checkbox* yang mendandakan status `watched` serta warna *shadow* yang sesuai status `watched`. Jika terjadi sentuhan pada *checkbox*, maka status `watched` untuk `watchlist` tersebut akan berubah (BONUS). Selain itu, jika `GestureDetector` akan mendeteksi sentuhan pada dirinya, maka ia akan mem-*push* route ke halaman detail untuk `watchlist` tersebut. 

### Menambahkan halaman detail untuk setiap `watchlist` yang ada pada daftar tersebut beserta tombol untuk kembali ke `myWatchlist`
Halaman `WatchlistDetailPage` dibuat pada file `page/watchlist_detail.dart` serta diimplementasikan sebagai suatu `StatelessWidget` yang menerima satu parameter saat diinisialisasikan, yakni *instance* `Watchlist` yang hendak dilihat detailnya. Isi dari halaman ini utamanya berisi `Column`, `Row`, `SizedBox`, dan `Expanded` untuk mengatur tata letak, serta `Text` untuk menampilkan *field* yang ada pada `Watchlist`. Selain itu, ditambahkan suatu `TextButton` yang ketika ditekan, akan menge-*pop* route yang ada pada `Navigator` sehingga akan kembali ke halaman sebelumnya.


#### [Back to top](#tugas-individu-7-pbp-counter_7)

<hr>