<h1>cosine river</h1>

<img src='cosine_river.gif'></img>
<img src='cosine_river.png'></img>

[cosine river ipfs](https://bafybeic54noyrcdaw5mdch4ju6epwvmq7z4muc24j7g7jychblukc4s4ju.ipfs.infura-ipfs.io/)

``` Lua
-- cosine river
-- alexthescott
-- 22/1/17

?"\^!5f10▒1⬇️3⬅️;⌂:♥7"
a=128p={}f=0m=a*24r=rnd;c=cos::_::o=f/m
if(f>m)f=0
for i=0,2do add(p,{0,r(a),o*5+r(2)})end
for e in all(p)do
pset(e[1],e[2],e[3])
e[1]+=0.5e[2]+=(c(o+e[2]/a)-c(o+e[1]/a))/3if(e[1]>=a)del(p,e)
x,y=r(a),r(a);pset(x,y,max(pget(x,y)-1,0))end;f+=1;goto _
```