


# Gregorian & Jalali ( Hijri_Shamsi , Solar ) Date Converter  Functions
# Author: JDF.SCR.IR =>> Download Full Version :  http://jdf.scr.ir/jdf
# License: GNU/LGPL _ Open Source & Free :: Version: 2.80 : [2020=1399]
# ---------------------------------------------------------------------
# 355746=361590-5844 & 361590=(30*33*365)+(30*8) & 5844=(16*365)+(16/4)
# 355666=355746-79-1 & 355668=355746-79+1 &  1595=605+990 &  605=621-16
# 990=30*33 & 12053=(365*33)+(32/4) & 36524=(365*100)+(100/4)-(100/100)
# 1461=(365*4)+(4/4)   &   146097=(365*400)+(400/4)-(400/100)+(400/400)

gregorian_to_jalali = function(gy, gm, gd) {
  g_d_m = c(0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334)
  gy2 = ifelse((gm > 2), gy + 1, gy)
  days = 355666 + (365 * gy) + ((gy2 + 3) %/% 4) - ((gy2 + 99) %/% 100) + ((gy2 + 399) %/% 400) + gd + g_d_m[gm]
  jy = -1595 + (33 * (days %/% 12053))
  days = days %% 12053
  jy = jy + (4 * (days %/% 1461))
  days = days %% 1461
  if (days > 365) {
    jy = jy + ((days - 1) %/% 365)
    days = (days - 1) %% 365
  }
  if (days < 186) {
    jm = 1 + (days %/% 31)
    jd = 1 + (days %% 31)
  } else {
    jm = 7 + ((days - 186) %/% 30)
    jd = 1 + ((days - 186) %% 30)
  }
  return(c(jy, jm, jd))
}

jalali_to_gregorian = function(jy, jm, jd) {
  jy = jy + 1595
  days = -355668 + (365 * jy) + ((jy %/% 33) * 8) + (((jy %% 33) + 3) %/% 4) + jd + ifelse((jm < 7), (jm - 1) * 31, ((jm - 7) * 30) + 186)
  gy = 400 * (days %/% 146097)
  days = days %% 146097
  if (days > 36524) {
    days = days - 1
    gy = gy + (100 * (days %/% 36524))
    days = days %% 36524
    if (days >= 365) days = days + 1
  }
  gy = gy + (4 * (days %/% 1461))
  days = days %% 1461
  if (days > 365) {
    gy = gy + ((days - 1) %/% 365)
    days = (days - 1) %% 365
  }
  gd = days + 1
  sal_a = c(0, 31, ifelse(((gy%%4 == 0 && gy%%100 != 0) || (gy%%400 == 0)),29,28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
  gm = 0
  while (gm < 13 && gd > sal_a[gm + 1]) {
    gd = gd - sal_a[gm + 1]
    gm = gm + 1
  }
  return(c(gy, gm, gd))
}



# Example:

j = gregorian_to_jalali(2020,5,17)
cat("Jalali: \t", j[1], "/" ,j[2] ,"/" ,j[3], "\n")

g = jalali_to_gregorian(1399,2,28)
cat("Gregorian: \t", g[1], "/" ,g[2] ,"/" ,g[3], "\n")

