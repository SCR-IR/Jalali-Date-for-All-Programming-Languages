{ In The Name Of Allah
    Please Download Last Version From:
      http://jdf.scr.ir/jdf/
       http://jdf.scr.ir/download/
}




{   Gregorian & Jalali (Hijri_Shamsi,Solar) Date Converter Functions
Author: JDF.SCR.IR =>> Download Full Version : http://jdf.scr.ir/jdf
License: GNU/LGPL _ Open Source & Free _ Version: 2.72 : [2017=1396]
--------------------------------------------------------------------
1461 = 365*4 + 4/4   &  146097 = 365*400 + 400/4 - 400/100 + 400/400
12053 = 365*33 + 32/4    &    36524 = 365*100 + 100/4 - 100/100    }


Procedure gregorian_to_jalali(gy: LongInt; gm: LongInt; gd: LongInt; var jy: LongInt; var jm: LongInt; var jd: LongInt);
 
Var
 days, gy2 : LongInt;
 outs: array[0..2] of LongInt;
 g_d_m: array[0..11] of LongInt;
 
Begin
 g_d_m[0] := 0;
 g_d_m[1] := 31;
 g_d_m[2] := 59;
 g_d_m[3] := 90;
 g_d_m[4] := 120;
 g_d_m[5] := 151;
 g_d_m[6] := 181;
 g_d_m[7] := 212;
 g_d_m[8] := 243;
 g_d_m[9] := 273;
 g_d_m[10] := 304;
 g_d_m[11] := 334;
 
 If gy > 1600 Then
  begin
   jy := 979;
   gy := gy - 1600;
  end
 Else
  begin
   jy := 0;
   gy := gy - 621;
  end;
 
 If gm > 2 Then
  gy2 := (gy + 1)
 Else
  gy2 := gy;
 
 days := (365 * gy) + {Int}((gy2 + 3) div 4) - {Int}((gy2 + 99) div 100);
 days := days + {Int}((gy2 + 399) div 400) - 80 + gd + g_d_m[gm - 1];
 jy := jy + 33 * {Int}(days div 12053);
 days := days Mod 12053;
 jy := jy + 4 * {Int}(days div 1461);
 days := days Mod 1461;
 If days > 365 Then
  begin
   jy := jy + {Int}((days - 1) div 365);
   days := (days - 1) Mod 365;
  end;
 
 If days < 186 Then
  begin
   jm := 1 + {Int}(days div 31);
   jd := 1 + (days Mod 31);
  end
 Else
  begin
   jm := 7 + {Int}((days - 186) div 30);
   jd := 1 + ((days - 186) Mod 30);
  end;
 
End;





Procedure jalali_to_gregorian(jy: LongInt; jm: LongInt; jd: LongInt;var gy: LongInt;var gm: LongInt;var gd: LongInt);

Var
 days,jm2,gm2,i: LongInt;
 sal_a: array[0..12] of LongInt;

Begin
 If jy > 979 Then
  begin
   gy := 1600;
   jy := jy - 979;
  end
 Else
  gy := 621;
 
 If jm < 7 Then
  jm2 := (jm - 1) * 31
 Else
  jm2 := ((jm - 7) * 30) + 186;
 
 days := (365 * jy) + ({Int}(jy div 33) * 8) + {Int}(((jy Mod 33) + 3) div 4) + 78 + jd + jm2;
 gy := gy + (400 * {Int}(days div 146097));
 days := days Mod 146097;
 If days > 36524 Then
  begin
   days := days - 1;
   gy := gy + (100 * {Int}(days div 36524));
   days := days Mod 36524;
   If days >= 365 Then
    days := days + 1;
  end;
 
 gy := gy + (4 * {Int}(days div 1461));
 days := days Mod 1461;
 
 If days > 365 Then
  begin
   gy := gy + {Int}((days - 1) div 365);
   days := (days - 1) Mod 365;
  end;
 
 gd := days + 1;
 gm := 0;
 
 If ((((gy Mod 4) = 0) And ((gy Mod 100) <> 0)) Or ((gy Mod 400) = 0)) Then
  gm2 := 29
 Else
  gm2 := 28;
 
 sal_a[0] := 0;
 sal_a[1] := 31;
 sal_a[2] := gm2;
 sal_a[3] := 31;
 sal_a[4] := 30;
 sal_a[5] := 31;
 sal_a[6] := 30;
 sal_a[7] := 31;
 sal_a[8] := 31;
 sal_a[9] := 30;
 sal_a[10] := 31;
 sal_a[11] := 30;
 sal_a[12] := 31;
 
 For i := 0 to 12 do
  begin
   If gd <= sal_a[i] Then
    break;
   gm := gm + 1;
   gd := gd - sal_a[i];
  end;
 
End;
