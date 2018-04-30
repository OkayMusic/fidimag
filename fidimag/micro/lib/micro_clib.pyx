import numpy
cimport numpy as np
np.import_array()

cdef extern from "micro_clib.h":
    void compute_exch_field_micro(double *m, double *field,
                                  double *energy, double *Ms_inv,
                                  double A, double dx, double dy, double dz,
                                  int n, int *ngbs)
    void compute_exch_field_rkky_micro(double *m, double *field, double *energy, 
                                  double *Ms_inv, double sigma, int nx, double ny, 
                                  double nz, int z_bottom, int z_top)

    void dmi_field(double *m, double *field, double *energy, double *Ms_inv,
                   double *D, double dmi_vector[18], int n_dmi_ngbs,
                   double dx, double dy, double dz, 
                   int n, int *ngbs)

    void compute_uniaxial_anis(double *m, double *field,
                               double *energy, double *Ms_inv, 
                               double *Ku, double *axis,
                               int nx, int ny, int nz)
    
    double skyrmion_number(double *m, double *charge,
                           int nx, int ny, int nz, int *ngbs)


def compute_exchange_field_micro(np.ndarray[double, ndim=1, mode="c"] m,
                                 np.ndarray[double, ndim=1, mode="c"] field,
                                 np.ndarray[double, ndim=1, mode="c"] energy,
                                 np.ndarray[double, ndim=1, mode="c"] Ms_inv,
                                 A, dx, dy, dz, n,
            		             np.ndarray[int, ndim=2, mode="c"] ngbs):

    compute_exch_field_micro(&m[0], &field[0], &energy[0], &Ms_inv[0], A,
                             dx, dy, dz, n, &ngbs[0, 0])


def compute_exchange_field_micro_rkky(np.ndarray[double, ndim=1, mode="c"] m,
                                 np.ndarray[double, ndim=1, mode="c"] field,
                                 np.ndarray[double, ndim=1, mode="c"] energy,
                                 np.ndarray[double, ndim=1, mode="c"] Ms_inv,
                                 sigma, nx, ny, nz, z_bottom, z_top):

    compute_exch_field_rkky_micro(&m[0], &field[0], &energy[0], &Ms_inv[0], sigma,
                             nx, ny, nz, z_bottom, z_top)
    

def compute_dmi_field(np.ndarray[double, ndim=1, mode="c"] m,
                      np.ndarray[double, ndim=1, mode="c"] field,
                      np.ndarray[double, ndim=1, mode="c"] energy,
                      np.ndarray[double, ndim=1, mode="c"] Ms_inv,
                      np.ndarray[double, ndim=1, mode="c"] D,
                      np.ndarray[double, ndim=1, mode="c"] dmi_vector,
                      n_dmi_ngbs,
                      dx, dy, dz,
                      n, np.ndarray[int, ndim=2, mode="c"] ngbs
                      ):

    dmi_field(&m[0], &field[0], &energy[0], &Ms_inv[0], 
              &D[0], &dmi_vector[0], n_dmi_ngbs,
              dx, dy, dz, n, &ngbs[0, 0])
    

def compute_anisotropy_micro(np.ndarray[double, ndim=1, mode="c"] m,
                            np.ndarray[double, ndim=1, mode="c"] field,
                            np.ndarray[double, ndim=1, mode="c"] energy,
                            np.ndarray[double, ndim=1, mode="c"] Ms_inv,
                            np.ndarray[double, ndim=1, mode="c"] Ku,
                            np.ndarray[double, ndim=1, mode="c"] axis,
                            nx, ny, nz):

    compute_uniaxial_anis(&m[0], &field[0], &energy[0], &Ms_inv[0],
                          &Ku[0], &axis[0], nx, ny, nz)

def compute_skyrmion_number(np.ndarray[double, ndim=1, mode="c"] m,
                            np.ndarray[double, ndim=1, mode="c"] charge,
                            nx, ny, nz,
            		    np.ndarray[int, ndim=2, mode="c"] ngbs):

    return skyrmion_number(&m[0], &charge[0], nx, ny, nz, &ngbs[0, 0])
