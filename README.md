# Computerized-Tomography
Matlab Code for performing the Backprojection of a crescend-shaped object needed for Computerized-Thomography (CT).

## Note: 
The main obstacle was that the discrete circular convolution has negative indices whereas our initial implementation just shifted the values to the right, which lead to a flawed but somehow recognizable result.

# Files
```
ct.m: Script creating a crescend-shaped object and performing the Radon transform on it.
convp.m: (circular) convolution h of the discrete N-periodic functions f and g.
convp2.m: discrete convolution of N-periodic function f (as row vector) and NxM matrix A
backproj1.m: Main Script performing the backprojection.
```

# Example
The following images show a comparison between performing a convolution with convp.m with N=18 and N=36 where N constitutes the number of discrete angular CT measurements.
## N=18 with convp:
![Backprojection18](https://github.com/K0glin/Computerized-Tomography/raw/master/Crescend-Shaped%20Backprojection%20%20for%20N%3D18with%20convp1.png)
## N=36 with convp:
![Backprojection36](https://github.com/K0glin/Computerized-Tomography/raw/master/Crescend-Shaped%20Backprojection%20%20for%20N%3D36with%20convp1.png)

## N=18 with convp2:
![Backprojection18](https://github.com/K0glin/Computerized-Tomography/raw/master/Crescend-Shaped%20Backprojection%20%20for%20N%3D18with%20convp2.png)
## N=36 with convp2:
![Backprojection36](https://github.com/K0glin/Computerized-Tomography/raw/master/Crescend-Shaped%20Backprojection%20%20for%20N%3D36with%20convp2.png)


