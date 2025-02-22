!$Id: init_obscovar_pdaf.F90 1441 2013-10-04 10:33:42Z lnerger $
!BOP
!
! !ROUTINE: init_obscovar_pdaf --- Initialize observation error covariance matrix
!
! !INTERFACE:
SUBROUTINE init_obscovar_pdaf(step, dim_obs, dim_obs_p, covar, m_state_p, &
     isdiag)

! !DESCRIPTION:
! User-supplied routine for PDAF.
! Used in the filters: EnKF
!
! The routine is called during the analysis
! step when an ensemble of observations is
! generated by PDAF\_enkf\_obs\_ensemble. 
! It has to initialize the global observation 
! error covariance matrix.
!
! !REVISION HISTORY:
! 2013-02 - Lars Nerger - Initial code
! Later revisions - see svn log
!
! !USES:
  USE mod_assimilation, &
       ONLY: rms_obs

  IMPLICIT NONE

! !ARGUMENTS:
  INTEGER, INTENT(in) :: step                 ! Current time step
  INTEGER, INTENT(in) :: dim_obs              ! Dimension of observation vector
  INTEGER, INTENT(in) :: dim_obs_p            ! PE-local dimension of obs. vector
  REAL, INTENT(out) :: covar(dim_obs,dim_obs) ! Observation error covar. matrix
  REAL, INTENT(in) :: m_state_p(dim_obs_p)    ! Observation vector
  LOGICAL, INTENT(out) :: isdiag              ! Whether matrix R is diagonal

! !CALLING SEQUENCE:
! Called by: PDAF_enkf_obs_ensemble    (as U_init_obs_covar)
!EOP

! *** local variables ***
!   INTEGER :: i          ! Index of observation component
!   REAL :: variance_obs  ! ariance of observations


! **********************
! *** INITIALIZATION ***
! **********************


! ******************************************************
! *** Initialize observation error covariance matrix ***
! ******************************************************

  WRITE (*,*) 'TEMPLATE init_obscovar_pdaf.F90: Set observation covariance matrix here!'

! covar = ?

  ! Define whether the matrix is diagonal (.true./.false.)
!  isdiag = ?

END SUBROUTINE init_obscovar_pdaf
