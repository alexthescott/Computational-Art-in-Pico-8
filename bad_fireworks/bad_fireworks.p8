pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
-- bad fireworks
-- alexthescott
-- 8/24/21

p={1,140,2,136,3,139}
pal(p,1)

-- contrived oop
function add_splash()
	local b={}
	
	b.c=2+(rnd(3)\1)*2
	b.sr=0
	b.br=1
	b.bv=0.25
	b.bm=(1+rnd(4)\1)*3
	b.x=rnd(128)
	b.y=rnd(128)
	
	b.update=function(s)
		s.sr+=1
		if s.br>s.bm then
			s.bv=-0.25
		elseif s.br<=0 then
			s.bv=0
		end
		s.br+=s.bv
	end
	
	b.draw=function(s)
		circ(s.x,s.y,s.sr,b.c)
		if s.bv!=0 then
			circfill(s.x,s.y,s.br,b.c)
		end
	end
	
	b.destroy=function(s)
		if s.bv==0 and s.sr>181 then
			del(splash,s)
		end
	end
	
	add(splash,b)
end

-- set btn delay
poke(0x5f5d, 30)

splash={}
big_boom_count=0
add_splash()

cls()
::♥::
-- burn pixels
for p=0,2048 do
	px=rnd(128)
	py=rnd(128)
	pc=pget(px,py)
	if pc!=0 and pc%2==0 then
		if rnd(2)\1==0 then
			pset(px,py+1,pc)
		end
		pset(px,py,pc-1)
	else
		pset(px,py,0)
	end
end

-- little boom
if t()%2==0 then
	add_splash()
end

-- 20 sec 'big' boom
if t()%20==0 then
	big_boom_count=5
end

if big_boom_count>0 then
	if big_boom_count%1==0 then
		add_splash()
	end
	big_boom_count-=0.5
end

-- diy boom
if btnp(4) or btnp(5) then
	add_splash()
end

