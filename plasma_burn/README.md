<h1>plasma burn</h1>

<img src='plasma_burn.gif'></img>
<img src='plasma_burn.png'></img>

[plasma burn ipfs](https://bafybeibeye7bl353iu7wx2vu7j5vihwoxrydkpoolsni232zjg6ckkbi34.ipfs.infura-ipfs.io/)

``` Lua
-- plasma burn
-- alexthescott
-- 1/27/21

pal({[0]=12,140,129,1,133,130,2,136,8,137,142,14,143,15,135,7},1)

-- new seed every day of the year 
srand(31*stat(81)+stat(82)) 

cls()
_set_fps(60)
x_off=rnd()
y_off=rnd()
f1=1+rnd()
f2=4+rnd(2)
f3=2+rnd(1)
::♥::
for i=0,542 do
	x=rnd(128)\1
	y=rnd(128)\1
	c=f1*2*sqrt(2)
	j2=3.14*cos(f3*x/2)*3.14*sin(f2)
	j3=3.14*sin(f2*y/2)*3.14*cos(f2)
	v1=(c*sin(x/2048*j2+x_off+t()/96))
	v2=(c*cos(y/2048*j3+y_off+t()/512))
	v1+=(x-64)/32
	v2+=(y-64)/32
	pset(x,y,((v1*v2)/2))
end
flip()
goto ♥
```