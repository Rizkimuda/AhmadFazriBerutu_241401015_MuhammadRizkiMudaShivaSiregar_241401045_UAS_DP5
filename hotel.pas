program BookingKamarHotel;

uses crt;


type
    Kamar = record
        jenis:string;
        harga:longint;
        tersedia:integer; 
        totalKamar:integer;
  end;

pelanggan1 = record
    nama:string;
    jenisKamar:string;
    durasi:integer;
    total_bayar:longint;
end;

var
    daftarkamar:array[1..5] of Kamar;
    datapelanggan:array[1..100] of pelanggan1;
    totalguest,pilihan,durasi:integer;
    ulang:char;

procedure Iniskamar;
    begin
        daftarkamar[1].jenis:='Single'; 
        daftarkamar[1].harga:=500000; 
        daftarkamar[1].tersedia:=10; 
        daftarkamar[1].totalKamar:=10;
        daftarkamar[2].jenis:='Double'; 
        daftarkamar[2].harga:=750000; 
        daftarkamar[2].tersedia:=8; 
        daftarkamar[2].totalKamar:=8;
        daftarkamar[3].jenis:='Suite';  
        daftarkamar[3].harga:=1200000; 
        daftarkamar[3].tersedia:=6; 
        daftarkamar[3].totalKamar:=6;
        daftarkamar[4].jenis:='Deluxe'; 
        daftarkamar[4].harga:=1500000; 
        daftarkamar[4].tersedia:=4; 
        daftarkamar[4].totalKamar:=4;
        daftarkamar[5].jenis:='Presidential'; 
        daftarkamar[5].harga:=2500000; 
        daftarkamar[5].tersedia:=2; 
        daftarkamar[5].totalKamar:=2;
    end;

procedure tampilkamar;
    var
        i:integer;
    begin
        writeln('Daftar Kamar dan Status:');
        for i:=1 to 5 do
            begin
                writeln(
                    i, '. ', daftarkamar[i].jenis, ' - Rp.', daftarkamar[i].harga, ' - Tersedia: ', daftarkamar[i].tersedia, ' kamar'
                    );
            end;
    end;

procedure tampilres;
    var
    i:integer;

    begin
        writeln('=======  RESERVASI  =======');
        for i:=1 to totalguest do
            begin
                writeln(i,'. ',datapelanggan[i].nama,' | ',datapelanggan[i].jenisKamar,' | ',datapelanggan[i].durasi,' hari | Rp.',datapelanggan[i].total_bayar);
            end;
    end;


function hitungtotal(harga:longint;durasi:integer):longint;
    begin
        hitungtotal:=harga*durasi;
    end;


procedure reskamar;
begin
    writeln('Masukkan Nama Anda: '); readln(datapelanggan[totalguest+1].nama);
    writeln('Pilih Nomor Kamar (1-5):'); readln(pilihan);

    if (pilihan >= 1) and (pilihan <= 5) then
        begin
            if daftarkamar[pilihan].tersedia > 0 then
            begin
            writeln('Masukkan Lama Menginap (hari): '); readln(durasi);
            datapelanggan[totalguest+1].jenisKamar:=daftarkamar[pilihan].jenis;
            datapelanggan[totalguest+1].durasi:=durasi;
            datapelanggan[totalguest+1].total_bayar:=hitungtotal(daftarkamar[pilihan].harga,durasi);
            daftarkamar[pilihan].tersedia:=daftarkamar[pilihan].tersedia-1;
            writeln('Pemesanan Berhasil!');
            writeln('Nama Pelanggan: ',datapelanggan[totalguest+1].nama);
            writeln('Jenis Kamar: ',datapelanggan[totalguest+1].jenisKamar);
            writeln('Lama Menginap: ',datapelanggan[totalguest+1].durasi,' hari');
            writeln('Total Pembayaran: Rp.',datapelanggan[totalguest+1].total_bayar);

            totalguest:=totalguest+1;
        end
        else
            writeln('Maaf, kamar ini sudah habis');
        end
    else
        writeln('Pilihan tidak valid');
    end;


begin
clrscr;
    Iniskamar;
    totalguest:=0;

    repeat
        begin
            clrscr;
            writeln('==========  Reservasi Kamar Hotel  ==========');
            tampilkamar;
            reskamar;
            writeln;
            write('Apakah Anda ingin reservasi lagi? (y/n):'); readln(ulang);
        end;
    until(ulang='n');

    writeln('-------------------------------------------');
    tampilres;

  
end.
