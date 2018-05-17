--x²ü‚è‰ñ“]ŠÖ”
function Rot_x(x,y,z,angle)
 local x2,y2,z2
 x2=x
 y2=y*math.cos(angle)-z*math.sin(angle)
 z2=y*math.sin(angle)+z*math.cos(angle)
 return x2,y2,z2
end
--y²ü‚è‰ñ“]ŠÖ”
function Rot_y(x,y,z,angle)
 local x2,y2,z2
 x2=x*math.cos(angle)+z*math.sin(angle)
 y2=y
 z2=-x*math.sin(angle)+z*math.cos(angle)
 return x2,y2,z2
end
--z²ü‚è‰ñ“]ŠÖ”
function Rot_z(x,y,z,angle)
 local x2,y2,z2
 x2=x*math.cos(angle)-y*math.sin(angle)
 y2=x*math.sin(angle)+y*math.cos(angle)
 z2=z
 return x2,y2,z2
end

--‘S‰ñ“]
function Rot(x,y,z,rx,ry,rz)
 local x2,y2,z2
 x2,y2,z2=Rot_z(x,y,z,rz)
 x2,y2,z2=Rot_y(x2,y2,z2,ry)
 x2,y2,z2=Rot_x(x2,y2,z2,rx)
 return x2,y2,z2
end