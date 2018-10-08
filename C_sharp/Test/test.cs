using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int[] out2= { 0, 0, 0 };
            int[] tt2 = jalali_to_gregorian(1396,11,22, out2); //Example: 1396/11/22

            MessageBox.Show(tt2[0] + "-" + tt2[1] + "-" + tt2[2], "Date");
        }













/** Gregorian & Jalali (Hijri_Shamsi,Solar) Date Converter Functions
Author: JDF.SCR.IR =>> Download Full Version : http://jdf.scr.ir/jdf
License: GNU/LGPL _ Open Source & Free _ Version: 2.72 : [2017=1396]
--------------------------------------------------------------------
1461 = 365*4 + 4/4   &  146097 = 365*400 + 400/4 - 400/100 + 400/400
12053 = 365*33 + 32/4    &    36524 = 365*100 + 100/4 - 100/100   */


 public int[] gregorian_to_jalali(int gy, int gm, int gd, int[] @out){
  int jy;
  int[] g_d_m = { 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334 };
  if(gy > 1600){
   jy = 979;
   gy -= 1600;
  }else{
   jy = 0;
   gy -= 621;
  }
  int gy2 = (gm > 2) ? (gy + 1) : gy;
  int days = (365 * gy) + ((int)((gy2 + 3) / 4)) - ((int)((gy2 + 99) / 100)) + ((int)((gy2 + 399) / 400)) - 80 + gd + g_d_m[gm - 1];
  jy += 33 * ((int)(days / 12053));
  days %= 12053;
  jy += 4 * ((int)(days / 1461));
  days %= 1461;
  if(days > 365){
   jy += (int)((days - 1) / 365);
   days = (days - 1) % 365;
  }
  int jm = (days < 186) ? 1 + (int)(days / 31) : 7 + (int)((days - 186) / 30);
  int jd = 1 + ((days < 186) ? (days % 31) : ((days - 186) % 30));
  @out[0] = jy;
  @out[1] = jm;
  @out[2] = jd;
  return @out;
 }


 public int[] jalali_to_gregorian(int jy, int jm, int jd, int[] @out){
  int gy;
  if(jy > 979){
   gy = 1600;
   jy -= 979;
  }else{
   gy = 621;
  }
  int days = (365 * jy) + (((int)(jy / 33)) * 8) + ((int)(((jy % 33) + 3) / 4)) + 78 + jd + ((jm < 7) ? (jm - 1) * 31 : ((jm - 7) * 30) + 186);
  gy += 400 * ((int)(days / 146097));
  days %= 146097;
  if(days > 36524){
   gy += 100 * ((int)(--days / 36524));
   days %= 36524;
   if(days >= 365)days++;
  }
  gy += 4 * ((int)(days / 1461));
  days %= 1461;
  if(days > 365){
   gy += (int)((days - 1) / 365);
   days = (days - 1) % 365;
  }
  int gd = days + 1;
  int[] sal_a = { 0, 31, ((gy % 4 == 0 && gy % 100 != 0) || (gy % 400 == 0)) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
  int gm;
  for(gm = 0; gm < 13; gm++){
   int v = sal_a[gm];
   if(gd <= v)break;
   gd -= v;
   }
   @out[0] = gy;
   @out[1] = gm;
   @out[2] = gd;
   return @out;
 }



}
}


        /*
        //static int Main()
        

            int y_in;
            int m_in;
            int d_in;
            int[] ymd_out = new int[3];
            sbyte tabdil;

            //while(true)
            {


                Console.Write("----------------------------------\n\nif gregorian_to_jalali -> press: g\nor jalali_to_gregorian -> press: j\nand finish -> press: e\n");
                cin >> tabdil;
                if (tabdil == 'e') //exit
                    break;

                Console.Write("enter Day: ");
                cin >> d_in;
                Console.Write("enter Month: ");
                cin >> m_in;
                Console.Write("enter Year: ");
                cin >> y_in;


                if (tabdil == 'g')
                {
                    Console.Write("----------------------------------\n gregorian: ");
                    Console.Write(y_in);
                    Console.Write("-");
                    Console.Write(m_in);
                    Console.Write("-");
                    Console.Write(d_in);
                    Console.Write("\n");
                    GlobalMembersJdf.gregorian_to_jalali(y_in, m_in, d_in, ymd_out);
                    Console.Write("jalali: ");
                    Console.Write(ymd_out[0]);
                    Console.Write("/");
                    Console.Write(ymd_out[1]);
                    Console.Write("/");
                    Console.Write(ymd_out[2]);
                    Console.Write("\n");
                }
                else
                {
                    Console.Write("----------------------------------\n jalali: ");
                    Console.Write(y_in);
                    Console.Write("/");
                    Console.Write(m_in);
                    Console.Write("/");
                    Console.Write(d_in);
                    Console.Write("\n");
                    GlobalMembersJdf.jalali_to_gregorian(y_in, m_in, d_in, ymd_out);
                    Console.Write("gregorian: ");
                    Console.Write(ymd_out[0]);
                    Console.Write("-");
                    Console.Write(ymd_out[1]);
                    Console.Write("-");
                    Console.Write(ymd_out[2]);
                    Console.Write("\n");
                }

            }


            return 0;


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
        //}
 
