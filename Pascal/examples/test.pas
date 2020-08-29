

{ Gregorian & Jalali (Hijri_Shamsi , Solar) Date Converter  Functions
Author: JDF.SCR.IR =>> Download Full Version :  http://jdf.scr.ir/jdf
License: GNU/LGPL _ Open Source & Free :: Version: 2.80 : [2020=1399]
---------------------------------------------------------------------
355746=361590-5844 & 361590=(30*33*365)+(30*8) & 5844=(16*365)+(16/4)
355666=355746-79-1 & 355668=355746-79+1 &  1595=605+990 &  605=621-16
990=30*33 & 12053=(365*33)+(32/4) & 36524=(365*100)+(100/4)-(100/100)
1461=(365*4)+(4/4) &  146097=(365*400)+(400/4)-(400/100)+(400/400)  }




Procedure gregorian_to_jalali(gy: LongInt; gm: LongInt; gd: LongInt; var jy: LongInt; var jm: LongInt; var jd: LongInt);

Var
 gy2, days : LongInt;
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
 
 If gm > 2 Then
  gy2 := (gy + 1)
 Else
  gy2 := gy;
 
 days := 355666 + (365 * gy) + {Int}((gy2 + 3) Div 4) - {Int}((gy2 + 99) Div 100);
 days := days + {Int}((gy2 + 399) Div 400) + gd + g_d_m[gm - 1];
 jy := -1595 + (33 * {Int}(days Div 12053));
 days := days Mod 12053;
 jy := jy + (4 * {Int}(days Div 1461));
 days := days Mod 1461;
 
 If days > 365 Then
  begin
   jy := jy + {Int}((days - 1) Div 365);
   days := (days - 1) Mod 365;
  end;
 
 If days < 186 Then
  begin
   jm := 1 + {Int}(days Div 31);
   jd := 1 + (days Mod 31);
  end
 Else
  begin
   jm := 7 + {Int}((days - 186) Div 30);
   jd := 1 + ((days - 186) Mod 30);
  end;
 
End;




Procedure jalali_to_gregorian(jy: LongInt; jm: LongInt; jd: LongInt;var gy: LongInt;var gm: LongInt;var gd: LongInt);

Var
 days, kab, i: LongInt;
 sal_a: array[0..12] of LongInt;

Begin
 jy := jy + 1595;
 days := -355668 + (365 * jy) + ({Int}(jy Div 33) * 8) + {Int}(((jy Mod 33) + 3) Div 4) + jd;
 
 If jm < 7 Then
  days := days + ((jm - 1) * 31)
 Else
  days := days + ((jm - 7) * 30) + 186;
 
 gy := 400 * {Int}(days Div 146097);
 days := days Mod 146097;
 
 If days > 36524 Then
  begin
   days := days - 1;
   gy := gy + (100 * {Int}(days Div 36524));
   days := days Mod 36524;
   If days >= 365 Then
    days := days + 1;
  end;
 
 gy := gy + (4 * {Int}(days Div 1461));
 days := days Mod 1461;
 
 If days > 365 Then
  begin
   gy := gy + {Int}((days - 1) Div 365);
   days := (days - 1) Mod 365;
  end;
 
 gd := days + 1;
 gm := 0;
 
 If ((((gy Mod 4) = 0) And ((gy Mod 100) <> 0)) Or ((gy Mod 400) = 0)) Then
  kab := 29
 Else
  kab := 28;
 
 sal_a[0] := 0;
 sal_a[1] := 31;
 sal_a[2] := kab;
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







var
 tabdil: Char;
 jy,jm,jd,gy,gm,gd,y_in,m_in,d_in: LongInt;
begin
 
 
 while true do
  begin
   
   Writeln('----------------------------------');
   Writeln('if gregorian_to_jalali -> press: g');
   Writeln('or jalali_to_gregorian -> press: j');
   Writeln('and finish -> press: e');
   Readln(tabdil);
   If(tabdil='e') Then
    Exit;
   Write('enter Day: ');
   Readln(d_in);
   Write('enter Month: ');
   Readln(m_in);
   Write('enter Year: ');
   Readln(y_in);
   
   If(tabdil='g') Then
    begin
     Writeln('----------------------------------');
     Writeln('Gregorian: ',y_in,'/',m_in,'/',d_in);
     gregorian_to_jalali(y_in,m_in,d_in,jy,jm,jd);
     Writeln('Jalali: ',jy,'/',jm,'/',jd);
    end
   Else
    begin
     Writeln('----------------------------------');
     Writeln('Jalali: ',y_in,'/',m_in,'/',d_in);
     jalali_to_gregorian(y_in,m_in,d_in,gy,gm,gd);
     Writeln('Gregorian: ',gy,'/',gm,'/',gd);
    end;
   
  end;
 
 
end.


