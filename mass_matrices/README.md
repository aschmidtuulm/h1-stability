# mass_matrices

This repository includes the MAPLE codes

* _comp_mass_matrix_quad.mw_ for the computation of local mass matrices for quadrilaterals
* _comp_mass_matrix_tri.mw_ for the computation of local mass matrices for triangles

The polynomial degree can be adjusted.

The mass matrices are stored as .mat-files in the folder structure _tri/_ for triangles and _quad/_ for quadrilaterals, subfolder indicate the polynomial degree _/tri/1_  for linear and _/quad/Bi1_ for bilinear, etc.
Additionally, for the non-linear quadrilateral case we also need M_x, M_y (compare [1]), stored as _mass_matrix_x_ and _mass_matrix_y_ and gained via small adaption of the MAPLE codes.
In the further course of the work, these mass matrices are read out and used for computation.
