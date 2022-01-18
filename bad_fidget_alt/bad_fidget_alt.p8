pico-8 cartridge // http://www.pico-8.com
version 33
__lua__
-- bad fidget alt
-- alexthescott
-- 9/9/21

p={143,142,133,13,141,130,140,131,129}
pal(p,1)

function new_cluster(a,col,row,state)
	c={}
	c.state=state
	-- row x pos
	c.row=row
	--timer
	c.t=0
	c.a=a
	c.c=col
	-- rotate radius
	c.r=44
	c.a_x=64+cos(c.a)*c.r
	c.a_y=64+sin(c.a)*c.r
	--point size
	c.ps=10
	c.p1={}
	c.p1.a=0
	c.p1.x=c.a_x+cos(c.p1.a)*c.ps
	c.p1.y=c.a_y+sin(c.p1.a)*c.ps
	c.p1.xg=c.a_x+cos(c.p1.a)*c.ps
	c.p1.yg=c.a_y+sin(c.p1.a)*c.ps
	c.p2={}
	c.p2.a=1/3
	c.p2.x=c.a_x+cos(c.p2.a)*c.ps
	c.p2.y=c.a_y+sin(c.p2.a)*c.ps
	c.p2.xg=c.a_x+cos(c.p2.a)*c.ps
	c.p2.yg=c.a_y+sin(c.p2.a)*c.ps
	c.p3={}
	c.p3.a=2/3
	c.p3.x=c.a_x+cos(c.p3.a)*c.ps
	c.p3.y=c.a_y+sin(c.p3.a)*c.ps
	c.p3.xg=c.a_x+cos(c.p3.a)*c.ps
	c.p3.yg=c.a_y+sin(c.p3.a)*c.ps
	
	c.draw=function(self)
		p1=self.p1
		p2=self.p2
		p3=self.p3
		circfill(p1.x,p1.y,6,0)
		circfill(p2.x,p2.y,6,0)
		circfill(p3.x,p3.y,6,0)
		circfill(p1.x,p1.y,5,self.c)
		circfill(p2.x,p2.y,5,self.c)
		circfill(p3.x,p3.y,5,self.c)
	end
	
	c.update=function(self)
		if self.state=='rotate' then
			-- floor self.a
			-- floor self.p1.a & others
			self.a+=0.001
			
			if self.a>=1 then
				self.a=0
			end
			
			self.a_x=64+cos(self.a)*self.r
			self.a_y=64+sin(self.a)*self.r
			
			self.p1.a+=0.003
			self.p2.a+=0.003
			self.p3.a+=0.003
			
			if self.p1.a==0 then
				self.p1.a=0
			end
			if self.p2.a==0 then
				self.p2.a=0
			end
			if self.p3.a==0 then
				self.p3.a=0
			end
			
			self.p1.xg=self.a_x+cos(self.p1.a)*self.ps
			self.p1.yg=self.a_y+sin(self.p1.a)*self.ps
		
			p1_xd=(self.p1.xg-self.p1.x)/20
			p1_yd=(self.p1.yg-self.p1.y)/20
			self.p1.x+=p1_xd
			self.p1.y+=p1_yd
		
			self.p2.xg=self.a_x+cos(self.p2.a)*self.ps
			self.p2.yg=self.a_y+sin(self.p2.a)*self.ps
			
			p2_xd=(self.p2.xg-self.p2.x)/20
			p2_yd=(self.p2.yg-self.p2.y)/20
			self.p2.x+=p2_xd
			self.p2.y+=p2_yd
			
			self.p3.xg=self.a_x+cos(self.p3.a)*self.ps
			self.p3.yg=self.a_y+sin(self.p3.a)*self.ps
		
			p3_xd=(self.p3.xg-self.p3.x)/20
			p3_yd=(self.p3.yg-self.p3.y)/20
			self.p3.x+=p3_xd
			self.p3.y+=p3_yd
		else
			self.p1.xg=self.row
			self.p1.yg=32
			
			p1_xd=(self.p1.xg-self.p1.x)/10
			p1_yd=(self.p1.yg-self.p1.y)/10
			p1.x+=p1_xd
			p1.y+=p1_yd
			
			self.p2.xg=self.row
			self.p2.yg=64
			
			p2_xd=(self.p2.xg-self.p2.x)/10
			p2_yd=(self.p2.yg-self.p2.y)/10
			p2.x+=p2_xd
			p2.y+=p2_yd
			
			self.p3.xg=self.row
			self.p3.yg=96
			
			p3_xd=(self.p3.xg-self.p3.x)/10
			p3_yd=(self.p3.yg-self.p3.y)/10
			p3.x+=p3_xd
			p3.y+=p3_yd
		end
		
		self.t+=1
		
		if self.t==1200 then
			if self.state=='rotate' then
				self.row+=32
				if self.row>96 then
					self.row=32
				end
				self.state='grid'
			else
				self.state='rotate'
			end
			self.t=0
		end
	end
	
	c.debug=function(self)
		print(c.a_x,0,0,7)
		print(c.a_y,0,6,7)
	end
	
	add(clusters,c)
