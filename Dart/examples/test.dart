

/**  Gregorian & Jalali (Hijri_Shamsi,Solar) Date Converter Functions
Author: JDF.SCR.IR =>> Download Full Version :  http://jdf.scr.ir/jdf
License: GNU/LGPL _ Open Source & Free :: Version: 2.80 : [2020=1399]
---------------------------------------------------------------------
355746=361590-5844 & 361590=(30*33*365)+(30*8) & 5844=(16*365)+(16/4)
355666=355746-79-1 & 355668=355746-79+1 &  1595=605+990 &  605=621-16
990=30*33 & 12053=(365*33)+(32/4) & 36524=(365*100)+(100/4)-(100/100)
1461=(365*4)+(4/4) & 146097=(365*400)+(400/4)-(400/100)+(400/400)  */

List gregorianToJalali(int gy, int gm, int gd) {
  var gdm, jy, jm, jd, gy2, days;
  gdm = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
  gy2 = (gm > 2) ? (gy + 1) : gy;
  days = 355666 + (365 * gy) + ((gy2 + 3) ~/ 4) - ((gy2 + 99) ~/ 100) + ((gy2 + 399) ~/ 400) + gd + gdm[gm - 1];
  jy = -1595 + (33 * (days ~/ 12053));
  days %= 12053;
  jy += 4 * (days ~/ 1461);
  days %= 1461;
  if (days > 365) {
    jy += ((days - 1) ~/ 365);
    days = (days - 1) % 365;
  }
  if (days < 186) {
    jm = 1 + (days ~/ 31);
    jd = 1 + (days % 31);
  } else {
    jm = 7 + ((days - 186) ~/ 30);
    jd = 1 + ((days - 186) % 30);
  }
  return [jy, jm, jd];
}

List jalaliToGregorian(int jy, int jm, int jd) {
  var salA, gy, gm, gd, days;
  jy += 1595;
  days = -355668 + (365 * jy) + ((jy ~/ 33) * 8) + (((jy % 33) + 3) ~/ 4) + jd + ((jm < 7) ? (jm - 1) * 31 : ((jm - 7) * 30) + 186);
  gy = 400 * (days ~/ 146097);
  days %= 146097;
  if (days > 36524) {
    gy += 100 * (--days ~/ 36524);
    days %= 36524;
    if (days >= 365) days++;
  }
  gy += 4 * (days ~/ 1461);
  days %= 1461;
  if (days > 365) {
    gy += ((days - 1) ~/ 365);
    days = (days - 1) % 365;
  }
  gd = days + 1;
  salA = [0, 31, ((gy % 4 == 0 && gy % 100 != 0) || (gy % 400 == 0)) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  for (gm = 0; gm < 13 && gd > salA[gm]; gm++) gd -= salA[gm];
  return [gy, gm, gd];
}



void main(){
  var j, jYear, jMonth, jDay, g, gYear, gMonth, gDay;

  j = gregorianToJalali(2020, 5, 17);
  jYear = j[0];
  jMonth = j[1];
  jDay = j[2];
  print('Jalali: \t$jYear/$jMonth/$jDay');

  g = jalaliToGregorian(1399, 2, 28);
  gYear = g[0];
  gMonth = g[1];
  gDay = g[2];
  print('Gregorian: \t$gYear/$gMonth/$gDay');

}

