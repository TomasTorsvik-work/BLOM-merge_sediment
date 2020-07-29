! Copyright (C) 2002  S. Legutke
! Copyright (C) 2020  K. Assmann, J. Tjiputra, J. Schwinger
!
! This file is part of BLOM/iHAMOCC.
!
! BLOM is free software: you can redistribute it and/or modify it under the
! terms of the GNU Lesser General Public License as published by the Free 
! Software Foundation, either version 3 of the License, or (at your option) 
! any later version. 
!
! BLOM is distributed in the hope that it will be useful, but WITHOUT ANY 
! WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS 
! FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for
! more details. 
!
! You should have received a copy of the GNU Lesser General Public License 
! along with BLOM. If not, see https://www.gnu.org/licenses/.


      MODULE mo_control_bgc
!***********************************************************************
!
!**** *MODULE mo_control_bgc* - control variables for bgc modules.
!
!     S.Legutke,        *MPI-MaD, HH*    28.02.02
!
!     Modified
!     --------
!     J.Schwinger,      *Uni Research, Bergen*   2018-04-12
!     - removed unused variables
!
!     Marco van Hulten  *GFI, Bergen*            2018-04-18
!     - added variables specific for sediment spin-up
!
!     T.Torsvik,        *UiB-GFI, Bergen*        2020-07-29
!     - merged changes from M.P.P. van Hulten sediment code
!
!     Purpose
!     -------
!     - declaration
!
!
!**********************************************************************
      implicit none

! Logical unit number for I/O.

      INTEGER :: io_stdo_bgc           !  standard out.
      INTEGER :: io_nml                !  namelist

! Control variables

      REAL    :: dtbgc            !  HAMOCC time step length [sec].
      REAL    :: dtb              !  HAMOCC time step length [days].
      INTEGER :: ndtdaybgc        !  time steps per day.
      REAL    :: dtoff            !  off-line sediment time step length [sec].
      REAL    :: dtsed            !  sediment time step length [sec].

      INTEGER :: ldtbgc           !  time step number from bgc restart file
      INTEGER :: ldtrunbgc        !  actual time steps of run.
#if defined(SED_OFFLINE)
      INTEGER :: nstep_in_month   !  accumulation counter for SED_OFFLINE.
      INTEGER :: maxyear_sediment !  number of years for off-line sediment integration.
      INTEGER :: maxyear_ocean    !  number of years for full MICOM-HAMOCC integration.
      INTEGER :: nburst_last      !  nburst from the end of the previous simulation (startup: 0).
      INTEGER :: nburst           !  counter of running sediment off-line.
      LOGICAL :: lsed_rclim       !  whether to read bottom seawater climatology from file (nml).
      LOGICAL :: lsed_wclim       !  whether to write bottom seawater climatology to file (nml).
      LOGICAL :: lsed_spinup      !  whether to spin up the sediment (nml).
      LOGICAL :: lread_clim       !  whether reading the climatology now.
      LOGICAL :: lwrite_clim      !  whether writing the climatology now.
      LOGICAL :: lcompleted_clim  !  whether we have a recent climatology available.
#endif
      LOGICAL :: lspinning_up_sed !  whether spinning up the sediment now.
      INTEGER :: nyear_global     !  ocean model year number, including sediment().

      INTEGER :: isac             !  acceleration factor for sediment, read from namelist


      REAL    :: rmasks = 0.0       !  value at wet cells in sediment.
      REAL    :: rmasko = 99999.00  !  value at wet cells in ocean.

! Logical switches
      LOGICAL, SAVE :: do_ndep=.true.    ! apply n-deposition   (set via namelist)
      LOGICAL, SAVE :: do_rivinpt=.true. ! apply riverine input (set via namelist)
      
      END MODULE mo_control_bgc
