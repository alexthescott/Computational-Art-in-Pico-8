<h1>sin orbit</h1>

<img src='sin_orbit.gif'></img>
<img src='sin_orbit.png'></img>

[sin orbit ipfs](https://cloudflare-ipfs.com/ipfs/QmcksVxGxbAqrBXcKoPSyVAYHduNJ93Z8fLDdLYyxN3NFm/)

``` Lua
-- sin orbit
-- alexthescott
-- 8/16/21

o={}
r=rnd
pal({7,10,9,8,-8,2,-15,1,-13,-4,12,6},1)

for n=6,1,-1 do
	add(o,{0,n/200})
end

cls()
::♥::
if t()<2 then
	print("sin orbit",46,64,1)
	
else
	for p=0,1024 do
		pset(r(128),r(128),0)
	end
	
	for n=1,6 do
		x=64+n*9*(sin(o[n][1]))
		y=64+n*9*(-cos(o[n][1]))
		circfill(x,y,5,n)
		circfill(-x+128,y,5,6+n)
		o[n][1]+=o[n][2]
		
		if o[n][1] >= 16 then
			o[n][1]=0
		end
		
	end
	
	circ(64,64,63,7)flip()
end
goto ♥
```