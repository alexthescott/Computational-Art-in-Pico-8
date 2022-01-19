<h1>lofi 3d 4</h1>

<img src='lofi_3d_4.gif'></img>
<img src='lofi_3d_4.png'></img>

[lofi 3d 4 ipfs](https://cloudflare-ipfs.com/ipfs/Qme3u4pzWXDeUxNFQhC3HRxhBwf59eeJk6NchwVN6978dk/)

``` Lua
-- lofi 3d 4
-- alexthescott
-- 11/2/21 6:09pm
-- In celebration of HEN500K :)

-- based on 3d demo
-- by @noahrosamilia

-- new seed every day of the year 
srand(31*stat(81)+stat(82)) 

p1={7,6,135,10,138,11,139,3,131,12,140,1,129,130,128,0}
p2={7,135,10,9,15,143,142,137,14,136,8,2,130,133,128,0}
p3={7,15,143,142,14,8,136,137,9,10,135,138,11,139,12,140}

p={p1,p2,p3}
c=rnd(p)

pal(c,1)

function draw_shape(s)
	for i,l in ipairs(s[2]) do
		draw_line(s[1][l[1]],s[1][l[2]],max(1,i%16))
	end
end

function draw_line(p1,p2,c)
	x0,y0=project(p1)
	x1,y1=project(p2)
	line(x0,y0,x1,y1,c)
end

function draw_point(p,c)
	x,y=project(p)
	pset(x,y,c)
end

function project(p)
	-- calculate x,y and center it
	x=(p[1]-cam[1])*mult/(p[3]-cam[3])+127/2
	y=-(p[2]-cam[2])*mult/(p[3]-cam[3])+127/2
	return x,y
end

function translate_shape(s,t)
	-- copy shape, 0 out points,
	-- keep og lines
	ns={{},s[2]}
	-- add displacement to point
	for p in all(s[1])do
		add(ns[1],{p[1]+t[1],p[2]+t[2],p[3]+t[3]})
	end
	return ns
end

function rotate_shape(s,a,r)
	-- copy shape, 0 out points
	-- keep og lines
	ns={{},s[2]}
	for p in all(s[1])do
		add(ns[1],rotate_point(p,a,r))
	end
	return ns
end

function rotate_point(p,a,r)
	-- figure axis we're rotating
	if a==1 then
		x,y,z=3,2,1
	elseif a==2 then
		x,y,z=1,3,2
	elseif a==3 then
		x,y,z=1,2,3
	end
	
	_x=cos(r)*p[x]-sin(r)*p[y]
	_y=sin(r)*p[x]+cos(r)*p[y]
	np={}
	np[x]=_x
	np[y]=_y
	np[z]=p[z]
	return np
end

function burn()
	loop_count=512
	if(burn_type) loop_count=256
	for p=0,loop_count do
		x=rnd(128)\1
		y=rnd(128)\1
		pc=pget(x,y)
		if pc!=0 then
			pset(x,y,pc-1)
			if burn_type and rnd()<0.5 then
				pset(x-1,y,pc-1)
				pset(x+1,y,pc-1)
				pset(x,y-1,pc-1)
				pset(x,y+1,pc-1)
			end
		else
			pset(x,y,0)
		end
	end
end

function forward()
	v=c[1]
	del(c,v)
	c[#c+1]=v
	pal(c,1)
end

function backward()
	v=c[#c]
	del(c,v)
	for i=#c+1,1,-1 do
		if i!=1 then
			c[i]=c[i-1]
		else
			c[i]=v
		end
	end
	pal(c,1)
end

function centr_circ(r,c)
		for x=0,128 do
			y=sqrt(r^2-(x-64)^2)+64
			line(x,128,x,y,c)
			line(x,0,x,128-y,c)
		end
end

function build_plane(shp)
	for x=-1,1,0.25 do
		for y=-1,1,0.25 do
			add(shp[1],{x,y,0})
		end
	end
	
	for x=-1,1,0.25 do
		for z=-1,1,0.25 do
			add(shp[1],{x,0,z})
		end
	end
	
	for y=-1,1,0.25 do
		for z=-1,1,0.25 do
			add(shp[1],{0,y,z})
		end
	end
	
	for p=1,#shp[1]-1 do
		if p%9!=0 then
			add(shp[2],{p,p+1})
		end
	end
end

function build_circ(shp)
	p=32
	z=0
	for i=0,p do
		x=cos(i/p)*1.1
		y=sin(i/p)*1.1
		add(shp[1],{x,y,z})
	end
	
	for p=1,#shp[1]-1 do
		if p%9!=0 then
			add(shp[2],{p,p+1})
		end
	end
end

for i=1,rnd()*16 do
	forward()
end

for p=1,24 do
	po={p,p+1}
end

cam={0,0,-2.1}
mult=64

shape={{},{}}
build_plane(shape)

o1={{},{}}
build_circ(o1)
o1=rotate_shape(o1,2,0.25)
o2={{},{}}
build_circ(o2)
o2=rotate_shape(o2,2,0.25)
o2=rotate_shape(o2,3,0.25)
o3={{},{}}
build_circ(o3)

dir=(1+rnd()*3)\1
burn_type=rnd()<0.5
show_circ=rnd()<0.5

fc=0
month=stat(81)
day=stat(82)
cls()
_set_fps(60)
::♥::
if t()<2 then
	print("lofi 3d 4",46,59,1)
	print(month.."/"..day,55,65)
else
	if btn(❎) and btn(🅾️) then
		cls()
	else
		burn()
	end
	
	if btn(⬅️) then cam[1] -= 0.01 end
	if btn(➡️) then cam[1] += 0.01 end
	if btn(⬆️) then cam[2] += 0.01 end
	if btn(⬇️) then cam[2] -= 0.01 end
	if btn(❎) then cam[3] -= 0.01 end
	if btn(🅾️) then cam[3] += 0.01 end
	
	if btn(⬆️) and btn(⬇️) or
		btn(➡️) and btn(⬅️) then
			print("cam.x="..cam[1],0,0,2)
			print("cam.y="..cam[2],0,6,2)
			print("cam.z="..cam[3],0,12,2)
	end
	
	if fc%500==0 then
		fc=0
		dir=(1+rnd()*3)\1
	
		shape={{},{}}
		build_plane(shape)
		
		o1={{},{}}
		build_circ(o1)
		o1=rotate_shape(o1,2,0.25)
		o2={{},{}}
		build_circ(o2)
		o2=rotate_shape(o2,2,0.25)
		o2=rotate_shape(o2,3,0.25)
		o3={{},{}}
		build_circ(o3)
	end
	
	if show_circ then
		draw_shape(o1,1)
		o1=rotate_shape(o1,dir,0.002)
		draw_shape(o2,1)
		o2=rotate_shape(o2,dir,0.002)
		draw_shape(o3,1)
		o3=rotate_shape(o3,dir,0.002)
	end
	draw_shape(shape,1)
	shape=rotate_shape(shape,dir,0.002)

	fc+=1
end
flip()
goto ♥
```