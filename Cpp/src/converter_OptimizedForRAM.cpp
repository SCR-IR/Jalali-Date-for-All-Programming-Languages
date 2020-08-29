

/**  Gregorian & Jalali (Hijri_Shamsi,Solar) Date Converter Functions
Author: JDF.SCR.IR =>> Download Full Version :  http://jdf.scr.ir/jdf
License: GNU/LGPL _ Open Source & Free :: Version: 2.80 : [2020=1399]
---------------------------------------------------------------------
355746=361590-5844 & 361590=(30*33*365)+(30*8) & 5844=(16*365)+(16/4)
355666=355746-79-1 & 355668=355746-79+1 &  1595=605+990 &  605=621-16
990=30*33 & 12053=(365*33)+(32/4) & 36524=(365*100)+(100/4)-(100/100)
1461=(365*4)+(4/4) & 146097=(365*400)+(400/4)-(400/100)+(400/400)  */

long *gregorian_to_jalali(long gy, long gm, long gd, long out[]) {
  out[0] = (gm > 2) ? (gy + 1) : gy;
  {
    long g_d_m[12] = {0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334};
    out[3] = 355666 + (365 * gy) + ((int)((out[0] + 3) / 4)) - ((int)((out[0] + 99) / 100)) + ((int)((out[0] + 399) / 400)) + gd + g_d_m[gm - 1];
  }
  out[0] = -1595 + (33 * ((int)(out[3] / 12053)));
  out[3] %= 12053;
  out[0] += 4 * ((int)(out[3] / 1461));
  out[3] %= 1461;
  if (out[3] > 365) {
    out[0] += (int)((out[3] - 1) / 365);
    out[3] = (out[3] - 1) % 365;
  }
  if (out[3] < 186) {
    out[1]/*jm*/ = 1 + (int)(out[3] / 31);
    out[2]/*jd*/ = 1 + (out[3] % 31);
  } else {
    out[1]/*jm*/ = 7 + (int)((out[3] - 186) / 30);
    out[2]/*jd*/ = 1 + ((out[3] - 186) % 30);
  }
  return out;
}

long *jalali_to_gregorian(long jy, long jm, long jd, long out[]) {
  jy += 1595;
  out[2] = -355668 + (365 * jy) + (((int)(jy / 33)) * 8) + ((int)(((jy % 33) + 3) / 4)) + jd + ((jm < 7) ? (jm - 1) * 31 : ((jm - 7) * 30) + 186);
  out[0] = 400 * ((int)(out[2] / 146097));
  out[2] %= 146097;
  if (out[2] > 36524) {
    out[0] += 100 * ((int)(--out[2] / 36524));
    out[2] %= 36524;
    if (out[2] >= 365) out[2]++;
  }
  out[0] += 4 * ((int)(out[2] / 1461));
  out[2] %= 1461;
  if (out[2] > 365) {
    out[0] += (int)((out[2] - 1) / 365);
    out[2] = (out[2] - 1) % 365;
  }
  long sal_a[13] = {0, 31, ((out[0]%4 == 0 && out[0]%100 != 0) || (out[0]%400 == 0))?29:28 , 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
  for (out[2]++, out[1] = 0; out[1] < 13 && out[2] > sal_a[out[1]]; out[1]++) out[2] -= sal_a[out[1]];
  return out;
}

