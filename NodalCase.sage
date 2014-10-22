## initialize variables

# cg : (var,var) -> var
# generates coefficients for the quadratic form
def cg(var1,var2):
  if str(var1) <= str(var2): return var("g"+str(var1)+str(var2))
  else: return 0

v1 = var("x,y,z,t")
v2 = var("dx,dy,dz,dt")
v3 = var("a")

for u in [x,y,z,t]:
  for v in [x,y,z,t]:
    if str(u) <= str(v):
      cg(u,v)

## define polynomials
g = sum([cg(u,v)*u*v for u in [x,y,z,t] for v in [x,y,z,t] ])
f = x**3 + y**3 - x*y*z + t*g
f1 = sum([f.diff(v)*dv for (v,dv) in zip([x,y,z,t],[dx,dy,dz,dt])])
p = (a,a**2,1+a**3,0)
q = (0,y,z,t)

# shorthand for evaluation
def eval1(poly,point):
  return poly(x=point[0], y=point[1], z=point[2], t=point[3])

# shorthand for evaluation
def eval2(poly,point1,point2):
  return eval1(poly,point1) ( dx=point2[0], dy=point2[1], dz=point2[2], dt=point2[3])

A = eval2(f1,p,q)
B = eval2(f1,q,p)
C = eval1(f,q)

# A == 0 <=> a**(-3)*A + z == z
Z = a**(-3)*A + z
B_ = B(z = Z)
C_ = C(z = Z)

b0 = (1/2) * B_.diff(y,y).expand()
b1 = B_.diff(y,t).expand()
b2 = (1/2) * B_.diff(t,t).expand()

c0 = (1/6)*C_.diff(y,y,y)
c1 = (1/2)*C_.diff(y,y,t).expand()
c2 = (1/2)*C_.diff(y,t,t)
c3 = (1/6)*C_.diff(t,t,t)

d = det(Matrix(
[[b0,b1,b2,0,0], 
 [0,b0,b1,b2,0], 
 [0,0,b0,b1,b2], 
 [c0,c1,c2,c3,0], 
 [0,c0,c1,c2,c3]]))

maxDeg = d.degree(a)
minDeg = d.low_degree(a)

print("The determinant has leading term " + str(d.leading_coeff(a) * a^maxDeg))
result = (d*a^(-minDeg)).expand()
print("Through multiplying with a power we obtain a polynomial of degree " + str(result.degree(a)))
print("and takes at 0 the value " + str(result(a=0)))
