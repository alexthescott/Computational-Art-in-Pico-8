<h1>bad star</h1>

<img src='bad_star.gif'></img>
<img src='bad_star.png'></img>

``` Lua
-- bad star
-- alexthescott
-- 22/5/31

?"\^!5f10█🐱2☉웃🅾️◆"
_set_fps(60)r,s=rnd,sin
p={}v=.5+r(.5)t=0m=128::_::for i=0,7*m do
x=r(m)y=r(m)pset(x,y,max(pget(x,y)-1,0))end
add(p,{64,64,r()})for o in all(p)do
z=t+o[3]o[1]+=cos(z)*(v)+s(o[1]/m)o[2]+=s(z)*(v)pset(o[1],o[2],7)if(#p>m)del(p,p[1])end
t+=.1/m;flip()goto _
```