end

function burn()
	for i=1,600 do

		x=(rnd(64)\1)*2
		y=(rnd(64)\1)*2
		x=rnd(128)\1
		y=rnd(128)\1
		pc=pget(x,y)
		if pc%3!=0 then
			if rnd(3)\1==0 then
				nc=rnd(2)\1
				circfill(x,y,2,pc+1)
				circfill(x,y-2,2,pc+nc)
				circfill(x,y+2,2,pc+nc)
				circfill(x-2,y,2,pc+nc)
				circfill(x+2,y,2,pc+nc)
				
				if nc==1 then
					circ(x,y+1,2,pc+nc)
					circ(x,y-1,2,pc+nc)
					circ(x,y+3,2,pc+nc)
					circ(x,y-3,2,pc+nc)
				end
			end
		else
			circfill(x,y,1,0)
		end
	end
end

screen_wipe={}
clusters={}
fc=0

if rnd(2)\1==0 then
	state='rotate'
else
	state='grid'
end
new_cluster(0,1,32,state)
new_cluster(1/3,4,64,state)
new_cluster(2/3,7,96,state)

_set_fps(60)
cls()
::♥::
if t()<2 then
	print("bad fidget alt",36,64,4)
else
	burn()
	
	fc+=1
	if fc==1000 then
		fc=0
	end
	
	for clr in all(screen_wipe) do
		clr:draw()
		clr:update()
		clr:destroy()
	end
	
	for c in all(clusters) do
		c:draw()
		c:update()
	end
