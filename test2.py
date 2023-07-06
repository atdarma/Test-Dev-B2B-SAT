while True:
    kode = input("Masukkan kode barang : ")
    
    if kode == '0':
        break
    
    jenis = input("Masukkan jenis barang (A, B, atau C): ")
    harga = float(input("Masukkan harga barang: "))
    
    diskon = 0
    if jenis == "A":
        diskon = 0.1
    elif jenis == "B":
        diskon = 0.15
    elif jenis == "C":
        diskon = 0.2
    
    harga_setelah_diskon = harga - (harga * diskon)
    
    print(f"Jenis barang {jenis} mendapat diskon = {diskon * 100}%, Harga setelah didiskon = {harga_setelah_diskon}")
