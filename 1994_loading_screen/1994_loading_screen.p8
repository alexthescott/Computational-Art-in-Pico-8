pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
-- 1994 loading screen
-- alexthescott
-- 9/2/21

p={8,136,130,11,139,131,12,140,129}
pal(p,1)

function new_object(c)
	obj={}
	obj.t=0
	obj.tc=rnd(1)
	obj.tv=0.0001
	obj.a=0+rnd(1)
	obj.sc=rnd(1)
	obj.sv=0.0005
	obj.s=3+((1+sin(obj.sc))/2)*40
	obj.c=c
	-- origin point, new origin point
	obj.op={x=64,y=64}
	obj.nop={x=64,y=64}
	-- 4 points for square
	obj.p1={x=64-obj.s,y=64-obj.s}
	obj.p2={x=64+obj.s,y=64-obj.s}
	obj.p3={x=64+obj.s,y=64+obj.s}
	obj.p4={x=64-obj.s,y=64+obj.s}
	
	obj.draw=function(self)
		p1=self.p1;p2=self.p2
  p3=self.p3;p4=self.p4
		line(p1.x,p1.y,p2.x,p2.y,self.c)
		line(p2.x,p2.y,p3.x,p3.y,self.c)
		line(p3.x,p3.y,p4.x,p4.y,self.c)
		line(p4.x,p4.y,p1.x,p1.y,self.c)
	end
	
	obj.update=function(self)
		-- new pos every 2 secs
		if t()%4==0 then
			if obj.t<10 then
				self:new_origin()
			else
				-- set pos @ origin
				self.nop.x=64
				self.nop.y=64
				-- stay @ origin for two cycles
				if self.t>=12 then
					self.t=0
				end
			end
			self.t+=1
		end
		self:resize()
		self:rotate()
		self:move()
	end
	
	obj.rotate=function(self)
		self.p1=rotate(self.p1,self.op,self.a)
		self.p2=rotate(self.p2,self.op,self.a)
		self.p3=rotate(self.p3,self.op,self.a)
		self.p4=rotate(self.p4,self.op,self.a)
	
		self.a=sin(self.tc)/200
		self.tc+=self.tv
		
		if self.tc==1 then
			self.tc=0
		end
	end
	
	obj.move=function(self)
		x_dif=(self.nop.x-self.op.x)/20
		y_dif=(self.nop.y-self.op.y)/20

		self.op.x+=x_dif;self.op.y+=y_dif
		self.p1.x+=x_dif;self.p1.y+=y_dif
		self.p2.x+=x_dif;self.p2.y+=y_dif
		self.p3.x+=x_dif;self.p3.y+=y_dif
		self.p4.x+=x_dif;self.p4.y+=y_dif
	end
	
	obj.resize=function(self)
		self.s=3+((1+cos(self.sc))/2)*40
		self.sc+=self.sv
		
		o=self.op
		
		p1=self.p1;p2=self.p2
		p3=self.p3;p4=self.p4
		
		a1=atan2(o.x-p1.x,o.y-p1.y)
		a2=atan2(o.x-p2.x,o.y-p2.y)
		a3=atan2(o.x-p3.x,o.y-p3.y)
		a4=atan2(o.x-p4.x,o.y-p4.y)
		
		x1=cos(a1)*self.s;y1=sin(a1)*self.s
		x2=cos(a2)*self.s;y2=sin(a2)*self.s
		x3=cos(a3)*self.s;y3=sin(a3)*self.s
		x4=cos(a4)*self.s;y4=sin(a5)*self.s
		
		self.p1={x=o.x+x1,y=o.y+y1}
		self.p2={x=o.x+x2,y=o.y+y2}
		self.p3={x=o.x+x3,y=o.y+y3}
		self.p4={x=o.x+x4,y=o.y+y4}
	end
	
	obj.new_origin=function(self)
		new_x=30+rnd(68)\1
		new_y=30+rnd(68)\1
		self.nop.x=new_x
		self.nop.y=new_y
	end
	
	return obj
end

function rotate(p,o,a)
	local new_point={}
	
 cx=o.x;cy=o.y
 x=p.x;y=p.y
 x-=cx;y-=cy
      
 local sina=sin(a)
 local cosa=cos(a)
 
 local rotx=cosa*x-sina*y
 local roty=sina*x+cosa*y
    
 rotx+=cx
 roty+=cy
  
 new_point.x=rotx
 new_point.y=roty
   
 return new_point
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

function burn()
	for p=0,2024 do
		x=rnd(128)\1
		y=rnd(128)\1
		pc=pget(x,y)
		if pc!=0 and pc%3!=0 then
			pset(x,y,pc+1)
		else
			pset(x,y,0)
		end
	end
end

cls()
_set_fps(60)

::♥::
if t()<2 then
	print("1994",56,64,2)
	print("loading screen",36,70,2)
else
	burn()
	
	for obj in all(objs) do
		obj:draw()
		obj:update()
	end
	
	flip()
end
goto ♥
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
