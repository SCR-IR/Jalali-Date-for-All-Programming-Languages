<?php /** In The Name Of Allah
        Please Download Last Version From:
        http://jdf.scr.ir/jdf/
        http://jdf.scr.ir/download/
*/








date_default_timezone_set('Asia/Tehran');


list($gy,$gm,$gd)=explode('-',date('Y-n-d'));

//تست تبدیل از میلادی به هجری شمسی
$j_date_array=gregorian_to_jalali($gy,$gm,$gd); //خروجی آرایه
$j_date_string=gregorian_to_jalali($gy,$gm,$gd,'/'); //خروجی رشته




list($jy,$jm,$jd)=$j_date_array;

//تست معکوس تبدیل از هجری شمسی به میلادی
$g_date_array=jalali_to_gregorian($jy,$jm,$jd); //خروجی آرایه
$g_date_string=jalali_to_gregorian($jy,$jm,$jd,'-'); //خروجی رشته



echo $j_date_string.'<br>'.$g_date_string; //چاپ خروجی رشته ای



/** Gregorian & Jalali (Hijri_Shamsi,Solar) Date Converter Functions
Author: JDF.SCR.IR =>> Download Full Version : http://jdf.scr.ir/jdf
License: GNU/LGPL _ Open Source & Free _ Version: 2.72 : [2017=1396]
--------------------------------------------------------------------
1461 = 365*4 + 4/4   &  146097 = 365*400 + 400/4 - 400/100 + 400/400
12053 = 365*33 + 32/4    &    36524 = 365*100 + 100/4 - 100/100   */


function gregorian_to_jalali($gy,$gm,$gd,$mod=''){
 $g_d_m=array(0,31,59,90,120,151,181,212,243,273,304,334);
 if($gy>1600){
  $jy=979;
  $gy-=1600;
 }else{
  $jy=0;
  $gy-=621;
 }
 $gy2=($gm>2)?($gy+1):$gy;
 $days=(365*$gy) +((int)(($gy2+3)/4)) -((int)(($gy2+99)/100)) +((int)(($gy2+399)/400)) -80 +$gd +$g_d_m[$gm-1];
 $jy+=33*((int)($days/12053)); 
 $days%=12053;
 $jy+=4*((int)($days/1461));
 $days%=1461;
 if($days > 365){
  $jy+=(int)(($days-1)/365);
  $days=($days-1)%365;
 }
 $jm=($days < 186)?1+(int)($days/31):7+(int)(($days-186)/30);
 $jd=1+(($days < 186)?($days%31):(($days-186)%30));
 return($mod=='')?array($jy,$jm,$jd):$jy.$mod.$jm.$mod.$jd;
}


function jalali_to_gregorian($jy,$jm,$jd,$mod=''){
 if($jy>979){
  $gy=1600;
  $jy-=979;
 }else{
  $gy=621;
 }
 $days=(365*$jy) +(((int)($jy/33))*8) +((int)((($jy%33)+3)/4)) +78 +$jd +(($jm<7)?($jm-1)*31:(($jm-7)*30)+186);
 $gy+=400*((int)($days/146097));
 $days%=146097;
 if($days > 36524){
  $gy+=100*((int)(--$days/36524));
  $days%=36524;
  if($days >= 365)$days++;
 }
 $gy+=4*((int)($days/1461));
 $days%=1461;
 if($days > 365){
  $gy+=(int)(($days-1)/365);
  $days=($days-1)%365;
 }
 $gd=$days+1;
 foreach(array(0,31,(($gy%4==0 and $gy%100!=0) or ($gy%400==0))?29:28 ,31,30,31,30,31,31,30,31,30,31) as $gm=>$v){
  if($gd<=$v)break;
  $gd-=$v;
 }
 return($mod=='')?array($gy,$gm,$gd):$gy.$mod.$gm.$mod.$gd; 
}
