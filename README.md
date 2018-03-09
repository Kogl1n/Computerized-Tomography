# Computerized-Tomography
Matlab Code for performing the Filtered Backprojection (FBP) and Alegebraic Reconstruction Technique (ART) of a crescend-shaped object needed for Computerized-Thomography (CT).
For further information on the mathematical background, please read https://en.wikipedia.org/wiki/Tomographic_reconstruction and https://en.wikipedia.org/wiki/Algebraic_reconstruction_technique or https://en.wikipedia.org/wiki/Kaczmarz_method.

Software used in production are https://github.com/odlgroup/odl and https://github.com/tomopy/tomopy/ with GPU support and several other reconstruction and artifact supression methods.

## Note: 
The main obstacle was that the discrete circular convolution (which also has negative indices) was incompatible with the provided definition of the inverse Fourier transform of the lowpass filter, which lead to a flawed but somehow recognizable result. It is mirrored which gave us the hint for changing sides of the filter.
![wrong](https://github.com/Kogl1n/Computerized-Tomography/raw/master/wrong.png)

# Files
```
ct.m: Script creating a crescend-shaped object and performing the Radon transform on it.
convp.m: (Circular) convolution h of the discrete N-periodic functions f and g. 
          Used to compute the conv. for every angle.
convp2.m: Discrete convolution of N-periodic function f (as row vector) and NxM matrix A. 
          Used to compute the conv for all angles at the same time.
Exercise_3_5.m: Main Script performing the filtered backprojection (FBP) using convp.m or convp2.m.

kaczmarz.m: Performs the reconstruction using the Algebraic Reconstruction Technique (ART).
```

# Examples
The following images show a comparison between performing a convolution with convp.m with N=18 and N=36 where N constitutes the number of discrete angular CT measurements. It is also possible to change the distances of the dectector array resulting in fine grained backprojections in case of smaller distances or coarse grained otherwise which result with interpolation in blurry images.

## FBP (using convp) with N=18:
![Backprojection18](https://github.com/Kogl1n/Computerized-Tomography/raw/master/Crescend-Shaped%20Backprojection%20%20for%20N%3D18with%20convp1.png)
##  FBP  with N=36:
![Backprojection36](https://github.com/Kogl1n/Computerized-Tomography/raw/master/Crescend-Shaped%20Backprojection%20%20for%20N%3D36with%20convp1.png)

## Fourier-Domain Reconstruction Algorithm (using convp2) N=18:
![Backprojection182](https://github.com/Kogl1n/Computerized-Tomography/raw/master/Crescend-Shaped%20Backprojection%20%20for%20N%3D18with%20convp2.png)
## Fourier-Domain Reconstruction Algorithm (using convp2) N=36:
![Backprojection362](https://github.com/Kogl1n/Computerized-Tomography/raw/master/Crescend-Shaped%20Backprojection%20%20for%20N%3D36with%20convp2.png)


