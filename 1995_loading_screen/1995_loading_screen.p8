pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
-- 1995 loading screen
-- alexthescott
-- 9/2/21

p={131,1,129,7,5,133,142,141,13}
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
		if t()%6==0 then
			if obj.t<5 then
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
		--self:resize()
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
	for p=0,512 do
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
	print("1995",56,64,1)
	print("loading screen",36,70,1)
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
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000hj000j0h0j01hj10100000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000h1juutuuuuuuu1j10jj101j0j1100000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000hj0uuuuuutuuuuuuuuu1jj11hjhh1jjj10j00000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000j1dduutuuuuduuutuuuuuuhjhjj111101hjj1jjj10000000000000000000000000000000000000000000
000000000000000000000000000000000000000011jutttu0utdutuuuuuuuututuu11jh1h11j1jjjjj1jjj000000000000000000000000000000000000000000
000000000000000000000000000000000000000j10tttttuutuuuuduuuuuuuuuuuuuj111jj1jjjjj1hhjjj11jj00000000000000000000000000000000000000
000000000000000000000000000000000000j0dtuutuduuutuudutuuuuuuuuuuuuuuujjjjjjjjjj1jjj11jjjdj10000000000000000000000000000000000000
00000000000000000000000000000000000jdttuuttuuu0tttuuuutuuuu0uuuuuuuuuujjjjj1j1jjjjjjj11jjujjj00000000000000000000000000000000000
0000000000000000000000000000000000dtdu0utttttudtuutuuuuuuu1ututuuuutuuujh1jjjjhjj1jjjjjh1jj1jj1000000000000000000000000000000000
000000000000000000000000000000000tutt0dtuuutuuttuuuuuuuujttututudtutuuuu1jj1jjjjjjj1j1jjjj11hhjjh0000000000000000000000000000000
000000000000000000000000000000htututtuutduuduuuuuuuuuuutuujtuuuuuuuuuuuuuh1jjjjjjjjjj111jjjj1j1jjj000000000000000000000000000000
0000000000000000000000000000h0dddttttuutttuuuuuuuutuuujhh1u111u1uuutuuuuuujjjjj1j11jjjjjjhj1j1j1jjj00000000000000000000000000000
00000000000000000000000000000td0td00uutduuuuuuuuutuuu11h1ujju1jjjjtuuuuuuuu1jjjjj11jjjjjjj1jjjjjjjjjj000000000000000000000000000
000000000000000000000000001dduttdutdtuuuttuuutuuuutu1jhtjh11jjjj1jjhjjjuttuujj1jjjjjjjjjjjjjjjjjjj1jjj00000000000000000000000000
000000000000000000000000h1ttuudutudu0utttuuuutuuuuu1j0h1jt111j1jjjjjj1j1jjtuu1jjjjjjjj1jjjjjjj11jjjjjjj0000000000000000000000000
0000000000000000000000010uudtdtddd0tututtuuuutuuuuj11j11j1jjjjh157777777jjjjuujjjjjjjjjjjjjjjjjjjjjjjjjjj00000000000000000000000
00000000000000000000000j0tuddttttuuu0uuuduuuuuuuu1jtjj11jj1jjjjjj17777777jjjjjujjjjjjjjjjjjjjjjjjjjjjjj1j00000000000000000000000
0000000000000000000001h1utu0tuutttu0uuuuuuuttuuuttu1jjjjjjjjjjjjjjjj7jjj7jjjjjjujjjjjjjjjjj11jjjjjjjjjjhj1h000000000000000000000
000000000000000000000jj1ttttt0d77uduttttutdujjujjjjjjjjjjjjjjjjjj777jj7577jjjjjjujjjjjjjjjjjjjjjjjjjjjj1j10h00000000000000000000
0000000000000000000jjj0jtttjjjjjjjjjjjjjjjjjjujjjjjjjjjj7775jjjjj77jjjjjjj7jjjjjju11j1jjjh0jjjjjjjhjjjj0j111j0000000000000000000
000000000000000000jjjjjjjjjt755l7jjjjjjjjjjjujjjjjjjjjjjjjjjjjj77jjj75777777duutuuu11jj1jjjjjjjjjjjjjjjjjjj1hj000000000000000000
00000000000000000jjjj11jjjjjjjjjjjjjjjjjjjjujjjjjjjjjj1jjj777777757575777777uddttuuuj11j7577777777777jjjj0tu0jh00000000000000000
00000000000000000jjjjjjjjjjjjjjjjjjjjjj1jjujjjjjjjjj1j555757777777777777777777777777u7777775757577577jjjjd0ttuj00000000000000000
0000000000000000jjjjjjjjjjjjjjjjjjjjj5777u577777777777777777777777777777777777777777tu77775755l771j75jjjjttttddh0000000000000000
000000000000000jjjjjjjjj7777777777777777u777777777777u777777uuuttutt7755757777777757uuu77555755jj1j77jjjtju0uu0d0000000000000000
000000000000000jjjjjjjjj7777777777uuuuuuuutuuuuutuutuu7577uutuuuuuttul575777777755777lduu5jjj1j1jjj77jjj7jtttdt0t000000000000000
0000000000000hjjjjjjjj0j75jjjjjjjuuuuuuuuuuuuuuuuuuuuu577uuuduuuuduuuuu775577777ultl57uuuuuuuuuj1j177jjj7juuuutdu100000000000000
0000000000000jjjjjjjjjjj77jjjjjjuuuuuuuuuutuuutuuuutuu7uutuuuutuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu1j177jjj5jdu0t00tu00000000000000
0000000000000jjjjjjjjj1j777j1jjuuuuuuuuuuuuuutuuuuuuu7uuuuuuuuuuuuuuuuuuuuuuuuuu7uuutuuuuuuuuuuuujj77jjj7j5uuuduutt0000000000000
000000000000jjjjjjjjjjj1777jjjuuuuuuuuuuuuuuuuuuuuuuuudutdtl5l00000l7uuuuuuuuuuu77uuuuutuuuuutuuuuj77jjj5j7tuudttuu1000000000000
00000000000hjjj1j1jjjj1j7755juuuuuuuuutu5tutd777777uuuu000000000000000005uuuuut7577uuuuuuuuuuuuuutu77jjjjjtddutt0dd0000000000000
00000000000jjjjjjjjjjj1j7777juuuuuuuuddutult7l7577tu000000000000000000000000tutt777tuuudtut0uuuuuuuu7jjjjjttu0uuuutut00000000000
0000000000jjh1jjhjjjjjj17777huuutuuuuuuuuuuu77777t0000000000000000000000000000tt7l77utuutuduuuuuuuut7jjjjjttddttuuutdh0000000000
00000000001jjjjj1jjjjjj17755juuduuuuutu7utu5557t00000000000000000000000000000000u7577tutuuttuuuuuuuu7jjjjjdtutuddudtduh000000000
000000000jj11jjjjjjjjj1j7777juuuutuuttuduu7777000000000000000000000000000000000000l577uuuuutttuuuuuu77jjjju0uuuttuutuu1000000000
00000000j1t1jj1jjjjjjjjj77777uuuuuuuuuuu0t57700000000000000000000000000000000000000777uuuututuuuuuuu77jjjjtuutttuttddtu000000000
00000000j0j1jjjjjjjjjjj17775uutuuuuuttuut7770000000000000000000000000000000000000000777utuuluu0uuuuu77jjjjdtuttududtt0tj00000000
0000000011j1jjjjjjjj1jjjj777uuuuuuutuutu7770000000000000000j1j11jj1jjj000000000000000777uuuduu7uuuuuu7jjjjtu0utuudtdtutj00000000
000000001jj1jhjhjjjjjjhjj75uuuuuuuuuuuu77700000000000001j1j11jh0hjj1j1jjj0000000000000777utuuutuuuuu7ujjjjutututttuuutdth0000000
0000000jjjjjj1jjjjjjjjj1j7uu57uutuutt77770000000000001jhjj111h1jj1jjjj1jjjj0000000000007775uu5uuuuuu77ujjjd0tutdutttutuu10000000
0000000j11j11jjjjjjjjjjj1uud77uuuuuu777700000000000hjh11h1jj1j1j1jjjjjj1j1j1j00000000000775lduuuuuuu77ju1juuuuutut0uuttud0000000
000000jj1jjj1j1jj1jjjjjhu77577uuuuu777700000000000j1jj11j1hjjj1j1jjjj1jjjjjjjj0000000000077775dutuuu77jjujjuuuuuutuuutdutj000000
00000011j11jjj1jjjjjjj0uu7777tuuu7777500000000001j0h11j111jjjj1j1jjjjjjjjjjjjjh0000000000077757uutuu77jjjujuutuutuuttuuut1000000
000000jjh1j1jj1jjjjjjjuuu77075uu75775u000000000hhjhj11hjjjj1jjjjjjjjjj1j1jjjjj01h00000000007777uuuuu77jjjjuuuuuuuuuuuuuduu000000
00000101j0jjjjj1jjjjjujuu77l5tu77775u0000000001h1hj1jjj10jjjjjjjjhjjj111jjjjjjj111000000000u777uuuut771jjjjuuuuuuuuttuutuuh00000
000001jjj11jjjjjjjjjujjuu77ll7uuu7uu0000000000hhjjj11jjjjjjjj000000101jj11jjjjj0001000000000t77uuuuu77jjjjjuuuuuuututuuutuh00000
00000jj1j11jjjj1j1jujjjut77777uuuuuu000000000h1jjjjjjjjjj0000000000000011jjj1jjjjj1000000000577uuuuu77jjjjjthuuuuutuutttddu00000
0000hjjj1jjjjj0jjjujjjjut77777uuuuu000000000jjjjjjjjjjj000000l5l757000000jj1jjjh0j1h000000000t7uuuuu77jjjjjujjuuuutttttuuuu00000
0000j1j11j11jj1j1uujjjjut77757uuutd00000000jjjjjjj1j1j00005l07575577700000011jjj1jj0j000000000duutut77jjjjj1tjjuuuuutduuuuu10000
00001jdjjjjjjjjjuujjjjj7777777uuutd000000001jjjjjjjj1000l500757757777000000jjjjhh0h1100000000ltuuudu77jjjjjjh1jjuuuuuuuuttu00000
00000jhjjh1jjjjuuujjjj77777777uttu00000000jjjjjjjj1j0005l50l07777757770500001jjj1111h100000000tu7uuuu7j1jjjjjjjjjuututuuttuh0000
0000jjj1jj0jj1uuu1jjj7j7577555uuut00000000jjjjjjhjh00070055l577l0l57770000000jjj00hjjh00000000dtu775777jjjj1j11jj1uuutuutuuu0000
0000111j1j1jjuuuujj777j7777577uuul0000000jjjjj1j11h0005l70l77l5000l5l77l00l00jjjjj1jjj00000000lduu77777jjjj1jjju11tuuuuuututh000
00010j0j01j1uuuuuj77j7j7777577uuu000000001jjjjjj1100l05ll77700000000l77l000000jj11111jh00000000duu77777jjjj1jjjj1ht1uuuuuuuu1000
0001j0jjjjjuuuuujj77j7j757770tuuu00000000jjjjjj110000ll7770000000000007757l000jjjj111hh00000000tuuu77751j7j1jjtjtjuutuuuuuuu1000
000hhjjjj1uuuttujj77jjj757777uuuu0000000jj11jjjhj000l7777000dttuutuu0007770ll00jjj1hj0j00000000duuuu7775j5jjjjjjhujujuuutuuuj000
0000jjjh1uuuuuuuhj777jj75777tttu70000000jj1jjjjjh0077775500ttuuuuutut00l750l500jjjjh11j10000000lutuu7777j7jjjj1hj1utuuuuuuuuh000
000jhjhjuuututtdh177j7jj777uutuu50000000jj1jjjj1j007775500uutuuduuuutt00775l5000jj1h1j0h0000000luutut777jjjjjjj1ujutuuutuuuuj000
000h111utuuuuuuuhj57j77j777uuduu00000000jjj1jjjj0077757000tuuu0000uuud0007757700jj1jhj1100000005uuutu777jjjjjjjjhjuutuuttuuuh000
000h0juuuutuuuu1jj7jj77j777ttuuu00000000jjjjj1j10077775000uuu000000utu0057l70000jj1j1hjj00000000uuuut777jjjjj1jj1utuuuuduuuuj000
0000juuuuuuutuu1jj71jjj7777tuuuu00000000jj1jjjj10055770l00uut0000000uu000l75l700jjjj1jh100000000uuutd7777jjjjjj1j1uuuutuuuuu0000
0000uuuuuuuutthjjjjhjjj7777tduuu0000000001jjj1jj007777l000uut0000000uuh00777l500jjjjjj1j00000000uduut77l7jjjj5j11uuuduuuuuujj000
000juuuuuuuuutujjjjjjjjj777uuutul0000000j1jjjjjj0075757l0huuu000000uut00075755001jj0j1jh00000000uuudt757j77jh7jjjuutuuuutu011000
000huuuuuututuj0jjj1jjjj777utuuu50000000111j1j1j00l77l7000uuuu0000uutth05ll77500hjjjjj0j00000000uuutt7l7j77j77j0uuuuuuuuu1jj0000
0001uuuuuuuuutjujjj1jj1j577ttuuu00000000jj1jjjjj1000ll77000ttuu00uuuuth0l07770011jjjjjj100000000uuduu757jj7j57jjuutuutuu1jj1j000
0000uutuuuutuujj1jjj1j7j5577uuuu5000000011jj1jjjj0077077700tutuuuuutt00757777001jjjjjjj100000000uuut57775jj775jjtuuuuuujjhj1h000
0001uuuuuuujt1ujj1jjjj7j7777tuuut0000000hjj1jj1jj000ll757000tdduudud0007777l000jjjjjjj1j00000005uuu757777jjj77jjuuuuuu1jjj10j000
0000uutuuuuudu1tjtjjjj5jj7777uuuu000000001j1jjjjj0007l5577000010000000777000h00jhjjjj1j00000000tuuu777777j7j77jjuuuuujj11jjjj000
000htuuuuuuujtjjjjjjjj5jj77777uut00000000h11jjjjjj00ll05577l00000000777l000l00jhjjjjjjj0h000000uuu7l77777j7j77juuuuuhj11hhh0j000
000huuututuuuthju11jjjjjj77777uuu000000001h0jj1jjjj0000557777550l0l775ll0l00101jj1jjj1100000000uuu7757777j777jjuuuujj0jjjj1j0000
0000utuuuuuuuuu11j111jjjj775777utt00000000jjj1jjjjj00000057055l0777l70l5500001j1jjjjj100001000utuu5777777j7jjjjtuujjjjj1j1jh0000
0000jtttuuuuuuu1j01h0jjjjj7uuuu7uu0000000010111hjjj100000077l557757555l070h0h1jjj1jjj10000h000tuuu77577777jjjjuuujj1jjjjhh100000
0000huuttuuuutuujj011jjjjj77uuuuut0000000001jh11jjj1100000l7777757555550000jjjjjjjjjj000000000duuu7577777jjjjjuujjjjj111j01j0000
00001tuutuuuuuuuuj1ujjjjjj77utuuutd00000000j101jjjjjj10000077l777755500000jjjjjjjjjj100000000ttuuu77777tujjjjuu11j1jjjj111hh0000
00001uutuuuuuuuuuu11ujjjjj77uuuuu7t000000000j1jjhjjj1jj1000007757l500000jjjjjjjjjjjj000000000uuuuu57777ttj1jjujjjjj1jjjj01100000
00000dtututuuuuuuuuhujjjjj77uuuuu77d000000000jj11jjhjhj111000000000000jjjjjjjjjjj00000000000tuutuu77777tujjjuj1jjjj1jjj11j100000
000001ttutuuutuuuuuuujjjjj77utuuu777000000000h01hjjjjj1hjjj000000000jjjjjjj1jh110j0000000000u05uuu75l770tjjujjjj1jjjjj1jjj000000
000001tudutuuuuuuuuuujjjjj77uuuuu5770000000000h10jjj1jjjjjj11jjjjjjjjjhj1111100101000000000t77777uu7777dtjujjjjjhj1jjjj1hhj00000
000000uttuutuuuuuuuuuujjj177uuuuu75770000000000hhhjjjjj1jjjjjjjj1jjj1j0jhj1j1jhhj000000000077777uu55777tuujjjjj1jjj1111hhj000000
0000001udduuuuuuututujujjj77uuuuu57757000000000000jjjjjjjjjjjjj1jjjjjj11hj1h10hh000000000075777uuu05777uujjjjjjjjj10jj1j0j000000
0000000uuutuuutuuutuujjujj77uuuuuu7777700000000000jjjjjjjjjjjj1jj11jjjjhh1jjhj000000000007777uuuuu57777u0jjjjjj1jjj1jjjjhj000000
0000000utututtuutttuuujjuj77tuuuutuu777700000000000jjjjjjjjjj1jj1j11h1h1jj1j0000000000007577uutuuu75uuujjhjjjjjjjjjjjjjjj0000000
00000001ttutudtuutututjjju77uutuuu7uu7777000000000000jjjjj11jjj11jh1jh10h110000000000005777uuuuuuul7uu7jjjjjjjj1j1j1jjjjj0000000
0000000jtduttutdduutttjjjju7uuutuuuuuuu77l0000000000000110jjjjjjjjjjh1jhj0000000000000777uuuuuutuuuuu77jjjjjjjjjj1jjjhjj10000000
0000000h0dudtuuttuuutdjjjj7uuuttulututdu777000000000000000jjjjj1j0h110000000000000000777ututuuutuuuu7571hjjjjjjjjjjjjj1j00000000
00000000htututuuuttuuujjjj77uuuuuutultuuu777000000000000000000000000000000000000000077lduutttuuuutut7777jjjjjjjjjjjjjj0j00000000
000000000dutuu0dduutuujjjj77tuuuutuuuuuuu077700000000000000000000000000000000000000775uuutuuuuuuuuu77777jjjjjjjjjjjjj01j00000000
0000000001u0tdtttutu00jjjj77uuutuuuutudutu7777u0000000000000000000000000000000000077lluuuuuutuuuuuuj7777jjjjjjjjjjjj1jj000000000
00000000000utud0tuttudjjjjj7tuuuuuuutututuu7777t00000000000000000000000000000000d7777uttluuuuuuuuuuj5577jjjjjjjjjj1jj10000000000
0000000000jtttudduuuutjjjjj7uutuuuuutuuuuttu7757ut00000000000000000000000000005t7757uuuuuutuuuuuuuuj77771jjjjjjjjjj0jj0000000000
00000000000uttdtutudutjjjjj7uuuuuuuuuuuuttutu777uuuuu0000000000000000000000l0t777077u7udutuuuuuuuuu15777jjjjjjjjj1j1j00000000000
000000000001tttutuuddtjjjjj77uutuuuuutuuuuuut7777uuuuut500000000000000005tdtt777757utttluuuuuuuuuuuj7757jjjjjjjjj1jj100000000000
0000000000000uttdtudd5j5jjj77juuuuuuutuuuuuuuu77uuuuuuuutu770000l55l5dtuttuuuuuuuuuuuuuuuuuuuuuuuujhj777jjjjjjjjjjjj000000000000
0000000000000uudttudt7j7jjj77jjtuuuuuuuuuuuuuuu7uuutuuuuuuuuuuuuuuuuuuuuuu7uuuuuuuuuuuuuuuuuuuuuu1jhj777j1jjjjjj1110000000000000
00000000000000dttdutttj7jjj77j11uuutuuuuuuuuuuuuuuuuuuuuuuuuuuuutuutuuutu7uuuuuuuuuuuuutuuuuuutu1jjjjj77jjjjjjjjjjj0000000000000
000000000000000dtdu00tj5jjj77j11juuuuuuuuu550ulu77757755ltdutduuuuuuuuu777uuutuuutuuutuuuuuutuujjjjjjj77j1jjjjjjjjh0000000000000
00000000000000jtuutd0uj7jjj77jjhjj1jjj50ut555777l777777577ltuttuututut7777uuuuutuuuuuuuuuu0utu7777777777jjjjjjjjj000000000000000
0000000000000000tututtj0jjj77jjhj77775777uuu75l75777777777750ttuuuuu777555u777777777777u7777777777777777jjjjjjjjj000000000000000
0000000000000000jdttuuujjjj77j177777557577uu757777777775777777777777777777777775777757u7777j1jjjjjjjjjjjjjjjjjjj0000000000000000
000000000000000001d0dddjjjj7777777775777777u77777777777777777777757577757ljj1jjjjjjj1ujjjjjjjjjj1jjjjjjjjjjjjjj00000000000000000
000000000000000000ht0ddjjjj777777777775711jjuuuutudt777777777l77777757jjjjjjjjjjjjjjujjjjjjjjjjjjjjjjjjjjjh1hjj00000000000000000
0000000000000000001h100jjjjjjjjj1jjjjjh1h1j11uuuutud77775777jjj77jjjjjjjjjjjjjjjjjjujjjjjjjjjjj7757ldjjjjjjjjj000000000000000000
0000000000000000000h111jjjjjj1jjj11jjjj11jhh1jujjjjjj7jjjjjjj77jjjjj777jjjjjjjjjjjujjjjjjjjjjjjjjjjjjuu00hh000000000000000000000
00000000000000000000h00jjjjjjjj1jjjjjjjjjjjjjjjujj1jjj7775jj777jjjjjjjjjjjjjjjjjjujjuuuuududdutlldtt0dtthhj100000000000000000000
0000000000000000000000jjjjjjjjjjjjjjjjjjjjjjjjjjujjjjjj7jjj7jjjjjj1jjj11j1hj1uuuuuuuuutuudutdtu0dtdutut0hh1000000000000000000000
00000000000000000000000jjjjjjjjjjjjjjjjjjjjjjjjjjujjjjj77775771jjj1jjjjjj1h1u1juuuuuuuudtuu0tuttuttttduu0j0000000000000000000000
00000000000000000000000jjjjjjjjjjjjjjjjjjjjjjjjjjjuujjjj77777575j1j1h1jj0jjjj1uuuutuutttttuduu0dttudttt1h00000000000000000000000
0000000000000000000000001jjjjjjjjjjjjjjjj1jjjjjjjjjuuu1jhjjh1jjjjjjjjjujjjj1juuuuuutttuutdtuuttdddtud00h000000000000000000000000
00000000000000000000000000jjjjj1jjjjjj11jjjjjjjjj1j1uutuuj1jj0jjjj1hjj1juj11uuuuudutuutdtutuuuttut0ut000000000000000000000000000
000000000000000000000000000jj1jjjjjjjjjjjjjjj11jjjjhjuuututttt11hjjujj0jjjjuuutuuuuuuuttuuuutt0ttdtd0000000000000000000000000000
00000000000000000000000000000j1j11jj111jjjjjjjjj1jjj1jutuuuuuuuujujjhd1j1uuuuuuuututuuttudduuudtddh00000000000000000000000000000
000000000000000000000000000000jjjjjjjjj1jjjj1jj1jjjjhjjuuuuuuuuuuutut1uuuuuuuuutuudutud0ttdtttddt1000000000000000000000000000000
00000000000000000000000000000000jjjhjjj111jjjj1j11111jj1uuuttutttduuuuujuuuuuuuuuutuuuudutudu0dj00000000000000000000000000000000
0000000000000000000000000000000001jjjj1jjjhjjjjj1j1jjjjjjuuuuuutuduudjuuuuuuuduttuutdutudtttddh000000000000000000000000000000000
00000000000000000000000000000000000jjjtjjjjjjjj1j111j11jj1uuuuuututuuuuutuuuuuuududtuduu0tduj00000000000000000000000000000000000
0000000000000000000000000000000000000jjuj1jj1j1jhjjhhj1jj11uuuutuuuuuuuutuuuuuuuttutttdd0t1h000000000000000000000000000000000000
00000000000000000000000000000000000000j1jjjj1j1j11jjjj1j1jh1uuuututuuuuuuuuututtuuututt1j000000000000000000000000000000000000000
0000000000000000000000000000000000000000hhj1hh1hj11j1111jj111uuuuuuuuuuuuuuuuuuuuudutj1j0000000000000000000000000000000000000000
0000000000000000000000000000000000000000000hjj10j1jj011jh11j1juutuuuuuuuututuduttuj100000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000jh11jh11j101jjjhuuuuutduuutttuuu1000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000hj10111h0h1jjjuuuuuuuuuuj0h000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000j01h0h1j0jhj0101h0000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