end
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
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000j000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000j00j00rjr0j0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000j0j00j00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000j0000j0r0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000j00000j0000j0000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000j0jrrj00000000j0j000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000j0r0r0000j0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000jr000r0j0rjj0jjr000j0j00000j0000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000j00r0j0rjr00000j000000r0j0000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000j0j0jrjr0r000r00j00r0r0j0j000j0000j000000r0j0r00000000000000000000000s00h000000000000000000000000000000
00000000000000000000000j000ji00j00r0j00j0jjjr0jj00j0j00j0r0j0j00000000j00000000000000000000h00s00h000000000000000000000000000000
00000000000000000000000r0j00ijr00j00jjjj0j0000r0jj00r0j000000rjrj0j000j0r000000000000000000h0ss00h000000000000000000000000000000
000000000000000000000j000jir0jiorii0r0jjoj000jr0jir0rj0j0jj000r0jj0jj0j0j0000000000000000hhhs00hs000hs00000000000000000000000000
000000000000000000000000000rij0joii000jjj000ri00r0rj0jrj00jrj00rj0r0j000j0000000000000000hh0chshs0000000000000000000000000000000
00000000000000000000000j0o000ooij8i800j0i00o0ijoj00ijjrj0j00rrjr00r00jj0j000000000000000s0hhc0shsh0sh00s000000000000000000000000
0000000000000000000000000o0ii0oii000iiori0oiririrr0rjj00jj0j00jrrj0rrrjr00j000000000h00h00hhcsshshs0h000000000000000000000000000
0000000000000000000000000o0ojoo8i8i0o800ii0ir0ji00j000jjrjrrr0rjrj00r0jjj0000000000000s0hh0hhhh0shcshsh0h00000000000000000000000
00000000000000000000000o008o8o88888iori00rii0i0rj00rjr00j0rr0bbbbbr00rj0jr00000000h000h0c0hscccccchc00h0h00000000000000000000000
000000000000000000000000oo0o08i808i8i0o8ioo0ji0ij00jjjrj00r0bjr0bjbjb0r0j000000000000000s0hhc0hhshcsh0ss000000000000000000000000
000000000000000000000oi0io0o808o00o08oorii00iij00r0rj000jrrbrrrr00rbjr0r0rr00000s000hhs0hshcc00hssschss0000000000000000000000000
0000000000000000000i00oiioo80800i8i808i0i8iooiji0oj0j000rjb0rr0jrrbjb0rjj00000000000h000h0csshh0shcscscsss0000000000000000000000
0000000000000000000i0i0oi0o8ooi80o0oo80o0oiio0oi000ijo0irjbrrjjrr0rrbrjr00j00h0s0sshs00hcscsc0ssh0sscsh0000000000000000000000000
0000000000000000000i0ii00oi8i008i00oi8o8i000ii0o00jo000000bj0jrrrjbjbj0000j00h0000s0s0h0csc0cssh000sc0sshs0000000000000000000000
000000000000000000000i00o808o0ooi88oo8i00ooo00o0ooi0o0r0i0bjjr0jrrbrbrbrr00h000h0shs0hhshhcsssh00shsc000h00000000000000000000000
0000000000000000000i0ii0i008io080oi0o8i000i0ii0o0o0jioi0i0bjr0rjb00jbjb0j0000h0000h000c00hc0sh0sshc0cscs000s00000000000000000000
0000000000000000000000iii0o88o880ooi80ii0o0ioio00io0i0o00bjb0rbj0rrbbrr000r0000s0s0s0s0hs0sc00shhcsc0sh0s00000000000000000000000
0000000000000000000i0i0i000ii80ooo08io0ii0i00i000jjoi00o0orrbjr0rjb0bj0000000h00h00h0000ch0hchs0hhch0scshs0si0000000000000000000
000000000000000000000000i8i08888888ooii00iio0i0ii0ib00iiiborbbbbbbjr00jrr0000000000sh00shhss0ccccchc00c0s0h0i0000000000000000000
000000000000000000000i0i0i00io0iooo0ooii00800o0jo0ojiooiio00r0jj00000i000000000s0h000hs000sh00000hc0csh00s00i0000000000000000000
000000000000000000000000o0i80o800oo00oii0o0o00000jijib0iibr00rbjjb0bjr00j00000000hh000h00ss0h0h00ch0c000c0i000i00000000000000000
000000000000000000000000000iii00oioii8o0i80j8i000jojiii0oi000j0ro000i0jj00000s0s00h0hh000000h000h0shs00s0000i0000000000000000000
00000000000000000000000000o0o00ooo0oiio00o000o0o0j00jjiioj0br00jr00ij0j0000000000h0hh0hhh0s00hs0hsh0c0c0c0o0i0000000000000000000
00000000000000000000000000000o0ioii800iii8i8000j0000jo0iooir0ji000i00ii000000o0h00h0hhh0h0s00hh0shh00h000000i000i000000000000000
000000000000000000000000000000o0oi00o00oi00oio000000i00ii0oror000j0o0i0o00000000hh00000hhs0ss00sh0hs00c00000i0000000000000000000
00000000000000000000000000000000i000i8oii808i000i0jj00ioi00j0r0rir0ii0o00ihoi00oih000hh00hhsh000hh0hh000000000000000000000000000
0000000000000000000000000000000000oi0ro00o0r0ji0000jjr00ojoj00o0io000ii00i00h0000hhhs0hhhs00sss0hs00o0000000000000i0000000000000
000000000000000000000000000000000000o0i80800000r0orjjijiijir0ro0rroii0o000ioooi0o00hh0hsh0s0h0hhs0h0i00000000000i000000000000000
00000000000000000000000000000000000io00r0joroj0iij0jj0j00jo0ojooooooii0000i000000000hhshh0ss00s0s0h0i0io00i0o000o0o0000000000000
000000000000000000000000000000000000o0rjj00jj0000orjjo0jjri0jrrrjoi00iii00i000o0i0isssh00si000hoh0i0i00000000000i000000000000000
000000000000000000000000000000000000000jo00joio0rjj00jjji000o00oo00ooi0i0000i0o000hh00hhh0ihs00sh0i00oi0ioo0i0o000o0o00000000000
00000000000000000000000000000080000000r0rj00ji00000jrjjjij0r0rj00i00i0o0oi000i000hs0s0shhsis00h000hii00i0o00ii000000000000000000
0000000000000000000000000000000000o00000o0oioiiij00jjjj0rji0jjriooo0iioioiih0i0i0s0000shi000i0o000ooio0o0oio00o0o000i00000000000
00000000000000000000000000008000i000i0j00000000i000jr0jj0ji0j0r000o0o000o0bh0so00c00sh000his0i0o0000i0000i0o00000000000000000000
00000000000000000000000000000000o0i000r0iio0ii00rijjrjbjrjj0r000rioi0i00r00hi00s000sh0hh00iho0h0hi00000oioio0iio00i0000000000000
0000000000000000000000000000i08ioiiooi0oio0o00i00io0rj0j0jjbrr00r00ijio00hb0b00000s0sh0h0sii00ho000i0i0i0o0ii00i0o00000000000000
00000000000000000000000000o000oi00i0000ii000i0j000rj00rjj0jj0jrj000jrii0ri0hihi0osh00shhsh00hh0ihi000i0o000i0o000000000000000000
000000000000000000000000o0iio0o8io00iiii00iii0oiojjjorj0jr0rjbrrjb0ir0r0bhrhbs00s0h0hh0000soc0hs000i0i0s0i0i000o0o0o000000000000
00000000000000000000000000io0iio0oioii0ii0io000iroj0r0rr0jj000jj00bjrijirhjh00hh0shs0s0h00hh0chshs0ii00ioio00i0000i0000000000000
0000000000000000000000o0o0i00888888ooi0ii0ii0ioi0jo0ij0r00rbrbbbbbrojirhr0jhrsh0hh00h00sso00ssh0hsi00s000s0iio0o0i0o000000000000
000000000000000000000000ii0oi8000oo800iiii0000o0ji0jjj0j00jjbj00jrbjr0rij0jsih0s0sh0hsc00hs00cccccisoioh0hoiii00i000000000000000
000000000000000000000000oi0o80o8oiii8ii00iii00o0or000r0jrb0brbrr00rb0ij0jh0sj00hh0hhsh0hcsshcscs0hchsshs0h00i0oi000i000000000000
0000000000000000000000i000i8iiioooioi80iioiiioo0ioj000i00jbjrr0jrrbobsji00jhis00000scs0schsch00s0sscch00ohooii000000000000000000
00000000000000000000000i00i8o00ioiiio8ooi0i0000ii0jrir000jbbrjj0rrrrb0bi0hj00s0sh00sh0shshcsssch0sssc00s00io00ii0i0o000000000000
00000000000000000000000000i80iooio0ii8i0ii0oi00o000j0j00r0b0rjj0rjj0b0rij0j0i0h0oh00css00hcc0s0hh00cch0hooi0io000000000000000000
0000000000000000000000000ii8i0oi0iii88o0ii00i000i00r000rj0bjjr0jj0jbbrjijh0si0hsssh0hss0h0c00sh0hhs0cshs0h0oi0000o0i00ii00000000
0000000000000000000000000i08ii08oii0088iio08i0o0o000ijij00bjrjj000j0birsr000i0i0hhhss00sshccs0hsh0s0chhssosoio080o00i0i0o0o00000
0000000000000000000000000i8o8i80ooii8iooi0ii00000i0bjrrrrr0brbj0jb0bj0000his0s0sh0sssss0shcsc0hs0hh0csh00sio0oii0o0oiiiii0000000
0000000000000000000000000008i800i808i0ioi0ioo0o000o00r0r00jjb0j0r0bjr00srh00000h00hh0sssscschchhh0sch00hhs0osoi00o00io0io0000000
00000000000000000000000000008o88888i8i0o0ii00j00r00r0jjrrjrbjbbbbbj00bj0000hos00sssshhsh0schcschh0c0s0hs000o00i000ii0o0000000i00
000000000000000000000000i00i080oii080i0iioooo000o00ri00rorjbjj00rhjshsr00shsh00shh0shh0hsshcccccccs0shhsh0soii0oioi000i0o0o0i000
00000000000000000000000000o0oi0ooi8o000ii000000rjjij00ijj0jj0bjj0hrrjr000ho0ohosh0hhsi00ss0hhh00shs00sh00i0i0iio00i00iiio00i000i
000000000000000000000000i000io000i0i00ooi00oororo00j0rj0rrj0jrjhr0hhhshs00hh0ss00s0h00hh0s0s0schs00h0h000000oiioi00o000io00io0i0
0000000000000000000000i000i0o0i0000i0io00i000r000ji000j0jjrrjrrjrhhj0r0h00o000oh00hh0is0000h0hhhs0000hh0000i00iiioiii0ii00oo0000
000000000000000000000000i000i00oii0i080i0ojrr00rjj0j0rrrj00jjjj0h0ijhs0sh0h0s00ss0hs0h00hs00hs0h0i0h000i00000io0oiio00i000ii00o0
000000000000000000000000i0o0i000ii000i0i000000jr0jr00j0j00rjrj0jj000hj0si0hho0s0hhscsis0shs0hhs0s00h00000i000i0o00i0000io0o00iio
000000000000000000000000i000i00i0i0i000ij000jr0j00jrj00rr0j00j000s0sh0hs0s00hss0hs0o00h00h00sh0h00hh00h000000i0000o0000iio00i000
000000000000000000000000000000i000000000000000j00j0j0jjjj0r00jjjsrsjss0ssshsh00hsc00scsihh0hshs0000000000000ioi0000i0iii0ioo0000
00000000000000000000000000000000000i000000j00rirrjrr0rjr0rjjj0jj00jjhs0s000000hs00h000sihh0hhh000is000000000i000o00000iiooi0oi00
000000000000000000000000000000000000000000i00oij0000000jjjj0jj0j0000sss0hs0000hsh0hc00ss000hsh00hi000i00000oi00o0i0o0i000ioo0000
00000000000000000000000000000000000000o0o0io0ji00jrr0r0j0j0r00j0jjrh00ssh0s0h000h0000i00s00h0000h0h00000000000oi0io0i0iioi0oo0i0
000000000000000000000000000000000000000ii000ii0ji0j0jrjj000o0j0j000s000si00c0hhs0shc0i00h000h0h00000000000000o0i000i000i0ioi000i
0000000000000000000000000000i0000000o000io00ioijr0jojr0j0rjr0r0jr0ir000his00s0h000hhh000000000h0s00000000000i000o000i0oi00oii000
000000000000000000000000000000000000000io80oj0ijj00rjjj00jjr000j0h000s000c0hh0000s0hhh000hh00ih000h000000000000o0i00i00o0i000i00
00000000000000000000000000i00000o00000o0o0io00i000j00j0j0000jr0r0r00ir0si0ssshh0h0h0000s000hh00000s00000000000o000000000i000o0o0
0000000000000000000000000000i000o0i00i080o000o0o0ir0jr00j0jjj000ij00i0ic0si0hhh00h000hs0000h000000h00000000000000000i00i0i0i0000
000000000000000000000000i000i0o00io00i0io00ooiii000000rjjj0r0jrr0r0r00hjishr0hhhh00hhs000s000sh0h000000000000000000000000io000o0
000000000000000000000000o0i0iio00ioi00iio8ooo0ior000rjjrjj000jr0jj00jh0si000h000hshs0hh0s00hh000h0000000000000000000000000000000
00000000000000000000000000i0oiooo00oo0o0i0oo0ii00i0000j0000rj0r00jb00jhrir0rsrhh000hhchs0c0sh00s000h000000000000000000000i00o000
000000000000000000000000i0i00ooii0oooio0iio0o000i0r00r00jrrrrb0br00h000h0ss0s0hsssh0hss0s00shsh0000h0000000000000000000000000000
000000000000000000000000i0oo0ooiiio0ooioi00i0oii0o000jrrjjrr0jrjb00jj0hr0r000rh0h00shs00hshshss0sc000h00000000000000000000000000
00000000000000000000000000io8088888o80i000oi00oi00i00j0jrr00jbbbbb00jhhs00hjhhh0hs0ss000ssss0shsh0sh0hs0000000000000000000000000
000000000000000000000000ioi0o8ii00i8ooo000io00ioio0j0r00jrr0brrrb0bjjjbjh00rs0h0c0h00s0s00hsscccccsc00sh000000000000000000000000
0000000000000000000000h000808i80i08o8oi00000o0oi0h000j00jjjb00jjjjjb00j0rjs0s0h00hs0s0chc00sc00hsscssh00s00000000000000000000000
000000000000000000000000ii08iio0ii0oo8ioii080o0osi000j0r0rbr0rjrjjb0b00j00sshh0shh0shh000scchssc0cscc0css00000000000000000000000
00000000000000000000h000o0i880oi8i0o8888o00o00000oib00sjb0brj000rjrjbsrh0jr0s0hhs0sh0hs0c0cs0hssssshcss0000000000000000000000000
0000000000000000000000h000i8oi0oi00oi80i00io08si0os00r0rjjb000jj000jbsjchjh0sshhchh000csc0csc0h0ssc0cs00css000000000000000000000
0000000000000000000000h0hoo800oi8o88o808o8io000i0bs0hrh00rbjr0rj0j00b0rhr00s0hhhsh0sshch00css00hs0shchs00h0000000000000000000000
0000000000000000000000000008ii0io0ioo80o0o00so08sis0hrjj00bjb0j0r0rsbhjhbchss00ssh0hchh0hsc00hshhhc0chcssh0000000000000000000000
00000000000000000000s00i00oo8iooo0oo88o8i00oi00i000rh0sjrrjbr0jj00rbjh0hjsh0hh00hsh0s000hhc0hhhsshchchhs0hh000000000000000000000
00000000000000000000000000ooi8ooo8o80o0io8so08s8h8hi0rhj0rb0b0r000b0rhj0hhhhh00h00h00sh0h0ccshh0s00cs0hhc00h00000000000000000000
0000000000000000000000s00oii0088888o0oih00iooh00000hhj000rj0jbbbbbhhr0jhhs0sh0h00h00hhhs0000css000chchhhhh0000000000000000000000
0000000000000000000000000000oi0ioso8h0i000i8s008000hhr0j0jjrbjjrrrhs0hjhhshs00h00hhh000s00h00cccccs0hh0hhh0000000000000000000000
00000000000000000000000o000oiioi0oo0i0i0ih00i0o0h0hhh00jsj0rjr00hs000h0hh0h00h0s0hhh000shhhs00csss00csh0000000000000000000000000
000000000000000000000000000iiio0o0hih000ihsh080i00000s0j00hjj00j0shh0hhs0sh00s00shh0hh0sh00hhshhs00sshh0000000000000000000000000
0000000000000000000000000o0o0ioio0h000h000iso00s0s0000h00j0rj0jh00hss0hh00h00sh00s000s0h0hh0sss0shcs0hhs000000000000000000000000
00000000000000000000000000000ioi00hih0ih00000h00h00s000ssjh00000h0h00000hh0s00hh000hhs0000hhs00hhh0h000h000000000000000000000000
0000000000000000000000000000000ihh0ch0ihhh00000s000s0shhsj000hh000hs0000h000000s0000000s0sh000shhs0s00000s0000000000000000000000
00000000000000000000000000000000o0h0hh0000000hhs0000hs0000h00rh0h0000h0h0s000000000000000000h00hh00h0000000000000000000000000000
000000000000000000000000000000h00000shh0h0sh00hh0s0shh00hhh00h0h0s0sh0hhh0000h00000000000000s0h00h000h00000000000000000000000000
0000000000000000000000000000000000h00000000h000s00h000hhsh00hh0s00h0h0000000000000000000000000h00h000h00000000000000000000000000
0000000000000000000000000000h000h0s0s0h00hh00h0000000shhs0h00shh0sh00000000000000000000000000000000h0000000000000000000000000000
00000000000000000000000000000000000000000000hs000shs0h00ch00ssh0hs00000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000h0s0s0s000h000000000000hh0hh0h0000h00000s0h0000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000s000shh0hh00h0s0sh00s00h0000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000ss00h000000h00000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000hs00000hs0hh0s0s0shs0000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000hsh000h0000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000h000h0hhsshssh000s0s000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000s000sh000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000s0h0ss00h000h0csss00000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000h0s000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000s000s0shh00hc0shh0000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000h000h000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000s0s0h0h0c0s00000h00000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000h0h000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000h00000s00000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000s0h000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000h0s000s000000000000000000000000000000000000000000000000000000000000000000000