-- object loop
for s in all(splash) do
	s:draw()
	s:update()
	s:destroy()
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
s110000000001000000s00000ss1s0s1s0s0110s0001s0s01s010000000000010000000000000000000000000000000000000000000000000000000000000000
3s0103111100010000010000ss0s1s110sss10s0s11s110000s010001011000000000000r0000003300000000000000000s000000001000000000000000r0000
00010101s0000s0010s10010sssss0ss1ss1100000s0001000011s01000000000000s0000000r000003000010000010100000000100s00000000000000000000
000s00sss01000s0s00000ssss011ss0001ss00100s10001s000s00s00001000s000000r000r3003030000010000100000000000100s0000000000000000000r
r300s000000s000s030s000ss11s1s0s1s10101s0s100001000000110000101000000000030r3r0r000003000000000000000000000000000000000000000003
00r30r00003001s0000000ssss11sss1s0101s1s0010100s00001s00001010s0000100000r0r3000030000000000000000000000000000000000000000000000
0000030000000000s00000s1ss10ss01011000s01001s001100000000000010s000000033r3rrr330303000000000000000000001000000s0000000000000000
03003000r0r0000000100ssss0ssssss00s00s1s10s001100000011000000000000000003r33rrrrrrr000000000000100000000101000000010000000000000
0r0003000000000000010ss1s01s10s0s0s10011100s00110000s000000000000100000r003rrr00r03330000000000010000000s0000000000000000r00r000
03003000030000300100sss10ssss001000s0s0s10s0010000ss00s00010s0003000000003rr3330rr03000000000000s0000000000000000000000000030000
0rr0r3rr0r03r0r0r000sssss0111s10s00s00001110001010000000101s0000000r300r0r3r30rr0000000000s0000000000000000000000030000000300000
030333000000000r000ss110sss011s10000s0s0s0s010001010000000s00000000000000003r3r0r30000300000000000000100000000000000000000000300
00r3003000000000000ssssssssss1s000s0001ss110ss01s0000000000000000000r00003rr3r30000000000000000000000000000000000000000000000003
33000r030300003000ss011s1s0000ss01s000s00s00101100000s010000000000300303030rr033000000000000000000000000000000000000000000000r00
000000030003000033ss1ss1s011s01sssss00s100s011s0ss010000000000000030003300000003000003000000000000010000000000000000000000000000
3000r000000r000000ssss1s111ss100s00s001s1000000s000111000000000s00sr00000000000300033030000s010000000000000000003000030000300000
0rr30rr0030000000ss01s1sss1sssss011ss1s0000s000000100s0s000100000000000000r00r3000r000000000000000000000000000003r000000000r0000
30330000030003030s111ss110s0s1ss10100s00010000000s00s00000ss10001000000000000033003300000s0000s000000000000000000000000000000000
3rrr000000000030ss31s1s01s1s0110010001100s001100000100000000s00000000000000300300000000000000s00000000rrrrrrrrrrrrrrrrrrrrr00000
300000300003r00rss1s0s1s11s11100000100010s000000001s00001000000000000000000300r0000000000000001rrrrrrr3rr3rrrrrrrrrrrrr3r33rrrrr
r3r030330r00030rsss1sss0sss1100s00s10100s0000000000000001000001000000000000000r00000000000rrrrrrr3rr33rr3r3r3rr3rrr03r0rrrrrr3rr
00303033303r0r0s10ss1s100ss1010000310s11000s001101000000s10100100010000r03000000030000rrrrrrr3rrr3r3rr0rrrrrrrrrrr3rrrrr3r03rrrr
0r30000033r30rrss111s0s1101ss0000s3101000000000s1001000000010000001000000r00000000rrrrrrrrrrrrrr0r033rrrr3rr33033rrr3r333rrrrrrr
33033030r030000ssss10ss1ss0110s1s1r00001001000000000010000000000000010000000000rrr03rrrrr3rrrrrrr3rrrr0r3rrrrrr3r33rrr33rrrr30rr
r3r00rr00300033ss0s0s01s1s01s0111000100000000000s000000000000000000000000030rrrrrr3rrrrrrr3rrr33r3330rrrrr3r3003rr033rr33r33rrr0
3r033r03000300sssss101ss01s00sss10000000s0000000s010000s000000000100000100rr0rr03rrr3333r30rr3r00rrrr33r3r3rr0030r330r0r30rrrrr3
rr33rr00300300sssss00s00ss111s10s001s00s0000000000100100100000000000000srr3r30rrrrrrrrrrrr33rrrrrr3r3rr3r3r03r03r333r0r330rrr003
033r30003r0000ssssss1s1s101s1010s1000100000001000000100100s0000000000rrr3rrrrrrrrr3rr0333rr3rrrrrrr00r333rr030r0330r3r3r03r0rrr0
30rrr030r00000sss1s1s10s000s01ss0sss0s10100000001000000010000010000rr0r3rrr3300rr33r0r3rr03r3rrr0rr00r033r03330rrr00r30303rr3033
0003033r00r03ssssssss0ss0000s000001100110010000010000100010000000rrrrrrrrrrrrrrr33rr3r33r0rr3rr3r0333000r300rrr0r3r3rr3r0r00rrr3
r0r030r0330r3ss1sss00s1s11001000s1ss001001s00000s0s000000000000rrrr033rr303r30rr3r30rrr303003r33r00r0r000300303003rr03r000r003r0
0300r0000r300sss1s1ss11s110s00010000110100001000000100000s0000rsr0r0rr3r0r330r3303r300330r03033r330r30r003r33333rr33330r3303r30r
003r000000000s11s10001s10s0s00s01010s01000000000s00030000000rrrrrrrrrrrr3rr3r0rrrr0033r3300r0rr003r3r00r0r3303r33r3303r0r3rr03r3
03r00rr03300rsss1s1s0sss0s00s110s101110000001s000001000000rrrrrrr3r3r3033r30r30030r03r30333r00033r0rrr000r000r33r30r03003r0030r3
3300003r0rrrssssss1011s00010s01001s0001s10000000010000000rr33r3rrr0r003r3r0r0303rr00rr0rr0r00000r3003000r300r00r0rr00rrr030300r3
330r33r03030sssss1s1ss11010ss1s0ss0s0100001s10000010000rrr0r0r0r0303r03r03rrr30r330003r3r330330333rr00303330033000r0r0033030000r
33r003300003sss1ss0s101s1ss000s01000010000100100011000rrr3rrr33rrrrrrr030r300r33rr30303330303r000r0000030300r00030r000000r0030r0
rr0003r030r0ss1ss1s1ssss1s0000s000010000ss000s000100rrr0rrrrr00r300r3rr3r03300rr00r0r3r3r03r000r03030333030r0003r30r0r00r03000r0
rr033r000003sssss1ss1110101101010s000010100s001s101rsr3r31r00r00rrrr00rr003r03r303033333030303rrr00303003r0r300r03000r00r3r3r303
303000003000ssss1ss100ss110ss0ss01000s00s00s100001rrr33rrr333r01rr000r3rrrr303rrr00r303r000r000003030r0000r0r30rrr0330rr033r00r0
rrr0r000rr03ssssssss11s1ss0100000ss0001001s0s000rrr0rrrr00r3rrrr03r3rrr0r00r3000r330r3r00030rr00r030030000000000300000r00000r300
303r0r00003ssrs101100s30010010ss10001000110000sr0rr0r0r3rr0r3rr3rrrr333303r0r30303r303300333r0000rr00300r000000r3000000330330000
03r33003000ss1sssssss1r010000000s0001100000000rrrr0r3rr0300r031r033r0000rr3000000r0330r0rr30000r3000000r003033r033r03r300r000030
r3r30300003ss1s11s0s11110111000ss1000s0000000rr0r3r00r0rrs3rr30rr300303r03r0000rrr0003000000000000300r00003000r003003003000033rr
3r3r0r00r30ssssss100ss00ss100s1001000s000100r30rr0rrr00rrrr13rr3000r30r0300300r0r000r300r03033300rr030033r0003000000r00003r0r000
00003000033ssssss0s00010ss0010000100s00000rrrrr0r300rr330303ooooooooooooo0r000300030000r0300r3000r3r0000r000110003000300r0300303
rr333r03303s1ss0s1s10110s010s010s10000000r0rr0rr0r3rr03ooooooooooooooooooooooo0000r0r0300rr000r000r330r00100000000000030000r0000
r0rr00r33r0s11ss1s1s010s11s0000000000000r0r300r0rr00oooo2ooo2202oooooo2o22o2ooooor0000r0300rr33000000000010001010000030300000303
0033r033003sssssss001sss1s01s000s000000r0rr0r300r0ooooo3oooo22ooooooo2o22o2oo0o2ooo3000300030r300000333r00s10s01000000r000000000
30r3r0r000rsssssss0000s01s0s10001ss000r0rr0rrrrooooooo2oooooooooooo2oooooooooooooooooo03r00000000rr3rr3011100001000000003000r000
r333303r33rsssssss01100s0101100110000r1r3srr3oo0oooo3roo002022o22oo2222oo2oo0ooo00oooroo0r3000000001300s101ss1ss100300r000000000
300rrr33r0rss11s0ss0s011011s01s000s1r0rrrrrro0oooo2o3oooooo0oo02o0o2ooo2202oo22oo22oooo0o0r00030000s0030ss1110ss0013003030000000
rrr3r0r3030sssssss00sssss1s010s00001rrr03roosoooo2ooooo2o2o00o202o2oo2oo2oo00o222oooooo2ooo00003000030r000s1ss101s0r000000000000
303rr30r3r3sss1s00ss0s100s10s000111rrr0rro0ooooooor22o0o2oo2o2oo022o220200o0o2oo220oo0oooo0o0000000000s0001000s01001000300030300
rrr3033r300ss11sss10s011000ss0110sr3r0rroo2o000o0roo2o02oo0o00o22oo2022o2o0o2o22oo2o0o0o0oo2o00000000r001s011100s00s00r00003rrr3
r0003rr03r3ss1sss1s1ss1s010s11011rrrrroo2rooooo202ooo0oo0202oo0oooor0o002oo2o2ooooo2ooo2oo20ooo00000rs00100ss00100130003000rr000
rr0033rr00rsssss0ss111110ss1s1ssrr1rro0o2ooro2ooo22o02o0000o032o2020or20020200o2000ooo0oo0oooo0o000000010010000000s0000000000003
0rrrr003r30sssssssss01000s0s1s0r0rrro0oo320o2o020oo2oo02o0o023220002o22o0o2oo00ooo00oo00o2oo0oo3o003000s000000000000330303000000
r3r1333r00rss1ss01s1ss10s0s1101rrrro3o02rorooooooo20o20o2o0o0oo0oo00oo200o202oo0202o002ooo0ooooo0o0300000001001000003r3003300003
0rrrrr3r330ssss1ssss10s0000000r3r0orooor2o2o02oo0o20o2o00002o000o0o20200200ooo002oooooo202o2o0ooo0or30r000033000s030000303300303
rr0r3rr0r33rsssssss01ss01s0s0rr0ro3ooo0oo0o20o3o000o220o0020o220020222o2oo02020222002o322ooooo32oo0o0r000000000000300303r3030000
0rrrrr33300rssss10sss100s100rsrrrooo23r03ooooor0oooo023220oo020o22ooo00ooo200o0002020oroo0oo02r0oo2o00000000rs00rr30000r000000r0
01rrrr0rrrr0ssssssss0ssss110rrrroooro20or23o0r0000020o0o2002oo20oo2200000o00o2oo2o0ooo0oo0022o2220o2or00000030300000033300000000
0sr03rr30rr3sss0ss0ss111sssrrr0oo32ooo0o20o2222020o000o0o000o0o2o00o0r0002o00o0oo0o020oo02o02o2ooo2ooo30000003003300003r0000r330
000rr0rr330rss1ssss1ss111srr03o3or0o32roor222oo02022020o00o00202000202202o2000002o0022000oo002o002ooo0o000000r3000000003r003000r
0010rrr03300sssss0s1001101rrrrooo200oo20o0o0o20223200o200000000o000o00o0o0oo00200002oo0020o20020oo0oooo0000r3000300rr300003r0030
00000rrrrrr3ss1s1s1s01ss1rrr3oo2ro2o20o00or2o22o200oo0222002000000o000o20oo20020020o00ooo00oo2o0oooo02oo0000030030330r0rrrr00330
00000r0rr30r3ss1ss101s00rr0rorooo2or0r0220000ooo2o22000002202o220000000o200oo0o000000o0202oo02or2rooooo0or000030r0r00000003000r0
000000r0rrr0rsssss1sss1srr33o2o2ro02203o2oo20o00o222o0o0o02oo0oo00220000020000200200202oo000oo022oo00oooo00000303033r0000rr03r3r
0000000rr03r1ss11s11ss1r33ro32oo22o2oo202020ooo323o0002o00002200200220o02oo000000oo0020202o20o20o22o2ooo0or030r0r30303r330033rr0
00000000r30rrssss1ss0s1rrrroooroooooroo3200000030rr000o023020002o0020000020o000020200002200220oo0oooo22o2o00300000r00030r03rr033
000000000rr0rss0sss113rrrr1oo2oor2o00220o0o202o300000020200000020000oo000020000000o000oo0o0o22200ooooooo2o3300000rr030300033300r
0000001000rr0rsssssssr3rrroo222r20oo2020020o2oo02o00o0o0o0o000020002003000o222000002000r202o00o22022o00oooo00330r000r030003r0300
00000000000r30ssss1s3rrrrrooooooo0020oo02o00202r200002220003000o000or33020000020o0002o2o0oo22o0202ooo22oooo33000003r30r000330r3r
000000001000r0ssss3rrrr3rooo0ooo20202020oo00o000o002000o000r20000r00000oo0000000002222r00020o00or0oo2ooo3ooor03000r3rr0r0r0rr0r0
0000000000000rss3r1rrrr33ooo2oo220oo00oo000000000r30r0r00r00303ro0000032r3332000000oo2200000000202o002oo2ooo0300r030300rr03003r3
00000000000000rsrrrrr0r03o2o022200o2o20o2200r330r0ro002r00r003r33030003o03300000220000000000023o0002rooo2ooo333300r0rr000333r30r
000001000000000rsrrrrrrrooro0ooooo00023o33030r0r030r0300033033rooooooo0000000003oo0000002002oo2oo0o20ooooo0oor303rr00r333r0033r3
000000000000000sr1rr3rr3ooo2o20o20222o30330r0r3r3003033r33rr0ooooooooooo0r030r0330000o02o2000222000ro0ooo2ooo0r0r00r0033rrr0r03r
000000000000000s1rrrrrr3oo2oo0o02223o3r03000300333r03000r033ooooooooooooo030r000000o003200000002002ooo00o2ooo00r03003rrr0rr03r30
0000000000000000ssrrrr33ooooo20oo0orr00r03r3ro300r30r3r000ooooooooooooooooor0003000000r00000oo022o0000ooooooorr0r003rr03333r0r3r
0000000000000000srrrrrrroo2o2o20o33rrr030r0r0r0rrr000033rrooooooooooooooooo0r03r0r300r3r0o200020o2o20ooo02o2o3r0000r0r33r33r0rr3
0000000000000000srrssrro2oo33r0r330r0r3r3300r03233r03000rooooooooooooooooooo330000r0o0r030000022220oo202o2oo2o3300r3003333r0r30r
0000000000000000rsss1ssoorrrr0ror0r232r03ror0003rr00r330ooooooooooooooooooooor3003033003r30ro00o2ooo2ooo2oo2oor33r0030333rrr0r3r
0000000000000000rss11s0orororrrr033o3rr3rr0r03r0003rrrr3ooooooooooooooooooooo33r0r00r3r03000000o2oo2o22ooooooo3330r30r33rrr3r0r0
000000000000000r0rssssroorrrr3rrrrrr0r330rrrrr03r0rr03rooooooooooooooooooooooor0r33r00030r3r3r30o002o20o2022oo003r3rrrrrrrrrrrrr
000000000000000rr3sssssooo2rrror0rrr3333r033303r3r00303ooooooooooooooooooooooo000rrrrr0rr3r3rrr00ooo22o2o02ooo30r0r3r0r30r0rrr00
000000001000010rr3ss3ssooo2oor3rrr0r23rrrrr0330r3200rr0ooooooooooooooooooooooo003r330r33r003333r30r02o220ooooor0r03r0r0r3rrr0000
00000000000000rr0r3srsso2oo2o0rrrrr3or3rrrrrrrr3r3rr30rooooooooooooooooooooooo30303r3033rrr3r33r3r30020ooooooorrrr3rrrrrrrr00000
00000000000000rrrrrss1soooo2o000rrrrrrorrr0033rrrr3r2rrooooooooooooooooooooooor0r3r0r3r3rr30r003r33r0ro22ooo2o333rrrrrrrr0000000
00000000000000rr0rrrsssoooooooo22orrrrrrrrrrr3rr0rrro30ooooooooooooooooooooooo3003303r333rrr03rr0033rro2o2oooorrrrr3rrr000000000
0000000000000r0rr3r3ss1ooo222o222ooorrrr23rrrrrrr0rr3r3ooooooooooooooooooooooor00r0r3rrrr0r003r030rr3rro3o2ooorr0rrrr00000000000
0000000000100rr3rrrrrssooo2oo02o200220rrrrr3rrrr03rrr0r0ooooooooooooooooooooo3r00000300r003rr303rrr00r33r3oooo3rrrr0000000000010
0000000000s00rrrrr330ssoo22200oo00o02220rrrrr030rrr303r3ooooooooooooooooooooor03rrr3r3rr3r33or0r3rr30rr0orrooorrr0000s00000100s0
0000000000000rrrr3r3rrso2ooo2o3o02o00o02200rrrrr3rrr3r33oooooooooooooooooooor3r3r3rr0rrrrrrrrrrrrrrrrrrrrrrrro000000000000000000
0000s0000000r03rrrrr3rssoo222or2ooooo000001o0rrrrrrrrrr0r0ooooooooooooooooo33r3rr333rrrr3r3rrrr0r20r3rrrrrrro0100000000000000000
000000000010rrrrrrr0r33soo22o2oo0200200100s10002rrr0rrrrrrooooooooooooooooorr3rrrrrrr0333rrr3rrr33rrrorrroooo0100000000000000000
000000000000rrrrrrrr330soooo000oo20o00020000000010srrrrrrrrrooooooooooooorrr3rrrrrr3rrrrrrr33rrr3rrrrr2oo2ooo0000000000000000000
000000000000rrr33rr33rrroo2222osss20o000100s0so0s01s100rrrrrrooooooooooorrrrr3rrrrrrrrrrrr0rrrrrrro020ooo2ooo0000000000000000000
00000000000rr3rr33r3r00rooo2ooo221o1010011s0s000o000s0001010rrrooooooorrr3rrrrrrrrrrrrrrrrrrr00or222oo22oo0oo0000000000000000000
00000000000rr33rr3rrrrr00ooo22so01111sss0100s0s1010r0000o1000000122rrrrrrrrrrrrrrrrrrr02200200002oo2o0o2oooo00000001000000000000
00000100000r3rr3r3r3r33r0o2soo1s11s1s0s00s21000s1s0o0s0s0s0000000o0000000220000os0200s0oo2220o0o0o0o2o22o2oo0000000001000000s001
00000100000rrrrr33r03r003ossso1ss0os0o0211sss0000100o10000020s00000020o200000000000020020o02002o2ooo020osooo0000000s000000000001
00000000000rrrrrr3rr3303rross1s2sss1301001010s00000000s001000000202o000002o0o00000000020002oo2o0020oo2ooooo000000000000000100000
000s000000rrr3rr0333rrr330ososss1201rsss11s00ss1010s01011s000000200000000200000200002o0oo20o00220o02oo22ooo000100000100000ss0000
0000000000rrrrr33rrr0r30030ossos1oso110020101010s100200010100001oo00000000o0220020o2200200002o0o002o2ooooo0000s00101100000000000
0000000000rrrrr3r0300333rrroosss1ss1s10s1s111s201s201011000o0001o00200200002o000210o00oo0020o00o222000oooo00000000010000100s0000
0000000000rrr3r3r0303rrrr33o3osss0o1sss2s1ss100o0100000so0010o0s02oo0002000002022s000o0o20o12200ooo220o20o0000010ss0000100000000
0000000000rrrrrrr30r000r0030oos2ssss21soss00s1s1s1s110s00001o00002000o220000000220o00000o022o2oooo2oooooo000010s00000000s000000s
0000000000rrrrrr3rrrr003003ro3ossossss00s2s0110s10011s100ss000000o2o0000020o20o02002o0200o2o0o2220oo22o0o00000s00s00001000000000
1000000000rr03rr0rr03003rrr00oo2sssos11oso0s10o000os100s00000202o200000020000020o0o2022o2o0000o02oo00ooo000000001000000000000000
000000000rrr030rr3rrrr303r0r00ooossss2s1s1s1s01101s1s0s0000022o00200o000o000200000o22o0o002o002ooo022oo0001000000000001000000000
000000000rr33rrrrr00rr3rr03030orosossso0ss2s2o1s01102s000s10o00002022002220220o0210020o2oo2o020002ooo0o0000000010000100000000000
000000000rrrrr3rrrrr0r00300r333oo0sosssssss2o0ss10010s1000s0000o02200o20o200ooo2o1222020oo01oosoooo0oo00010000100000s00000000s00
000000000rrrr033330003r0r0003300oooss2sso11s11121s100os00000200o0020o0os0o000o0oo00222002220o10oo0ooo000000100000010001000000100
000000000rrr3r3r33033033r00rrr000ooossoss12s1o1ssss0s001os2o20o002200200o0022020o0oo0o0oo0oo1oo0oooo0000000s00011s000000100001s0
000000000rrrrrr0rrr0rr030r0000r00o3oos12ss02s10100002s01o0o2200002000200o22o20002o020o022020oo02oo0o000s0000000s00000000101110ss
000000000r3r3r30r303r0rr3r330r303ro0oossoss1ss0os0s1s10s2o0o220o0000000000022o002o2oo2oo00oo20ooo0o00ss00100s000000000010s00s000
000000000rrrrrrr33rrr300330r3r33000o0oossoss21s011s012102o000o02222o22o2oo0220o0o0o0o0o2220ooooo0o0110000001s0000000000100101010
000001000rr3rr033r30rrr30rr33330r000o0o0ssossss1211s10s020oo22022o2000o0220o02202o020o002ooo0oo0o00000000ss101100000000100ss0000
000000000rrrrrrr30r00000303r030003030o0ooss0ss0ssss10o22o2o2o22202o002222o0222o2022ooo2oo1o2oo0o0000000010000s010s00001s10010110
000000000rrr33r33rr0r30r0303rr00003300oo20ss21so01ss110o100o02oooo0o2o0o020o022002oo2oooooooooo0000001000s0000000010000000011ss0
000000000rrr3rr3r03r3rrr303r003000r00000ooossssss1os012oso0oo02o2o0220o2o020ooo202oooo120oo2o000000000s10100100000s0000100ss1011
000000000rrrrr3r033330300rr300030000r0300o3ososs0s11oo0oo2o2o22o202oo00o22222o02o00ooooooo0o0001000000001s00000001s0010000101s00
000000000rrrrrrr30r330rr3rrr30003000000330oooso1ssss2ooo22oo1o2oo2ooooo00oo22o2o0ooooooo2oos011101s10000s00s10000s01010000100001
000000000rr3rr3rr33rrr303000r3r00000r3r0rr00o3sssoso2ooooooosoo22oo0o22oo2ooo020ooooooo0o0101s010000000001s01110s0000s011000s01s
000000000rrrr0r33rr0rrr0r000003300000000000r3oo0sos2o2ooo0ooo2ooooo22ooooo2oo2oo0oo2o0oo1s010000s01101000000s0s0s0s00s0000000000
000000000r3rrrrrrr03rrr33030rr3330300003000000ooooooo0oo2oooooo0o2oooo2ooooooooooooooos1001s000100s0000010000s001s0000s0s010000s
