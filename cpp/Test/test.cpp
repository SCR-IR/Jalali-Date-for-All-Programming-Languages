/** In The Name Of Allah
    Please Download Last Version From:
        http://jdf.scr.ir/jdf/
        http://jdf.scr.ir/download/
*/





//#include <iostream.h>

#include <iostream>
using namespace std;



/** Gregorian & Jalali (Hijri_Shamsi,Solar) Date Converter Functions
Author: JDF.SCR.IR =>> Download Full Version : http://jdf.scr.ir/jdf
License: GNU/LGPL _ Open Source & Free _ Version: 2.72 : [2017=1396]
--------------------------------------------------------------------
1461 = 365*4 + 4/4   &  146097 = 365*400 + 400/4 - 400/100 + 400/400
12053 = 365*33 + 32/4    &    36524 = 365*100 + 100/4 - 100/100   */


long* gregorian_to_jalali(long gy,long gm,long gd,long out[]){
 long jy;
 long g_d_m[12]={0,31,59,90,120,151,181,212,243,273,304,334};
 if(gy>1600){
  jy=979;
  gy-=1600;
 }else{
  jy=0;
  gy-=621;
 }
 long gy2=(gm>2)?(gy+1):gy;
 long days=(365*gy) +((int)((gy2+3)/4)) -((int)((gy2+99)/100)) +((int)((gy2+399)/400)) -80 +gd +g_d_m[gm-1];
 jy+=33*((int)(days/12053));
 days%=12053;
 jy+=4*((int)(days/1461));
 days%=1461;
 if(days > 365){
  jy+=(int)((days-1)/365);
  days=(days-1)%365;
 }
 long jm=(days < 186)?1+(int)(days/31):7+(int)((days-186)/30);
 long jd=1+((days < 186)?(days%31):((days-186)%30));
 out[0]=jy;
 out[1]=jm;
 out[2]=jd;
 return out;
}


long* jalali_to_gregorian(long jy,long jm,long jd,long out[]){
 long gy;
 if(jy>979){
  gy=1600;
  jy-=979;
 }else{
  gy=621;
 }
 long days=(365*jy) +(((int)(jy/33))*8) +((int)(((jy%33)+3)/4)) +78 +jd +((jm<7)?(jm-1)*31:((jm-7)*30)+186);
 gy+=400*((int)(days/146097));
 days%=146097;
 if(days > 36524){
  gy+=100*((int)(--days/36524));
  days%=36524;
  if(days >= 365)days++;
 }
 gy+=4*((int)(days/1461));
 days%=1461;
 if(days > 365){
  gy+=(int)((days-1)/365);
  days=(days-1)%365;
 }
 long gd=days+1;
 long sal_a[13]={0,31,((gy%4==0 && gy%100!=0) || (gy%400==0))?29:28,31,30,31,30,31,31,30,31,30,31};
 long gm;
 for(gm=0;gm<13;gm++){
  long v=sal_a[gm];
  if(gd <= v)break;
  gd-=v;
 }
 out[0]=gy;
 out[1]=gm;
 out[2]=gd;
 return out;
}



int main(){
	
 long y_in,m_in,d_in,ymd_out[3];
 char tabdil;
	
 while(1){
	
	cout<<"----------------------------------\n\nif gregorian_to_jalali -> press: g\nor jalali_to_gregorian -> press: j\nand finish -> press: e\n";
	cin >> tabdil;
	if(tabdil=='e')break;//exit
	
	cout << "enter Day: ";
	cin >> d_in;
	cout << "enter Month: ";
	cin >> m_in;
	cout << "enter Year: ";
	cin >> y_in;
	
	if(tabdil=='g'){
		cout << "----------------------------------\n gregorian: " << y_in << "-" << m_in << "-" << d_in << "\n";
		gregorian_to_jalali(y_in,m_in,d_in,ymd_out);
		cout << "jalali: " << ymd_out[0] << "/" << ymd_out[1] << "/" << ymd_out[2] << "\n";
	}else{
		cout << "----------------------------------\n jalali: " << y_in << "/" << m_in << "/" << d_in << "\n";
		jalali_to_gregorian(y_in,m_in,d_in,ymd_out);
		cout << "gregorian: " << ymd_out[0] << "-" << ymd_out[1] << "-" << ymd_out[2] << "\n";
	}
	
 }
 
 return 0;
}


	/*
	cin>>tarikh[0];
	int tarikh_j[3];
	gregorian_to_jalali(2016,11,11,tarikh_j);
	int jy=tarikh_j[0];
	int jm=tarikh_j[1];
	int jd=tarikh_j[2];
	cout << jy << "/" << jm << "/" << jd << "\n";
	
	/* int* tarikh_j2=gregorian_to_jalali(2016,11,11,tarikh_j);*/
/*
	int tarikh_g[3];
	jalali_to_gregorian(1395,8,21,tarikh_g);
	int gy=tarikh_g[0];
	int gm=tarikh_g[1];
	int gd=tarikh_g[2];
	cout << gy << "-" << gm << "-" << gd << "\n";

	/* int* tarikh_g2=jalali_to_gregorian(1395,8,21,tarikh_g); */
