// code to simulate random insertions in genomes and record statistics of insertion-free regions (IFRs)

#include <stdio.h>
#include <stdlib.h>

#define RND drand48()

#define _NIT 100       // base number of simulations per experiment
#define _N 6           // number of experiments (different studies, gene vs genome)
#define _MAXL 300      // maximum expected length of IFR for lazy allocation
#define _MAXG 5000000  // maximum expected genome length for lazy allocation

int main(void)
{
  int r;
  int *hist;
  int i, j;
  int nit;
  double mean, mean0;
  int run;
  FILE *fp, *fp1;
  char fstr[100];
  int plot;
  int *genome;
  int it;
  int score;

  // statistics of different experiments: G (genome length); N (number of insertions); g (length of region of interest)
  double G[_N] = {4791961, 4878012, 4631469, 4791961, 4878012, 4631469};
  double N[_N] = {371775, 549086, 901383, 371775, 549086, 901383};
  double g[_N] = {4791961, 4878012, 4631469, 1000, 1000, 1000};

  // allocate memory for simulated genome and statistics record
  genome = (int*)malloc(sizeof(int)*_MAXG);
  hist = (int*)malloc(sizeof(int)*100*_NIT*_MAXL);

  // loop through experiments
  for(run = 0; run < _N; run++)
    {
      // open files for output
      sprintf(fstr, "outprobgene-new-%i.txt", run);
      fp = fopen(fstr, "w");
      sprintf(fstr, "outnumgene-new-%i.txt", run);
      fp1 = fopen(fstr, "w");

      // genome-wide experiments run for fewer iterations than gene-length ones
      if(run >= 3) nit = 100*_NIT;
      else nit = _NIT;
      
      // perform nit random simulations
      for(it = 0; it < nit; it++)
	{
	  printf("Experiment %i/%i run %i/%i\n", run, _N, it, nit);
	  
	  // initialise empty genome, length g
	  for(i = 0; i < g[run]; i++) genome[i] = 0;

	  // place exact number of insertions required (insertion rate * region length)
	  for(i = 0; i < N[run]/G[run]*g[run]; i++)
	    {
	      do{
		r = RND*g[run];
	      }while(genome[r] == 1);
	      genome[r] = 1;
	    }

	  // initialise IFR counter, and this iteration's record of IFR lengths
	  for(i = 0; i < _MAXL; i++)
	    hist[it*_MAXL+i] = 0;
	  r = 0; 

	  // move through simulated genome recording IFR lengths
	  for(i = 0; i < g[run]; i++)
	    {
	      if(genome[i] == 1)
		{
		  hist[it*_MAXL+r]++;
		  r = 0;
		}
	      else r++;
	    }
	}

      // build up set of p-values length by length (i)
      for(i = 0; i < _MAXL; i++)
	{
	  plot = mean = mean0 = 0;
	  // loop through simulation outputs
	  for(it = 0; it < nit; it++)
	    {
	      score = 0;
	      // if we've seen an IFR of length i or above:
	      for(j = i; j < _MAXL; j++)
		{
		  // increase expected count of such IFRs
		  mean += hist[it*_MAXL+j];
		  // increase recorded count from single simulation instance
		  if(it == 0) mean0 += hist[it*_MAXL+j];
		  // record that such an IFR was found in this simulation
		  if(hist[it*_MAXL+j]) score = 1;
		}
	      // update the cross-simulation probability of observation
	      plot += score;
	    }
	  // output probability of seeing at least one IFR length >= i
	  fprintf(fp, "%i %f\n", i, (double)plot/nit);
	  // output expected number of IFRs length >= i from one and many simulations
  	  fprintf(fp1, "%i %f %f\n", i, mean0, mean/nit);
	}

      // close files
      fclose(fp);
      fclose(fp1);
    }
  
  return 0;
}
