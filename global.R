malzeme_list <- function(){
  # With this function, we produce the material list as data frame
  mlz = data.frame() 
  mlz[1,1]="Gul"
  mlz[1,2]=TRUE
  mlz[1,3]=TRUE
  mlz[1,4]=TRUE
  mlz[2,1]="Papatya"
  mlz[2,2]=TRUE
  mlz[2,3]=FALSE
  mlz[2,4]=TRUE
  mlz[3,1]="Orkide"
  mlz[3,2]=TRUE
  mlz[3,3]=FALSE
  mlz[3,4]=FALSE
  mlz[4,1]="Susleme"
  mlz[4,2]=FALSE
  mlz[4,3]=FALSE
  mlz[4,4]=TRUE
  names(mlz) <- c("Malzeme","Çicekli","Dikenli","Yapraklı")
  mlz
}
Buket_list <- function(){
  # With this function, we produce the bouquet list as data frame
  bkt=data.frame()
  bkt[1,1]="Gul Bahcesi"
  bkt[2,1]="Gul Bahcesi"
  bkt[3,1]="Gul Bahcesi"
  bkt[4,1]="Gelinlikli Guller"
  bkt[5,1]="Gelinlikli Guller"
  bkt[6,1]="Gelinlikli Guller"
  bkt[7,1]="Orkide Buketi"
  bkt[8,1]="Orkide Buketi"
  bkt[9,1]="Orkide Buketi"
  bkt[1,2]="Kucuk"
  bkt[2,2]="Orta"
  bkt[3,2]= "Buyuk"
  bkt[4,2]="Kucuk"
  bkt[5,2]="Orta"
  bkt[6,2]= "Buyuk"
  bkt[7,2]="Kucuk"
  bkt[8,2]="Orta"
  bkt[9,2]= "Buyuk"
  bkt[1,3]="10 adet gül + süslemeler "
  bkt[2,3]="25 adet gül + süslemeler "
  bkt[3,3]= " 50 adet gül + süslemeler"
  bkt[4,3]="5 adet gül+ 20 adet papatya + süslemeler "
  bkt[5,3]="7 adet gül+ 20 adet papatya + süslemeler "
  bkt[6,3]= "10 adet gül+ 20 adet papatya + süslemeler "
  bkt[7,3]=" 1 orkide"
  bkt[8,3]="2 orkide "
  bkt[9,3]= "5 orkide "
  bkt[1,4]="10"
  bkt[2,4]="15"
  bkt[3,4]= "20"
  bkt[4,4]="12 "
  bkt[5,4]="16"
  bkt[6,4]= "20"
  bkt[7,4]="20"
  bkt[8,4]="25"
  bkt[9,4]= "30"
  names(bkt) <- c("Buket cesidi","Boyut","Icerik","Fiyat(TL)")
  bkt
}