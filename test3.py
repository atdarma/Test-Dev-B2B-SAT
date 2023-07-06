# Fungsi untuk menghitung total deret
def hitung_total(deret):
    total = sum(deret[:10])
    return total

# Perulangan untuk memasukkan deret dan mencetak totalnya
while True:
    pilihan = input("Masukkan pilihan deret (a, b, c, d) atau q untuk keluar: ")

    if pilihan == 'q':
        break
    if pilihan == 'a':
        deret_a = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
        total_a = hitung_total(deret_a)
        print("Total deret a:", total_a)
    elif pilihan == 'b':
        deret_b = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
        total_b = hitung_total(deret_b)
        print("Total deret b:", total_b)
    elif pilihan == 'c':
        deret_c = [100, 95, 90, 85, 80, 75, 70, 65, 60, 55]
        total_c = hitung_total(deret_c)
        print("Total deret c:", total_c)
    elif pilihan == 'd':
        deret_d = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]
        total_d = hitung_total(deret_d)
        print("Total deret d:", total_d)
    else:
        print("Pilihan tidak valid!")
    print()  # Baris kosong untuk memisahkan hasil setiap deret
print("Program selesai.")

