# Computerized-Tomography
Matlab Code for performing the Filtered Backprojection (FBP), Fourier-Domain Reconstruction Algorithm and Alegebraic Reconstruction Technique (ART) of a crescend-shaped object needed for Computerized-Thomography (CT).
For further information on the mathematical background, please read https://en.wikipedia.org/wiki/Tomographic_reconstruction and https://en.wikipedia.org/wiki/Algebraic_reconstruction_technique or https://en.wikipedia.org/wiki/Kaczmarz_method.

## Note: 
The main obstacle was that the discrete circular convolution has negative indices whereas our initial implementation just shifted the values to the right, which lead to a flawed but somehow recognizable result.
![wrong](https://github.com/Kogl1n/Computerized-Tomography/raw/master/wrong.png)

# Files
```
ct.m: Script creating a crescend-shaped object and performing the Radon transform on it.
convp.m: (circular) convolution h of the discrete N-periodic functions f and g.
convp2.m: discrete convolution of N-periodic function f (as row vector) and NxM matrix A
Exercise_3_5.m: Main Script performing the filtered backprojection (FBP) using convp.m or convp2.m.

kaczmarz.m: Performs the reconstruction using the Algebraic Reconstruction Technique (ART).
```

# Examples
The following images show a comparison between performing a convolution with convp.m with N=18 and N=36 where N constitutes the number of discrete angular CT measurements.
## FBP (using convp) with N=18:
![Backprojection18](https://github.com/Kogl1n/Computerized-Tomography/raw/master/Crescend-Shaped%20Backprojection%20%20for%20N%3D18with%20convp1.png)
##  FBP  with N=36:
![Backprojection36](https://github.com/Kogl1n/Computerized-Tomography/raw/master/Crescend-Shaped%20Backprojection%20%20for%20N%3D36with%20convp1.png)

## Fourier-Domain Reconstruction Algorithm (using convp2) N=18:
![Backprojection182](https://github.com/Kogl1n/Computerized-Tomography/raw/master/Crescend-Shaped%20Backprojection%20%20for%20N%3D18with%20convp2.png)
## Fourier-Domain Reconstruction Algorithm (using convp2) N=36:
![Backprojection362](https://github.com/Kogl1n/Computerized-Tomography/raw/master/Crescend-Shaped%20Backprojection%20%20for%20N%3D36with%20convp2.png)


