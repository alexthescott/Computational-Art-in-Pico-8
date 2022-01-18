<h1>bad drain</h1>

<img src='bad_drain.gif'></img>
<img src='bad_drain.png'></img>

[bad drain ipfs](https://cloudflare-ipfs.com/ipfs/QmRrfarLsmWzEZ8xAGTwJLeAibgExCQ4d7GmVWr4pdAGbj/)

``` Lua
-- bad drain
-- alexthescott
-- 9/13/21

-- z/x changes direction

p={8,136,2,11,139,3,12,140,1,7}
pal(p,1)

function new_center(col)
	-- circle shrinking effect
	c={}
	c.r=95
	c.col=col
	
	c.new_color=function(self,col)
		self.col=col
	end
	
	c.update=function(self)
		dif=-self.r/50
		self.r+=dif
	end
	
	c.draw=function(self)
		if self.r<12 or self.r\1%2==0 then
			circ(64,64,self.r-4,self.col)
			circ(64,64,self.r-2,self.col)
			circ(64,64,self.r,self.col)
		end
		
		if self.r>10 then
			-- lines towards center
			for i=-2,3 do
				line(i+64,-32,64,64-self.r,self.col)
				line(i+-32,64,64-self.r,64,self.col)
				line(i+64+self.r,64,160,64,self.col)
				line(i+64,160,64,64+self.r,self.col)
				line(i+0,0,64-self.r,64-self.r,self.col)
				line(i+128,0,64+self.r,64-self.r,self.col)
				line(i+0,128,64-self.r,64+self.r,self.col)
				line(i+128,128,64+self.r,64+self.r,self.col)
			end
		end
	end
	
	add(centers,c)
end

function new_particle(c,dir)
	p={}
	p.p={}
	p.c=c
	p.s=4
	p.a=rnd(1)
	p.av=-0.0001*(1+rnd(40)\1)
	p.r=91
	p.rv=1
	p.ra=0.00015*(dir*2-1)
	p.x=64+cos(p.a)*p.r
	p.y=64+sin(p.a)*p.r
	
	p.draw=function(self)
		-- draw trail
		for i=1,#self.p-1 do
			a=self.p[i]
			b=self.p[i+1]
			line(a.x,a.y,b.x,b.y,self.c+1)
		end
		circfill(self.x,self.y,self.s,self.c)
	end
	
	p.update=function(self)
		self.a+=self.av
		self.av+=self.ra
		self.r-=self.rv
		self.x=64+cos(self.a)*self.r
		self.y=64+sin(self.a)*self.r
		
		-- shrink particle circle
		if self.r<25 then
			self.s=1
		elseif self.r<40 then
			self.s=2
		elseif self.r<60 then
			self.s=3
		end
		
		-- add trail points
		local pnt={}
		pnt.x=self.x
		pnt.y=self.y
		add(self.p,pnt)
	end
	
	p.destroy=function(self)
		-- destroy @ center of screen
		if self.x<=65 and self.x>=63
					and self.y<=65 and self.y>=63 then
				del(particles,self)
		end
	end
	
	add(particles,p)
end

function burn()
	for i=1,200 do
		x=(rnd(64)\1)*2
		y=(rnd(64)\1)*2
		x=rnd(128)\1
		y=rnd(128)\1
		
		if x<64 then
			dx=2
		else
			dx=-2
		end
		
		if y<64 then
			dy=2
		else
			dy=-2
		end
		
		pc=pget(x,y)
		if pc%3!=0 then
			circfill(x+dx,y+dy,1,pc+1)
		end
		if rnd(1)<0.4 then
			circ(x,y,2,0)
			pset(x,y,0)
		end
	end
end

particles={}
dir=rnd(2)\1
global_color=1+3*(rnd(3)\1)
fc=0

centers={}
new_center(global_color)

cls()
::♥::
if t()<2 then
	print("bad drain",46,64,global_color)
else
	burn()
	
	fc+=1
	
	if fc%3==0 then
		new_particle(global_color,dir)
	end
	
	if fc%800==0 then
		fc=0
		global_color+=3
		global_color%=9
		new_center(global_color)
		
		if #centers==3 then
			del(centers,centers[1])
		end
		
		if dir==0 then
			dir=1
		else
			dir=0
		end
	end
	
	for p in all(particles) do
		p:draw()
		p:update()
		p:destroy()
	end
	
	for c in all(centers) do
		c:draw()
		c:update()
	end
	
	circfill(64,64,4,0)
	
	if btnp(5) or btnp(4) then
		if dir==0 then
			dir=1
		else
			dir=0
		end
	end
end
flip()
goto ♥

```