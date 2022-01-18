<h1>1993 loading screen</h1>

<img src='1993_loading_screen.gif'></img>
<img src='1993_loading_screen.png'></img>

[1993 loading screen ipfs](https://cloudflare-ipfs.com/ipfs/QmRpnBeSoGMXAvD9irgWXT2vykYKposjzGzaEAMsLLX2qY/)

``` Lua
-- 1993 loading screen
-- alexthescott
-- 9/6/21

p={8,136,130,11,139,131,12,140,129}
pal(p,1)

function new_object(c)
	obj={}
	-- origin point, new origin point
	obj.op={x=64,y=64}
	obj.nop={x=64,y=64}
	obj.t=0
	obj.tv=0.001
	obj.c=c
	obj.rv=0.001
	obj.rc=rnd(1)
	obj.r=3+((1+sin(obj.rc))/2)*60
	
	obj.draw=function(self)
		circ(self.op.x,self.op.y,self.r,self.c)
	end
	
	obj.update=function(self)
		-- new pos every 4 secs
		if t()%4==0 then
			if self.t<10 then
				self:new_origin()
			else
				-- set pos @ origin
				self.nop={x=64,y=64}
				-- stay @ origin for 4 cycles
				if self.t>=14 then
					self.t=0
				end
			end
			self.t+=1
		end
		self:move()
		self:resize()
	end
	
	obj.resize=function(self)
		self.r=3+((1+cos(self.rc))/2)*60
		self.rc+=self.rv
	end
	
	obj.move=function(self)
		x_dif=(self.nop.x-self.op.x)/20
		y_dif=(self.nop.y-self.op.y)/20
		
		self.op.x+=x_dif
		self.op.y+=y_dif
	end
	
	obj.new_origin=function(self)
		new_x=30+rnd(68)\1
		new_y=30+rnd(68)\1
		self.nop={x=new_x,y=new_y}
	end
	
	return obj
end

function burn()
	for i=1,800 do
		x=rnd(128)
		y=rnd(128)\1
		pc=pget(x,y)
		if rnd(1)<.8 then
			if rnd(1)<.5 and
						(pc!=0 and pc%3!=0) then
				pset(x,y,pc+1)
				pset(x,y-2,pc+1)
				pset(x,y+2,pc+1)
				pset(x+2,y,pc+1)
				pset(x+2,y,pc+1)
			else
				pset(x,y,0)
			end
		end
	end
end

function quick_burn()
	for i=1,5 do
		burn()
	end
end

objs={}
for i=1,9 do
	if i<4 then
		i=1
	elseif i<7 then
		i=4
	else
		i=7
	end
	add(objs,new_object(i))
end

cls()
_set_fps(60)
quick_burn()
::♥::
if t()<2 then
	print("1993",56,64,2)
	print("loading screen",36,70,2)
else
	for o in all(objs) do
		o:draw()
		o:update()
	end
	burn()
	flip()
end
goto ♥

```