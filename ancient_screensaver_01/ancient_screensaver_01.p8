pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
-- ancient screensaver 01
-- #pico8
pal({[0]=9,7},1)
cls()
r=rnd
t=r()
::♥::
for i=0,512 do
x=r(128)\1
y=r(128)\1
v=(1+sin(t+(y-63)/142-x/3))-cos(t+x/156*(y-64)/55)
v=abs(v)
if v<2 then
pset(x,y,v)
end
end
t-=.0015
flip()
goto ♥
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
99999999999799799799799799779779779779779779979779979799799799997797997779799799799997979799779779799779799799799799999999999999
99999999999799799799999999779779779779779779779779779799799799797799997999799779999997977999779779779779799799799799799999999999
99999999999999999799999799779779979779779779979979799999799799799799797799799999999799779979779779779779799779799779779999999999
99999999999999999799799999779779979779779799779779779799799799799997797799799799999979779999999779779779779779779779799999979979
99999999999999999999999979799779779979779779779779799799799799799999797799799799999799799779799999799779779779779799799799999999
99999999999999999999999779979779979979779779779779779779799799799999797797799799997997799799799779779779799779779779779779979999
99999999999999999999999779979979779779779979779799779979799799799799797797797999799799799799999999779779779779799779779779979999
99999999999999999999999979979779979779979779779779799799799799799799799999799799999799999799797799799799779799779779779779779999
79999999999999999999999979779779979779779779779779799799799799799799799797797797797797799799997799797799799799779779779779799979
99999999999999999999979979779979779979979979979979779999799799799799799797797997797799999799997799799779779799779779799779799979
99999999999999999999979979979979979779979799779779779799799799999799999797997797799797799797799797799799799777779799779779779779
99999999999999999999979979979779979779979979779779799799799799799799799997797797799797799999799799797799799799799779779979779779
99999999999999999999979979979979979779779779779979979779799779799999999799797797797797797799799997799799799779799779799799779799
99999999999999999979979979979979779999979979979979799779779779799999799799797797797797797799797999799799799799799777799779777779
99999999999999999979979979999979979779979779779779779779799799799799999799797797797797997797799797797799799797799779779799799799
99999999999999999979979979979979999779779779779979779779779999999799799799797797797797797997997797799797799999799799799797799779
99999999999999979979979979979999999979779979779779779779799799779799779799797997797797997797997797797799799799799799799799799799
99999999999979979979979999979979979779779779979779779779979979999999799799797797797797797797797799797797799799799799799797799799
99999999999979979979979979979979979979779979779979799779779779799799799799797797797797797797797797797797797799799799799799799797
99999999999979979979979979979979979999979779979979779779779779779779799999797797797797797797797797797797797797799797799799799799
99999979999979979979979979979979979979979979979979979979779799779979779979797797797797797797997997797797797797799799799799999799
79999999979979979979979979979979979979979979779979979999799779779779799979797797797797797797797997799797797797797799997797797797
99999979979979979979979999979979999979979979979979979979979799979979779799799797797797797797997797797797797797797797797799797797
99999979979979979979979979979979979979979979979979979979799979979779799799799779777797797797797797797797797797797797799999797797
99999999979979979979979999979979979979979979979979979979979979779779779979979977797997997797797797797797797797797797797797797797
99999979979999979979979999979979979979979979979979979979779979979979799979979797797997777797797797797797797797797797997797797797
99999979979979979999999979979979979979979979999979979979979979979979979999779997777997797797997797797797797997797797797797797797
79979999979979979979979979979979979979979979979979979979979979779979779779779997777797777997797797797797797797797797797797797797
79999999999979979979979979999979999979979979979979979979979979979979979799999977977997799797777997797797797797997797797797797797
79979999999979999999979999979979979979979979979979979979979999979979779979979979977797777977777777977997797797797797797797797797
79999979999979979979979979979979979999979979999979979979979979979979979979979979777977997997977777797997777797777797797797797797
99979979999999999979979979979979979979999979979979979979999979979979999979979979977997797777797797977797797777777777797797797797
79979999999999999979999979979979979979979979979979979979979979999979979979979979777977777777977997797797997797777797977797797797
99979999999999979979999979979999979979979979979979979979979979979979979979979979977997977977777777977977777799797977797797797797
79999979979979999999999999979979979979979979979979979979999979979979979979979979979977977977777777977777977977777777797999777997
99999979979979999979979999999999979979979979979999979979979979999979979979979979999977977997977997977977977777797797797777777997
99979979999979999979979979999979999979979999999979979979979979979979979979979979979977977977977977977777777797777997977977977977
99999999999999999979979979999979999979979999999979979999979979979979979979979979979977977997977977977977977977777977977997777777
99999999999979999999979999979979979979979979979979999979979979979979979979979979979979977977977977977977977977999977977777997977
99979999999999999979999979979979979999979979979979979979999999979979999999979979999979977977977977977977977977997997997977977977
99999999999979999999999999979999999999999979979979979979979999979979999979979979979979977977997997977997999977997977977977997977
99999999999999999979979999999999979979999979979979979979979999979999979979999999979979979977977977977977977977997977977977977977
99999999999999999979999999979999999979999979979979979979979999979999979979979979979979979977997977977977977977977977997977997977
99999999999999999979999999999999999999979999979999999979979999979999999979979979979979999979977997977977977997977977977977997977
99999999999999999999999999999999979979979999979979979979999999999979979979979979979979999979997977977977977977977977977977977979
99999999999999999999999999999999979999999999999999979979979979979979999979999999999979979979979997977977977997977977977997977997
99999999999999999999999999999999999979979999979979979999979979979999979979979999979979999979979977977977977977979977977977977977
99999999999999999999999999999999999999999979999999979979979999999999979979979979979979999979979999977977977977977977977999977977
99999999999999999999999999999999999999999979999999999999979979979999979979999979979979999979979979999977997977997997977977997977
99999999999999999999999999997999999999999999999979999979999999999999979979999999999979979999979999979979977977977977977997977997
99999999999999999999999999997999999999999999999999999999979999999999999999999999979999999979999979999979999977977977997977977977
99999999999999999999999999999999999999999999999999999999999999999999999999999979979979999999999999999999999979997997999977997977
97999999999999999999999999997999999999999999999999999999999999999999999999979979999999999999999979999999999979999977977997997977
99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999979979999999979979999999979979997977997
99999997999999999999999999999999999999999999999999999999999999999999999999999999997999999999999999979999999999999999979999999977
99999999999999999999999999999999999999999999999999999999999999999999997999999999999999999999999999999999999999999999999999999999
99999999999999997999999999999999999999999999999997999999999999999999999999999999999999999999999999999999999999999999999999999999
99999999999999999999999999999999999999999999999999997999999997999999999997999999999999999999999999999999999999999999999999999999
99999999997999999999997999999999999999999999999999999999997999999999999999999999999999999999999999999999999999999999999999999999
97999999999999999999999999999999997999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
99999999997997999999999999999999999999999997999999999999999999999999999999999999999999999999999999999999999999999999999999999999
99999999999999999999999999999999999999999999999999999999999999999999999999999997999997999999999999997999997999999999999999999999
99999999999997999999999999999999997999999997999999999999997999999999999997999999999997999999999999999999999999999999999999999999
99999999999999999999997999999997999999999999999999997999999999999999999999999999999999997999997999999999999999999999999999999999
99997999999999999999999997999999999997999999999999999999999999999999997999999999999997999999997997999999999999997997997999999999
97999999997999999999999999999997999999999997999999999997999997999999997999999997999997999999999999999999997999999999999999999999
99997999997997999999999997999997999999999997999997999997999999999999999999999997999999999997999997999997999999999999999999999999
97999999999999999997999999997999999999999999997999997999999997999999999999997999999999999999999997999997999997997999999999999999
97999999999999999999999997999999999997997999997999997999999999999999997999999997999999999999997999999997997997997999999999997999
99999997999999999999999999999999999999999999999999999999999999997999997997997999999999999999997997997997999997997997999999999997
97999999997999997999999999999999999997999999997999999997999999999999997997999997999997997999999999997999997997997999999999997997
99997997999999999997999999999997999999997999997997997997999997997999997997999997999999999999999997997997999997999997997997999997
99999999999997999999997997999997999999997999997997997997999999999999999997999999997997997997997997997999997997997997997997997997
99999999999997997999999999999999999999999999997999999997997997999997997997999997999997999997997997997997997997997997997997997997
97997997997999999999999999999999999999997997997997997999997997997997997997997997997997997997997997997997997997997997997997997997
99999999999999997997999999997997999999999997997997997997997997997997997997997997997997997997997997997997997997997997997997997997
97997997997999997997999997999999997999997997997997997997997999997997997997997997997997997997997997997997997997997999997997997997
99999997999999997997999997997999997997997997997997997997997997997997997997997997997997997997997997997997997997997997997997997997
99999999997999997999997997997997997997997997997997997997997997997997997997997997797997997997997997997997997997997997997997997997
97997999999999999997999997999997997997997997997997997997997997997997799997997997997997997997997997997997997997997997997997797997
97997997999999999999997997997997997997997999997997997997997997997997997997997997997997997997997997997997997997997997997997997997
99999999999999999999997997997997997997997997997997997997997997997997997997797997797999997997997997997997997997997997997997997997
97999999999999999999999997997997997997997997997997997997997997997997997997997997997997797997997997997997997997997997997999999999
97999999999999999999999999997997997997997997997997997997997997997797997997997997997997997997997997997997997997999997797999999999
99999999999999999999999999997997997997997997997997997997997997997997997997997997997797997997997999797997797799999997999997999799
97999999999999999999999999999997997997997997997997997997997997797997997997997997997997997797797997797997997997799999799799799999
99999999999999999999999999999997999997997997997999999997997997997997997997997997997997997997997999799997997799799999999799799799
99999999999999999999999999999999997997997997997997997997997997997997997997797997797997797997997997999797797799799799999799799799
99999999999999999799999999999999997997997797997997997997997997997997997997997997997997797997997997797997797999999799799999799799
99999999999999999999799999999999999997997797997997997997997999797997997997997797997797997797997997799799799799799999799799799799
99999999999999999999999999999999999997997997997997997997797997997997997797797797997797799997997797797799799799799799799999799999
99999999999999999799999999999799999997997997797997797997797997797997797997997997797997799797797799799799799999799799799799999799
99999999999999999999999999999999999999997997997997997797997797997997997997797797797797997797999797799799799799999999799799799999
99999999999999999999999999999999999999997997997797997997997997997797797797997797797997797997797997799799797799799799799999779999
99999999999999999999999799999999799799797997997997997997997797797999997797997797997797797797799997799799799999799799797977999799
99999999999999999999999999999999999999997997997797997997797797797997797797797997997797797797799799777997799799999797799979977977
99999999999999999999999999799799799799997797997997997997797797797797797797797797797997797797797799999799999799999997997799977977
99999999999999999999999999799999999999799797797997997997997997997997997797797997797999797797797797797997999979997999999997999999
99999999999999999999999799999999999799999997797997997797997797797797997797997797797797797797997999997999997997997979997999997977
99999999999999999999999999999999999999999997997997997797797997797797997997797797797997797997997999997997997997997999997997997997
99999999999999999999999999799999799999999997997797797797799797797797797797797797797797997997997997997997999997977999977997997977
99999999999999999999999999999999999999999999997997997797797797799797797997997797777799797799997997997997997997997997977979977997
99999999999999999999999999999799799999999799997797797797797797797797797797997797997797977997997977999997999997997997977997997977
99999999799999999999999999999799999999799799797797797977997797997797797797997997997997997997997977977997979979977977997997997997
99999799999999999999999999999799799799799799797797799797797797797997797997997777977997997997997997997997997997977997999997999999
99999999999999799999799999799799999799799799797797797797797777997797777997997997997999999997977999997997997997977977999997997997
99999999999999999999999999799999999999799799797997797797997797797997997997997997997997977997977997977977977979977997997997997997
99999999799999999799999799999799799799799799797797797797797977997797797997997977977997997977977977977977977977977997997997997997
99999999999999999999999799999999799799799799797777797997797797997997997997997997977997997997977977977977977977997997997997997997
99999999799799999999999799799999799799799999997997797797797999997977997997997997997977977977997977977977977977997997997997797997
99999999999999999799999799799799799799999799799797797797997777977997999997977997997977977997977977977977977977997997797797797999
99999799999999999999799999799799799999799999799797997997997997997997997997997997997977977977977977977977979997997997997999797799
99999999999799999799799799799799799799799799999997797777997997997997997997997977997977977977977977977977977997797997997797797797
99999799999999799799799799799779799799999999799797997997997997997977997977997977977977977977977977977977977997997997797797799797
99999999999999999799799799799799799799799999999997797997997997997997997977979977977977977977977977977977997997997999797797799797
99999799799999799799799799799799799799799799979797997977997997997997977977977977977977977997979977979977997797797997797797799997
99999999799999799799999799799799799799799799779997997997999997977997977977977977997977977977977997977977797997797797797999799799
99799999999799799799799799799999779799799779999997977997997997997977979977977977977977977977977977977977799999797799797797799799
99999799799799799799799799799999779999799999799997977977997977997977977977977977977977977979977977977999797997799799799799799799
99999999999799799799799799799799999799799799999797999997997977977997997977977977979977977977977977977997797799797999799799799799
99799799799799799799799799799799799999799799999977997997977977977977977977977977977977977977979977779997797799799799799799799799
99999999799799799799799799799779799799999999999997997997997977977977977977977977977977997977777977779799799799799799799799799799
99999799799799799799799799799799799799799999999999977997997977979977979977977977977977977977779977799999997799799799799799799799
99799799799799799799799799999799979999999999999999977977997977977977997977977979977977777777777777799999799799799799799799799999
99999999799799799799799799779799999999979999999999977997977997977977999977977979977977977779979977797799999799799799799799799799
99999799799799799799799799799999799999979999999979977977977977977977979977977977977977977979997779799799799799799799799799799799
99999999799799799799799799799799799799979999999979997977977977977977977977977977979779777779779799799999799799999799799799799799
99799999799799799799799799799799999799999979999979977997977977977977997977977779979977779977779999799799799799799799799799799799

