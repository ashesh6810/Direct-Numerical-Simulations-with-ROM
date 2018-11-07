import numpy as np
import math
from numpy import genfromtxt
from matplotlib import pyplot as plt
from numpy import dot
def dmd_modes(X):
    u,s,v=np.linalg.svd(X[:,0:np.size(X,1)-1])
    ds=np.diag(s)
    Atilda=dot(dot(dot(np.transpose(u),X[:,1:np.size(X,1)]),(v[:,0:np.size(u,0)])),np.linalg.inv(ds))
    w,v=np.linalg.eig(Atilda)
    phi=dot(u,v)
    return phi,w


'''main'''


X=genfromtxt('burger_vel.csv',delimiter=',')
X=np.transpose(X)
phi,eigs=dmd_modes(X)

plt.figure(1)
plt.plot(np.real(phi[:,0]),color='red')
plt.plot(np.real(phi[:,1]),color='blue')
plt.plot(np.real(phi[:,2]),color='green')
plt.show()

plt.figure(2)
plt.scatter(np.real(eigs),np.imag(eigs),color='red',marker='o')
plt.show()

