# h1-stability

The codes provided in this repository are a supplement of the work

[1] _H^1-Stability of the L^2-Projection onto Finite Element Spaces on Adaptively Refined Quadrilateral Meshes_,
    Mazen Ali, Stefan A. Funken, Anja Schmidt, arXiv preprint 2020, https://arxiv.org/abs/2008.12759
    
    
This repository consists of
* MAPLE code to compute local mass matrices for triangles and quadrilaterals, polynomial degree can be varied
* mass matrices stored as .mat-files for further computation in MATLAB 
* MATLAB code to solve eigenvalue problem as described in [1], polynomial degree and number of hanging nodes can be varied

The tables in [1] represent the results from the codes 
* _compute_table_tri_ for triangular elements without hanging nodes
* _compute_table_ for parallelogrgam elements with 0,1,2 hanging nodes
* _compute_table_nonlinear_ for general quadrilateral elements (with some restrictions)
