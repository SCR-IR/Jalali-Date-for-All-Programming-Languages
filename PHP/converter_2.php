<?php

/**  Gregorian & Jalali (Hijri_Shamsi,Solar) Date Converter Functions
Author: JDF.SCR.IR =>> Download Full Version :  http://jdf.scr.ir/jdf
License: GNU/LGPL _ Open Source & Free :: Version: 2.80 : [2020=1399]
---------------------------------------------------------------------
355746=361590-5844 & 361590=(30*33*365)+(30*8) & 5844=(16*365)+(16/4)
355666=355746-79-1 & 355668=355746-79+1 &  1595=605+990 &  605=621-16
990=30*33 & 12053=(365*33)+(32/4) & 36524=(365*100)+(100/4)-(100/100)
1461=(365*4)+(4/4) & 146097=(365*400)+(400/4)-(400/100)+(400/400)  */

function gregorian_to_jalali($gy, $gm, $gd) {
  $g_d_m = array(0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334);
  $gy2 = ($gm > 2)? ($gy + 1) : $gy;
  $days = 355666 + (365 * $gy) + ((int)(($gy2 + 3) / 4)) - ((int)(($gy2 + 99) / 100)) + ((int)(($gy2 + 399) / 400)) + $gd + $g_d_m[$gm - 1];
  $jy = -1595 + (33 * ((int)($days / 12053)));
  $days %= 12053;
  $jy += 4 * ((int)($days / 1461));
  $days %= 1461;
  if ($days > 365) {
    $jy += (int)(($days - 1) / 365);
    $days = ($days - 1) % 365;
  }
  if ($days < 186) {
    $jm = 1 + (int)($days / 31);
    $jd = 1 + ($days % 31);
  } else{
    $jm = 7 + (int)(($days - 186) / 30);
    $jd = 1 + (($days - 186) % 30);
  }
  return array($jy, $jm, $jd);
}

function jalali_to_gregorian($jy, $jm, $jd) {
  $jy += 1595;
  $days = -355668 + (365 * $jy) + (((int)($jy / 33)) * 8) + ((int)((($jy % 33) + 3) / 4)) + $jd + (($jm < 7)? ($jm - 1) * 31 : (($jm - 7) * 30) + 186);
  $gy = 400 * ((int)($days / 146097));
  $days %= 146097;
  if ($days > 36524) {
    $gy += 100 * ((int)(--$days / 36524));
    $days %= 36524;
    if ($days >= 365) $days++;
  }
  $gy += 4 * ((int)($days / 1461));
  $days %= 1461;
  if ($days > 365) {
    $gy += (int)(($days - 1) / 365);
    $days = ($days - 1) % 365;
  }
  $gd = $days + 1;
  $sal_a = array(0, 31, (($gy % 4 == 0 and $gy % 100 != 0) or ($gy % 400 == 0))?29:28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
  for ($gm = 0; $gm < 13 and $gd > $sal_a[$gm]; $gm++) $gd -= $sal_a[$gm];
  return array($gy, $gm, $gd);
}


