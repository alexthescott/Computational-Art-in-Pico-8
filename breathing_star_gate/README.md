<h1>breathing star gate</h1>

<img src='breathing_star_gate.gif'></img>
<img src='breathing_star_gate.png'></img>

tweetcart relay #8 from @carson's [Breathing Shape Extender](https://teia.art/objkt/755613)

``` Lua
?"\^!5f100🐱☉8웃9:♥⌂;⬅️3⬇️😐1"
cls()
r,p,q,f,g,v=rnd,srand,poke,0,0,128
s=r(-1)p(s)q(0x5f54,0x60)q(24364,7)::_::
for i=0,80do
x,y=64+cos(g/v+i/80)*60*i/100,64+sin(i/80-g/v)*60
?chr(x+y),x,y,f%13+1
end
g+=.1
if(r()>.1)f+=.5p(s)sspr(r(8),r(8),v-r(8),v-r(8),0,0,v,v)
flip()goto _
```