# In The Name Of Allah
#   Please Download Last Version From:
#     http://jdf.scr.ir/jdf/
#       http://jdf.scr.ir/download/









#!/usr/bin/ruby

# Gregorian & Jalali ( Hijri_Shamsi , Solar ) Date Converter Functions
# Author: JDF.SCR.IR =>> Download Full Version : http://jdf.scr.ir/jdf
# License: GNU/LGPL _ Open Source & Free _ Version: 2.72 : [2017=1396]
# --------------------------------------------------------------------
# 1461 = 365*4 + 4/4   &  146097 = 365*400 + 400/4 - 400/100 + 400/400
# 12053 = 365*33 + 32/4      &       36524 = 365*100 + 100/4 - 100/100


# @param [Integer] gy
# @param [Integer] gm
# @param [Integer] gd
# @return [Array Integer] [jy,jm,jd]

def gregorian_to_jalali(gy,gm,gd)
 g_d_m=[0,31,59,90,120,151,181,212,243,273,304,334]
 if gy>1600
  jy=979
  gy-=1600
 else
  jy=0
  gy-=621
 end
 gy2=(gm>2)?(gy+1):gy
 days=(365*gy) +(Integer((gy2+3)/4)) -(Integer((gy2+99)/100)) +(Integer((gy2+399)/400)) -80 +gd +g_d_m[gm-1]
 jy+=33*(Integer(days/12053))
 days%=12053
 jy+=4*(Integer(days/1461))
 days%=1461
 if days > 365
  jy+=Integer((days-1)/365)
  days=(days-1)%365
 end
 (days < 186) ? jm=1+Integer(days/31) : jm=7+Integer((days-186)/30)
 (days < 186) ? jd=1+(days%31) : jd=1+((days-186)%30)
 [jy,jm,jd]
end

# @param [Integer] jy
# @param [Integer] jm
# @param [Integer] jd
# @return [Array Integer] [gy,gm,gd]
def jalali_to_gregorian(jy,jm,jd)
 if jy>979
  gy=1600
  jy-=979
 else
  gy=621
 end
 days=(365*jy) +((Integer(jy/33))*8) +(Integer(((jy%33)+3)/4)) +78 +jd +((jm<7)?(jm-1)*31:((jm-7)*30)+186)
 gy+=400*(Integer(days/146097))
 days%=146097
 if days > 36524
  days-=1
  gy+=100*(Integer(days/36524))
  days%=36524
  days+=1 if days >= 365
 end
 gy+=4*(Integer((days)/1461))
 days%=1461
 if days > 365
  gy+=Integer((days-1)/365)
  days=(days-1)%365
 end
 gd=days+1
 gm=0
 sal_a=[0,31,((gy%4==0 and gy%100!=0) or (gy%400==0))?29:28 ,31,30,31,30,31,31,30,31,30,31]
 sal_a.each do |v|
   break if gd<=v
   gm+=1
   gd-=v
 end
 [gy,gm,gd]
end




while 1
  print "----------------------------------\n\nif gregorian_to_jalali -> press: g\nor jalali_to_gregorian -> press: j\nand finish -> 	press: Ctrl+C\n"
  tabdil = gets.chomp
  puts 'enter day: '
  day_in=Integer(gets)
  puts 'enter month: '
  month_in=Integer(gets)
  puts 'enter year: '
  year_in=Integer(gets)
print tabdil
  if (tabdil.eql?'g')
    print "----------------------------------\ngregorian: #{year_in}-#{month_in}-#{day_in}\n"
    tarikh_out=gregorian_to_jalali(year_in,month_in,day_in)
    print "jalali: #{tarikh_out[0]}/#{tarikh_out[1]}/#{tarikh_out[2]}\n"
  else
    print "----------------------------------\njalali: #{year_in}/#{month_in}/#{day_in}\n"
    tarikh_out=jalali_to_gregorian(year_in,month_in,day_in)
    print "gregorian: #{tarikh_out[0]}-#{tarikh_out[1]}-#{tarikh_out[2]}\n"
  end
end

