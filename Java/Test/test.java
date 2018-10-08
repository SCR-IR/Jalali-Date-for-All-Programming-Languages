/** In The Name Of Allah
    Please Download Last Version From:
        http://jdf.scr.ir/jdf/
        http://jdf.scr.ir/download/
*/




package converter;

public class converter {



/** Gregorian & Jalali (Hijri_Shamsi,Solar) Date Converter Functions
Author: JDF.SCR.IR =>> Download Full Version : http://jdf.scr.ir/jdf
License: GNU/LGPL _ Open Source & Free _ Version: 2.72 : [2017=1396]
--------------------------------------------------------------------
1461 = 365*4 + 4/4   &  146097 = 365*400 + 400/4 - 400/100 + 400/400
12053 = 365*33 + 32/4    &    36524 = 365*100 + 100/4 - 100/100   */


 public static int[] gregorian_to_jalali(int gy, int gm, int gd){
  int[] g_d_m = {0,31,59,90,120,151,181,212,243,273,304,334};
  int jy;
  if(gy>1600){
   jy=979;
   gy-=1600;
  }else{
   jy=0;
   gy-=621;
  }
  int gy2 = (gm > 2)?(gy + 1):gy;
  int days = (365 * gy) + ((int)((gy2 + 3) / 4)) - ((int)((gy2 + 99) / 100)) + ((int)((gy2 + 399) / 400)) - 80 + gd + g_d_m[gm - 1];
  jy += 33 * ((int)(days / 12053));
  days %= 12053;
  jy += 4 * ((int)(days / 1461));
  days %= 1461;
  if(days > 365){
   jy+=(int)((days-1)/365);
   days=(days-1)%365;
  }
  int jm = (days < 186)?1 + (int)(days / 31):7 + (int)((days - 186) / 30);
  int jd = 1 + ((days < 186)?(days % 31):((days - 186) % 30));
  int[] out = {jy,jm,jd};
  return out;
 }


 public static int[] jalali_to_gregorian(int jy, int jm, int jd){
  int gy;
  if(jy>979){
   gy=1600;
   jy-=979;
  }else{
   gy=621;
  }
  int days = (365 * jy) + (((int)(jy / 33)) * 8) + ((int)(((jy % 33) + 3) / 4)) + 78 + jd + ((jm < 7)?(jm - 1) * 31:((jm - 7) * 30) + 186);
  gy += 400 * ((int)(days / 146097));
  days %= 146097;
  if(days > 36524){
   gy += 100 * ((int)(--days / 36524));
   days %= 36524;
   if (days >= 365)days++;
  }
  gy += 4 * ((int)(days / 1461));
  days %= 1461;
  if(days > 365){
   gy += (int)((days - 1) / 365);
   days = (days - 1) % 365;
  }
  int gd = days + 1;
  int[] sal_a = {0,31,((gy % 4 == 0 && gy % 100 != 0) || (gy % 400 == 0))?29:28,31,30,31,30,31,31,30,31,30,31};
  int gm;
  for(gm = 0;gm < 13;gm++){
   int v = sal_a[gm];
   if(gd <= v)break;
   gd -= v;
  }
  int[] out = {gy,gm,gd};
  return out;
 }



}

