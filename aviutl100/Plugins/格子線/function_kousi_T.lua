
function Rot_x(x,y,z,angle)
 local x2,y2,z2
 x2=x
 y2=y*math.cos(angle)-z*math.sin(angle)
 z2=y*math.sin(angle)+z*math.cos(angle)
 return x2,y2,z2
end

function Rot_y(x,y,z,angle)
 local x2,y2,z2
 x2=x*math.cos(angle)+z*math.sin(angle)
 y2=y
 z2=-x*math.sin(angle)+z*math.cos(angle)
 return x2,y2,z2
end

function Rot_z(x,y,z,angle)
 local x2,y2,z2
 x2=x*math.cos(angle)-y*math.sin(angle)
 y2=x*math.sin(angle)+y*math.cos(angle)
 z2=z
 return x2,y2,z2
end

function point_xyz(num,pos)
 return pos[num*3-2],pos[num*3-1],pos[num*3]
end

function draw_line_3D(x0,y0,z0,x1,y1,z1,density,obj)

 local L=math.sqrt((x1-x0)^2+(y1-y0)^2+(z1-z0)^2)
 local N=L*density

 local dx=(x1-x0)/N
 local dy=(y1-y0)/N
 local dz=(z1-z0)/N
 local x,y,z=0,0,0

 for i=0,N do
  x=x0+dx*i
  y=y0+dy*i
  z=z0+dz*i
  obj.draw(x,y,z)
 end

 obj.draw(x1,y1,z1)

end

function Rotate(pos,RX,RY,RZ)

 local pos_num=#pos/3
 for i=1,pos_num do
   pos[3*i-2],pos[3*i-1],pos[3*i]=Rot_z(pos[3*i-2],pos[3*i-1],pos[3*i],math.rad(RZ))
   pos[3*i-2],pos[3*i-1],pos[3*i]=Rot_y(pos[3*i-2],pos[3*i-1],pos[3*i],math.rad(RY))
   pos[3*i-2],pos[3*i-1],pos[3*i]=Rot_x(pos[3*i-2],pos[3*i-1],pos[3*i],math.rad(RX))
 end

 return pos

end

function draw_Point_Line(pos,d_pos,r,obj,col,size,colP,sizeP,L_B_K,RX,RY,RZ)

num=#pos/3
num2=#d_pos/3

--ê¸ï`âÊ

for i=num-num2+1,num do
 for j=1,num do

  if(i<j)then

  local x0,y0,z0=point_xyz(i,pos)
  local x1,y1,z1=point_xyz(j,pos)

  local r_p=math.sqrt((x0-x1)^2+(y0-y1)^2+(z0-z1)^2)

  if(r_p<r)then

   if(L_B_K==1)then
    size2=size*(r-r_p)/r
   else
    size2=size
   end
   
   obj.load("figure","â~",col,size2)

   obj.rx=0
   obj.ry=0
   obj.rz=0

   draw_line_3D(x0,y0,z0,x1,y1,z1,density,obj)
  
  end

  end

 end
end

--ì_ï`âÊ
obj.load("figure","â~",colP,sizeP)

for i=num-num2+1,num do

  local x0,y0,z0=point_xyz(i,pos)

   obj.rx=0
   obj.ry=0
   obj.rz=0

  obj.draw(x0,y0,z0)

end

end