<h1>bad sort</h1>

<img src='bad_sort.gif'></img>
<img src='bad_sort.png'></img>

[bad sort ipfs](https://bafybeidrvbpko34bkaercy54dtdcwfjsg7nr3hbgliwytfgsd5cf3qgoo4.ipfs.infura-ipfs.io/)

``` Lua
-- bad sort
-- alexthescott
-- 22/1/21 2:10pm

-- arctic water
p1={[0]=129,1,131,140,12}
-- salty crimson
p2={[0]=130,2,136,8,7}
-- newspaper
p3={[0]=0,5,134,6,7}
-- nerds
p4={[0]=141,14,142,137,9,135}
-- gmo spider
p5={[0]=129,1,2,136,8}
-- slime green
p6={[0]=3,139,11,138,135}
-- 80s sd
p7={[0]=128,132,4,137,9}

-- new seed every day of the year 
srand(31*stat(81)+stat(82)) 

p={p1,p2,p3,p4,p5,p6,p7}
c=rnd(p)
pal(c,1)

function cmp(a,b,d)
 -- d==0 is pixel color a>b
 -- d==1 is pixel color a<b
 if(b[2]>=128or b[1]>=128)return false
 if d==0 then
 	return pget(a[1],a[2])>pget(b[1],b[2])
	else
		return pget(a[1],a[2])<pget(b[1],b[2])
	end
end

function sort(a,b)
	if cmp(a,b,1) then
		t=pget(a[1],a[2])
		pset(a[1],a[2],pget(b[1],b[2]))
		pset(b[1],b[2],t)
	end
end

cls()

for x=0,128 do
	for y=0,128 do
		pset(x,y,rnd(5)\1)
		pset(x,y,rnd(5)\1)
	end
end


d=1
h=false
play=0
auto=900+rnd(900)\1

_set_fps(60)
::♥::

for i=1,1024 do
	a={rnd(128)\1,rnd(128)\1}
	if h==true then
		b={a[1],a[2]+d}
	else
		b={a[1]+d,a[2]}
	end
	sort(a,b,1)
end

if btn(⬆️) then
	d,h,play=1,true,1800
elseif btn(⬇️) then
	d,h,play=-1,true,1800
elseif btn(⬅️) then
	d,h,play=1,false,1800
elseif btn(➡️) then
	d,h,play=-1,false,1800
end

if play>0 then
	play-=1
elseif auto>0 then
	auto-=1
else
	d*=-1
	h=rnd()<0.5
	auto=900+rnd(900)\1
end

goto ♥
```