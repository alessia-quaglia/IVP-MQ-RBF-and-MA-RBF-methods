This repository contains the code developed for my thesis work: "*Modification of Classical Methods for Initial Value Problems
using Multiquadric and Matérn Radial Basis Functions*". The project explores an alternative approach to solving IVP of the form: 
$$u'(t) = f(u(t),t), \quad u(a) = u_0$$ 
by extending classical methods using Multiquadric (MQ) and Matérn (MA) Radial Basis Function (RBF) interpolation, 
specifically focusing on Euler's, Midpoint, Adams-Bashforth and Adams-Moulton schemes. 

*Classic methods IVP*: contains the implementation of classical methods (Euler's, Midpoint, two-step/three-step Adams-Bashforth 
and two-step Adams-Bashforth one-step Adams Moulton predictor-corrector methods) for solving the IVP $u'(t) = f(u(t), t)$ with $u(a) = u_0$ 
and computing the absolute error at the final point. 

*RBF methods IVP*: contains the modified MQ-RBF and MA-RBF versions of Euler's, Midpoint, two-step Adams-Bashfort and two-step Adams-Bashforth 
one-step Adams Moulton predictor-corrector methods. The user can specify which RBF kernel (Multiquadric or Matérn) to use directly through the function's input parameters.

*Stability region*: contains the functions for plotting the absolute stability regions in the complex plane of the analyzed one-step and multi-step methods, 
comparing the modified RBF versions with classical numerical schemes.

This main file includes the scripts that generate the tables and figures presented in my thesis. 
For ease of reference, the numbers following 'fig' and 'tab' in the code strictly match the respective numbering used in the thesis.
