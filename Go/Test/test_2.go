

package main  
import "fmt" 

func main() {
  j := gregorian_to_jalali(2020, 5, 17)
  fmt.Printf( "Jalali: \t%d/%d/%d\n", j[0], j[1], j[2])
  
  g := jalali_to_gregorian(1399, 2, 28)
  fmt.Printf( "Gregorian: \t%d/%d/%d\n", g[0], g[1], g[2])
}





/**  Gregorian & Jalali (Hijri_Shamsi,Solar) Date Converter Functions
Author: JDF.SCR.IR =>> Download Full Version :  http://jdf.scr.ir/jdf
License: GNU/LGPL _ Open Source & Free :: Version: 2.80 : [2020=1399]
---------------------------------------------------------------------
355746=361590-5844 & 361590=(30*33*365)+(30*8) & 5844=(16*365)+(16/4)
355666=355746-79-1 & 355668=355746-79+1 &  1595=605+990 &  605=621-16
990=30*33 & 12053=(365*33)+(32/4) & 36524=(365*100)+(100/4)-(100/100)
1461=(365*4)+(4/4) & 146097=(365*400)+(400/4)-(400/100)+(400/400)  */

/* Return Array */
func gregorian_to_jalali(gy int, gm int, gd int) ([3]int) {
  var jy, jm, jd, gy2, days int
  var g_d_m = [12]int{0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334}
  if (gm > 2) {
    gy2 = gy + 1
  } else {
    gy2 = gy
  }
  days = 355666 + (365 * gy) + ((gy2 + 3) / 4) - ((gy2 + 99) / 100) + ((gy2 + 399) / 400) + gd + g_d_m[gm - 1]
  jy = -1595 + (33 * ((days / 12053)))
  days %= 12053
  jy += 4 * (days / 1461)
  days %= 1461
  if (days > 365) {
    jy += (days - 1) / 365
    days = (days - 1) % 365
  }
  if (days < 186) {
    jm = 1 + (days / 31)
    jd = 1 + (days % 31)
  } else {
    jm = 7 + ((days - 186) / 30)
    jd = 1 + ((days - 186) % 30)
  }
  return [3]int{jy, jm, jd}
}

/* Return Array */
func jalali_to_gregorian(jy int, jm int, jd int) ([3]int) {
  var gy, gm, gd, days int
  var sal_a = [13]int{0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
  jy += 1595
  days = -355668 + (365 * jy) + ((jy / 33) * 8) + (((jy % 33) + 3) / 4) + jd
  if (jm < 7) {
    days += (jm - 1) * 31
  } else {
    days += ((jm - 7) * 30) + 186
  }
  gy = 400 * (days / 146097)
  days %= 146097
  if (days > 36524) {
    days--
    gy += 100 * (days / 36524)
    days %= 36524
    if (days >= 365) {
      days++
    }
  }
  gy += 4 * (days / 1461)
  days %= 1461
  if (days > 365) {
    gy += (days - 1) / 365
    days = (days - 1) % 365
  }
  gd = days + 1
  if ((gy % 4 == 0 && gy % 100 != 0) || (gy % 400 == 0)) {
    sal_a[2] = 29
  }
  gm = 0
  for (gm < 13 && gd > sal_a[gm]) {
    gd -= sal_a[gm]
    gm++
  }
  return [3]int{gy, gm, gd}
}


