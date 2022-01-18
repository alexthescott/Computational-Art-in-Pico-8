<h1>bad burn</h1>

<img src='bad_burn.gif'></img>
<img src='bad_burn.png'></img>

[bad burn ipfs](https://gateway.fxhash2.xyz/ipfs/QmTz4gUAXUCh246kUc6suJXtpRZRoGyn3ks5VXLd9fyyG6/)

Lightning strikes the screen and pixels burn, decay, fall off the edge. I encourage you to read the source code, change some values around, and find a remix that scratches your itch.

``` Lua
-- bad burn
-- alexthescott

-- new seed every day of the year 
srand(31*stat(81)+stat(82)) 

-- bad fire
p1={2,136,8,142,143,10,135,7}
-- bad arctic blue
p2={129,1,140,12,15,143,14,7}
-- bad matrix green
p3={129,131,3,139,11,138,135,7}
-- bad magma
p4={130,141,136,137,142,143,15,135}
-- bad winter moss
p5={129,1,131,141,140,13,6,7}
-- bad october
p6={128,130,132,4,137,142,9,10}
-- bad office
p7={128,133,141,5,13,6,15,7}
-- bad thermal
p8={1,131,3,139,9,10,8,14}
-- bad jawbreaker
p9={128,130,133,134,15,14,142,7}
-- bad sulfur
p10={130,136,8,137,13,140,12,7}

p={p1,p2,p3,p4,p5,p6,p7,p8,p9,p10}
c=rnd(p)
pal(c,1)

function vote(push)
	-- vote decides pixel's val
	-- based on neighbors
	-- :param: push forces pos vote
	x,y=rnd(128)\1,rnd(128)\1
	
	pu=pget(x,y-1)
	pr=pget(x+1,y)
	pd=pget(x,y+1)
	pl=pget(x-1,y)
	pc=pget(x,y)
	
	pa=push+(pu+pr+pd+pl+pc)/5
	pset(x,y,pa)
end

function stripe()
	-- draw a line
	-- hori/vert
	-- full/scattered
	-- double_line/single_line
	
	hori=rnd()<0.5
	p=rnd(128)
	if full_line then
		c=rnd(9)\1
	else	
		c=1+rnd(8)\1
	end
	
	coin=rnd()<0.25

	if hori then
		if full_line then
			if big_line and coin then
				line(0,p,128,p,c-1)
				line(0,p-1,128,p-1,c)
			else
				line(0,p,128,p,c)
			end
		else
			-- not a full line
			for x=0,50 do
				if big_line and coin then
					circfill(rnd(128),p,1,c)
				elseif rnd()<0.05 then
					-- small still gets circ
					circfill(rnd(128),p,1,c)
				else
					pset(rnd(128),p,c)
				end
			end
		end
 -- vert
	else 
		if full_line then
			if big_line and coin then
				line(p,0,p,128,c)
				line(p-1,0,p-1,128,c-1)
			else
				line(p,0,p,128,c)
			end
		else
			-- not a full line
			for y=0,50 do
				if big_line and coin then
					circfill(p,rnd(128),1,c)
				elseif rnd()<0.05 then
					-- small still gets circ
					circfill(p,rnd(128),1,c)
				else
					pset(p,rnd(128),c)
				end
			end
		end
	end
end

function burn_v()
	-- decide vote iteration count
	if big_line or full_line 
		or wideline or alt_extra_burn then
			iter=512
	else
		iter=224
	end
	
	if alt_extra_burn then
		for i=0,iter do
			vote(rnd(40)\39)
		end
	else
		for i=0,iter do
			vote(0)
		end
	end
end

function side_burn()
	if flow_r and flow_r then
		burn_c=128
	else
		burn_c=256
	end
	
	if flow_l then
		for i=0,burn_c do
			x=rnd(64-(off/3072)*64)
			y=rnd(128)\1
			pcr=pget(x+1,y)
			pc=pget(x,y)
			pset(x,y,pcr)
			pset(x-1,y,pc)
		end
	end
	if flow_r then
		for i=0,burn_c do
			x=128-rnd((off/3072)*64)
			y=rnd(128)\1
			pcl=pget(x-1,y)
			pc=pget(x,y)
			pset(x,y,pcl)
			pset(x+1,y,pc)
		end
	end
end


function full_flow()
	iter=256
	for i=1,iter do
		x=rnd(128)\1
		y=rnd(128)\1
		pc=pget(x,y)
		pcr=pget(x+slow_flow_d,y)
		pset(x,y,pcr)
		pset(x-slow_flow_d,y,pc)
	end
end

--srand(31*stat(81)+stat(82))

a=0
fc=0
-- how many frames till reset
rnd_size=1800
seed=rnd()*1024
border=rnd()<0.5
stretch=rnd()<0.5
off=536+rnd(2536)
big_line=rnd()<0.5
-- 1/3 full, wide, narrow
full_line=rnd()<0.3
if not full_line then
	wide_line=rnd()<0.3
end
-- 1/3 flow up,down,both
flow_up=rnd()<0.5
if not flow_up then
	flow_down=true
else
	flow_down=rnd()<0.5
end
-- 1/3 flow left,right,both
flow_r=rnd()<0.5
flow_l=rnd()<0.5
-- sparks require stretch
sparks=rnd()<0.2 and stretch
extra_burn=rnd()<0.5
ext_brn_dir=-1+(rnd(2)\1)*2
alt_extra_burn=rnd()<0.5
mirror_left=rnd()<0.3
slow_flow=rnd()<0.5
if(slow_flow) slow_flow_d=1-(rnd(2)\1)*2
flip_length=rnd_size*2
angle_div_len=1/rnd_size

cls()
_set_fps(60)
::♥::
if t() <2 then
	print("bad burn",48,64,7)
elseif mirror_left and t()==2 then 
	poke(0x5f2c,5)
else
	if not extra_burn and 
	 big_line or full_line or 
	 alt_extra_burn then
			spawn_stripe=rnd()<(0.075+sin(a)+1)/2
	else
		spawn_stripe=rnd()<(0.25+(sin(a)+1)/2)
	end
	
	if(spawn_stripe) stripe()
	burn_v()
	
	fc+=1
	
	if fc%flip_length==0 then
		fc=0
	end
	
	a+=angle_div_len
	
	if a>=1 then
		a=0
	end
	
	if stretch then
		off=536+rnd(2536)
	end
	
	if flow_up then
		memcpy(24576,24640,4096-off)
	end if flow_down then	
		memcpy(28672+off,28608+off,4096-off)
	end
	
	if sparks then	
		if flow_down then
			p=0x8000-4096+off
		else
			p=0x6000+4096-off
		end
			
		poke(p+64,peek(p))
		poke(p+ext_brn_dir,peek(p)-0.1)
	end
	
	if extra_burn then
		for i=1,26 do
			p=0x6000+rnd(8128)\1
			c=0
			if(rnd()<0.25)c=1
			if peek(p)>0 then
				poke(p+ext_brn_dir,peek(p)+c)
				poke(p-64,peek(p)+c)
				poke(p+64,peek(p)+c)
			end
		end
	end
	
	side_burn()
	
	if(slow_flow) full_flow()
	
	if border then
		rect(0,0,127,127,4)
	end

	if btn(❎) or btn(🅾️) then
		--lol
	else
		flip()
	end
end
goto ♥
```