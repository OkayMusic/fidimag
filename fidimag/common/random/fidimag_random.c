#include <stdlib.h>  // rand(), srand()
#include <time.h>
#include <math.h>
#include "fidimag_random.h"

double single_random(void) {
    return ((double) int_rand()) / (double) MT19973_RAND_MAX;
}

void initial_rng_mt19973(mt19937_state *state) {
    int i;
    unsigned int seed;
    if (state->seed<0){
        seed = (unsigned int) time(NULL);
    }else{
        seed = state->seed;
    }
    
    state->MT[0] = seed & 0xFFFFFFFFU;
    for (i = 1; i < 624; i++) {
        state->MT[i] = (state->MT[i - 1] ^ (state->MT[i - 1] >> 30)) + i;
        state->MT[i] *= 0x6c078965U;
        state->MT[i] &= 0xFFFFFFFFU;
    }
}

inline unsigned int rand_int(mt19937_state *state) {
    
    unsigned int x;
    int index_t = state->index_t;
    
    x = (state->MT[index_t] & 0x1U) + (state->MT[(index_t + 1) % 624] & 0xFFFFFFFEU);
    state->MT[index_t] = (state->MT[(index_t + 397) % 624] ^ (x >> 1))^ state->matrix[x & 1];
    
    x = state->MT[index_t];
    x ^= (x >> 11);
    x ^= (x << 7) & 0x9d2c5680U;
    x ^= (x << 15) & 0xefc60000U;
    x ^= (x >> 18);
    
    state->index_t = (index_t + 1) % 624;
    
    return x;
}


double random_double(mt19937_state *state) {
	return ((double) rand_int(state)) / (double) MT19973_RAND_MAX;
}


const double inv_a[] = { -3.969683028665376e+01, 2.209460984245205e+02,
		-2.759285104469687e+02, 1.383577518672690e+02, -3.066479806614716e+01,
		2.506628277459239e+00 };

const double inv_b[] = { -5.447609879822406e+01, 1.615858368580409e+02,
		-1.556989798598866e+02, 6.680131188771972e+01, -1.328068155288572e+01 };

const double inv_c[] = { -7.784894002430293e-03, -3.223964580411365e-01,
		-2.400758277161838e+00, -2.549732539343734e+00, 4.374664141464968e+00,
		2.938163982698783e+00 };

const double inv_d[] = { 7.784695709041462e-03, 3.224671290700398e-01,
		2.445134137142996e+00, 3.754408661907416e+00 };

//inverse normal distribution function, see http://home.online.no/~pjacklam/notes/invnorm/
//it seems the link is broken,  see http://www.psychometrica.de/norming/NormalDistribution.java for the jave implementation
// or see https://github.com/stan-dev/stan/issues/1157 for another example
inline double invnorm(mt19937_state *state) {
	double q, r;
	double p = random_double(state);

    while (p <= 0 || p >= 1){
    	// random could be 0 or 1 which is not accepted
    	p = random_double(state);
    }

    if (p < 0.02425) {
		q = sqrt(-2 * log(p));
		return (((((inv_c[0] * q + inv_c[1]) * q + inv_c[2]) * q + inv_c[3]) * q + inv_c[4]) * q
				+ inv_c[5]) / ((((inv_d[0] * q + inv_d[1]) * q + inv_d[2]) * q + inv_d[3]) * q + 1);
	} else if (p > 0.97575) {
		q = sqrt(-2 * log(1 - p));
		return -(((((inv_c[0] * q + inv_c[1]) * q + inv_c[2]) * q + inv_c[3]) * q + inv_c[4]) * q
				+ inv_c[5]) / ((((inv_d[0] * q + inv_d[1]) * q + inv_d[2]) * q + inv_d[3]) * q + 1);
	} else {
		q = p - 0.5;
		r = q * q;
		return (((((inv_a[0] * r + inv_a[1]) * r + inv_a[2]) * r + inv_a[3]) * r + inv_a[4]) * r
				+ inv_a[5]) * q / (((((inv_b[0] * r + inv_b[1]) * r + inv_b[2]) * r + inv_b[3]) * r
				+ inv_b[4]) * r + 1);
	}
}

void gauss_random_vector(mt19937_state *state, double *x, int n) {
    for (int i = 0; i < n; i++) {
        x[i] = invnorm(state);
    }
}
