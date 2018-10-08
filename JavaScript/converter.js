/** In The Name Of Allah
    Please Download Last Version From:
        http://jdf.scr.ir/jdf/
        http://jdf.scr.ir/download/
*/





/** Gregorian & Jalali (Hijri_Shamsi,Solar) Date Converter Functions
Author: JDF.SCR.IR =>> Download Full Version : http://jdf.scr.ir/jdf
License: GNU/LGPL _ Open Source & Free _ Version: 2.72 : [2017=1396]
--------------------------------------------------------------------
1461 = 365*4 + 4/4   &  146097 = 365*400 + 400/4 - 400/100 + 400/400
12053 = 365*33 + 32/4    &    36524 = 365*100 + 100/4 - 100/100   */


function gregorian_to_jalali(gy,gm,gd){
 g_d_m=[0,31,59,90,120,151,181,212,243,273,304,334];
 if(gy > 1600){
  jy=979;
  gy-=1600;
 }else{
  jy=0;
  gy-=621;
 }
 gy2=(gm > 2)?(gy+1):gy;
 days=(365*gy) +(parseInt((gy2+3)/4)) -(parseInt((gy2+99)/100)) +(parseInt((gy2+399)/400)) -80 +gd +g_d_m[gm-1];
 jy+=33*(parseInt(days/12053)); 
 days%=12053;
 jy+=4*(parseInt(days/1461));
 days%=1461;
 if(days > 365){
  jy+=parseInt((days-1)/365);
  days=(days-1)%365;
 }
 jm=(days < 186)?1+parseInt(days/31):7+parseInt((days-186)/30);
 jd=1+((days < 186)?(days%31):((days-186)%30));
 return [jy,jm,jd];
}


function jalali_to_gregorian(jy,jm,jd){
 if(jy > 979){
  gy=1600;
  jy-=979;
 }else{
  gy=621;
 }
 days=(365*jy) +((parseInt(jy/33))*8) +(parseInt(((jy%33)+3)/4)) +78 +jd +((jm<7)?(jm-1)*31:((jm-7)*30)+186);
 gy+=400*(parseInt(days/146097));
 days%=146097;
 if(days > 36524){
  gy+=100*(parseInt(--days/36524));
  days%=36524;
  if(days >= 365)days++;
 }
 gy+=4*(parseInt(days/1461));
 days%=1461;
 if(days > 365){
  gy+=parseInt((days-1)/365);
  days=(days-1)%365;
 }
 gd=days+1;
 sal_a=[0,31,((gy%4==0 && gy%100!=0) || (gy%400==0))?29:28,31,30,31,30,31,31,30,31,30,31];
 for(gm=0;gm<13;gm++){
  v=sal_a[gm];
  if(gd <= v)break;
  gd-=v;
 }
 return [gy,gm,gd]; 
}
