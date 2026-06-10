# md/html Editor

Editor Markdown dan HTML ringan berbasis browser — tidak butuh instalasi, tidak butuh server, tidak butuh koneksi internet. Cukup buka file `.html` langsung di browser.

---

## Cara Pakai

1. Download `markdown-editor.html`
2. Klik dua kali → langsung terbuka di browser
3. Mulai menulis

Tidak perlu Node.js, npm, Python, atau apapun.

---

## Struktur File

```
project/
├── markdown-editor.html   ← file utama, semua-dalam-satu
└── favicon/
    ├── favicon.ico
    ├── favicon-16x16.png
    ├── favicon-32x32.png
    ├── apple-icon-180x180.png
    ├── android-icon-192x192.png
    └── manifest.json
```

Folder `favicon/` harus berada satu direktori dengan `markdown-editor.html` agar ikon tampil. Jika tidak ada, aplikasi tetap berjalan normal.

---

## Fitur

### Editor
| Fitur | Keterangan |
|---|---|
| Nomor baris | Otomatis, sinkron saat scroll |
| Word wrap | Toggle on/off di header |
| Tab | Menghasilkan 2 spasi |
| Hapus | Tombol clear all dengan konfirmasi |

### Toolbar Format
| Tombol | Shortcut | Keterangan |
|---|---|---|
| Bold | `Ctrl+B` | Klik lagi untuk hapus format |
| Italic | `Ctrl+I` | Klik lagi untuk hapus format |
| Strikethrough | — | Toggle on/off |
| H1 / H2 / H3 | — | Toggle prefix heading |
| Inline Code | `Ctrl+\`` | Toggle on/off |
| Code Block | — | Toggle, auto-deteksi bahasa |
| Link | `Ctrl+K` | Teks yang diblok jadi label link |
| Image | — | Teks yang diblok jadi alt-text |
| Unordered List | — | Toggle prefix `- ` |
| Ordered List | — | Toggle prefix `1. ` |
| Blockquote | — | Toggle prefix `> ` |
| Horizontal Rule | — | Sisipkan `---` |

Semua tombol toolbar mendukung **toggle** — klik pada teks yang sudah diformat akan menghapus formatnya.

### Undo / Redo
| Shortcut | Fungsi |
|---|---|
| `Ctrl+Z` | Undo (custom stack, termasuk aksi toolbar) |
| `Ctrl+Y` | Redo |
| `Ctrl+Shift+Z` | Redo (alternatif) |

Snapshot undo otomatis dibuat setiap ~600ms saat mengetik.

### Live Preview
- Render realtime dengan delay 80ms
- **1x Enter = baris baru** di preview
- Scroll position dipertahankan saat konten diupdate
- Tema preview ikut mode gelap/terang secara otomatis

### Dukungan Markdown
```
# Heading 1 sampai ###### Heading 6
**bold**  _italic_  ~~strikethrough~~
`inline code`
```fenced code block (dengan label bahasa)```
[teks](url)
![alt](url-gambar)
> blockquote
- unordered list
1. ordered list
---  (horizontal rule)
| tabel | dengan | header |
```

HTML murni juga dirender langsung tanpa sanitasi, termasuk dokumen `<!DOCTYPE html>` penuh.

### Code Block di Preview
- Label nama bahasa di pojok kiri atas blok kode
- Tombol **Copy** di pojok kanan atas
- Bekerja di `file://` (menggunakan `execCommand` sebagai fallback)

### Split Screen
- Drag garis pembatas untuk resize panel editor dan preview
- Lebar minimum tiap panel: 140px
- Overlay transparan mencegah iframe "mencuri" pointer saat drag

### Statistik (realtime)
- Jumlah kata
- Jumlah baris
- Jumlah karakter

### Tema
- **Dark mode** (default)
- **Light mode**
- Toggle via tombol ☀ di header

### Ekspor
| Tombol | Shortcut | Output |
|---|---|---|
| `.md` | `Ctrl+S` | File Markdown mentah |
| `.html` | — | Dokumen HTML siap pakai dengan CSS lengkap, konten tercentering |

---

## Google Drive Sync

Fitur sync ke Google Drive membutuhkan **OAuth 2.0 Client ID** dari Google Cloud.

### Cara Setup

1. Buka [console.cloud.google.com](https://console.cloud.google.com) dan buat project baru
2. Masuk ke **APIs & Services → Library** → aktifkan **Google Drive API**
3. Masuk ke **Credentials → Create Credentials → OAuth 2.0 Client ID**
4. Pilih tipe aplikasi: **Web application**
5. Di bagian *Authorized JavaScript origins*, tambahkan:
   - `http://localhost` (untuk pengujian lokal via server)
   - `null` (untuk akses langsung via `file://`)
6. Copy **Client ID** yang dihasilkan (format: `123456789-xxx.apps.googleusercontent.com`)
7. Klik tombol **Google Drive** di header aplikasi
8. Paste Client ID di kolom yang tersedia → klik **Hubungkan**
9. Popup login Google akan muncul — pilih akun dan izinkan akses

Setelah terhubung, `Ctrl+S` akan menyimpan dokumen ke Google Drive sebagai `dokumen.md` sekaligus mengunduhnya secara lokal.

> **Catatan:** Client ID tersimpan di `sessionStorage` browser, sehingga tidak perlu paste ulang selama tab masih terbuka.

---

## Keyboard Shortcuts

| Shortcut | Fungsi |
|---|---|
| `Ctrl+B` | Bold |
| `Ctrl+I` | Italic |
| `Ctrl+K` | Insert / toggle link |
| `Ctrl+\`` | Inline code |
| `Ctrl+S` | Simpan sebagai `.md` (+ sync Drive jika terhubung) |
| `Ctrl+Z` | Undo |
| `Ctrl+Y` | Redo |
| `Ctrl+Shift+Z` | Redo |
| `Tab` | Indent 2 spasi |

---

## Kompatibilitas Browser

| Browser | Status |
|---|---|
| Chrome / Edge (terbaru) | ✅ Penuh |
| Firefox (terbaru) | ✅ Penuh |
| Safari | ✅ Penuh |
| Chrome / Edge (lama, file://) | ✅ Penuh (fallback copy aktif) |

Dioptimalkan untuk laptop lama — tidak ada dependency eksternal, tidak ada build step, ukuran file < 50KB.

---

## Lisensi

Bebas digunakan dan dimodifikasi untuk keperluan pribadi maupun komersial.
