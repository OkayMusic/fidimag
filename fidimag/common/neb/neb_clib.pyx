import numpy
cimport numpy as np
np.import_array()

     

cdef extern from "neb.h":
    void compute_tangents_c(double *ys, double *energy, double *tangents, int image_num, int nodes)
    void compute_dm_dt_c(double *ys, double *heff, double *dm_dt, int *pins, int image_num, int nodes) 


def compute_tangents(double [:, :] ys,
                            double [:] energy,
                            double [:, :] tangents,
                            total_image_num,
                            nodes):

    compute_tangents_c(&ys[0,0], &energy[0], &tangents[0,0], total_image_num, nodes)

def compute_dm_dt(double [:, :] ys,
                            double [:, :] heff,
                            double [:, :] dmdt,
                            int [:] pins,
                            total_image_num,
                            nodes):

    compute_dm_dt_c(&ys[0,0], &heff[0,0], &dmdt[0,0], &pins[0], total_image_num, nodes)