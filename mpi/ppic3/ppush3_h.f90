!-----------------------------------------------------------------------
! Interface file for ppush3.f
      module ppush3_h
      implicit none
!
      interface
         subroutine PDICOMP32L(edges,nyzp,noff,nypmx,nzpmx,nypmn,nzpmn, &
     &ny,nz,kstrt,nvpy,nvpz,idps,idds)
         implicit none
         integer, intent(in) :: ny, nz, kstrt, nvpy, nvpz, idps, idds
         integer, intent(inout) :: nypmx, nzpmx, nypmn, nzpmn
         integer, dimension(idds), intent(inout) :: nyzp, noff
         real, dimension(idps), intent(inout) :: edges
         end subroutine
      end interface
!
      interface
         subroutine FCOMP32(nvp,nx,ny,nz,nvpy,nvpz,ierr)
         implicit none
         integer, intent(in) :: nvp, nx, ny, nz
         integer, intent(inout) :: nvpy, nvpz, ierr
         end subroutine
      end interface
!
      interface
         subroutine PDISTR32(part,edges,npp,nps,vtx,vty,vtz,vdx,vdy,vdz,&
     &npx,npy,npz,nx,ny,nz,idimp,npmax,idps,ipbc,ierr)
         implicit none
         integer, intent(in) :: nps, npx, npy, npz, nx, ny, nz, idimp
         integer, intent(in) :: npmax, idps, ipbc
         integer, intent(inout) :: npp, ierr
         real, intent(in) :: vtx, vty, vtz, vdx, vdy, vdz
         real, dimension(idimp,npmax), intent(inout) :: part
         real, dimension(idps), intent(in) :: edges
         end subroutine
      end interface
!
      interface
         subroutine PPGPUSH32L(part,fxyz,edges,npp,noff,ihole,qbm,dt,ek,&
     &nx,ny,nz,idimp,npmax,nxv,nypmx,nzpmx,idps,idds,ntmax,ipbc)
         implicit none
         integer, intent(in) :: npp, nx, ny, nz, idimp, npmax, nxv
         integer, intent(in) :: nypmx, nzpmx, idps, idds, ntmax, ipbc
         real, intent(in) :: qbm, dt
         real, intent(inout) :: ek
         real, dimension(idimp,npmax), intent(inout) :: part
         real, dimension(3,nxv,nypmx,nzpmx), intent(in) :: fxyz
         real, dimension(idps), intent(in) :: edges
         integer, dimension(idds), intent(in) :: noff
         integer, dimension(ntmax+1,2), intent(inout) :: ihole
         end subroutine
      end interface
!
      interface
         subroutine PPGPOST32L(part,q,npp,noff,qm,idimp,npmax,nxv,nypmx,&
     &nzpmx,idds)
         implicit none
         integer, intent(in) :: npp, idimp, npmax, nxv, nypmx, nzpmx
         integer, intent(in) :: idds
         real, intent(in) :: qm
         real, dimension(idimp,npmax), intent(in) :: part
         real, dimension(nxv,nypmx,nzpmx), intent(inout) :: q
         integer, dimension(idds), intent(in) :: noff
         end subroutine
      end interface
!
      interface
         subroutine PPDSORTP32YZL(parta,partb,npic,npp,noff,nyzp,idimp, &
     &npmax,nyzpm1,idds)
         implicit none
         integer, intent(in) :: npp, idimp, npmax, nyzpm1, idds
         real, dimension(idimp,npmax), intent(in) :: parta
         real, dimension(idimp,npmax), intent(inout) :: partb
         integer, dimension(nyzpm1), intent(inout) :: npic
         integer, dimension(idds), intent(in) :: noff, nyzp
         end subroutine
      end interface
!
      interface
         subroutine PPCGUARD32XL(fxyz,nyzp,nx,ndim,nxe,nypmx,nzpmx,idds)
         implicit none
         integer, intent(in) :: nx, ndim, nxe, nypmx, nzpmx, idds
         real, dimension(ndim,nxe,nypmx,nzpmx), intent(inout) :: fxyz
         integer, dimension(idds), intent(in) :: nyzp
         end subroutine
      end interface
!
      interface
         subroutine PPAGUARD32XL(q,nyzp,nx,nxe,nypmx,nzpmx,idds)
         implicit none
         integer, intent(in) :: nx, nxe, nypmx, nzpmx, idds
         real, dimension(nxe,nypmx,nzpmx), intent(inout) :: q
         integer, dimension(idds), intent(in) :: nyzp
         end subroutine
      end interface
!
      interface
         subroutine PPOIS332(q,fxyz,isign,ffc,ax,ay,az,affp,we,nx,ny,nz,&
     &kstrt,nvpy,nvpz,nzv,kxyp,kyzp,nzhd)
         implicit none
         integer, intent(in) :: isign, nx, ny, nz, kstrt, nvpy, nvpz
         integer, intent(in) :: nzv, kxyp, kyzp, nzhd
         real, intent(in) :: ax, ay, az, affp
         real, intent(inout) :: we
         complex, dimension(nzv,kxyp,kyzp), intent(in) :: q
         complex, dimension(3,nzv,kxyp,kyzp), intent(inout) :: fxyz
         complex, dimension(nzhd,kxyp,kyzp), intent(inout) :: ffc
         end subroutine
      end interface
!
      interface
         subroutine WPFFT32RINIT(mixup,sct,indx,indy,indz,nxhyzd,nxyzhd)
         implicit none
         integer, intent(in) :: indx, indy, indz, nxhyzd, nxyzhd
         integer, dimension(nxhyzd), intent(inout) :: mixup
         complex, dimension(nxyzhd), intent(inout) :: sct
         end subroutine
      end interface
!
      interface
         subroutine WPPFFT32R(f,g,h,bs,br,isign,ntpose,mixup,sct,ttp,   &
     &indx,indy,indz,kstrt,nvpy,nvpz,nxvh,nyv,nzv,kxyp,kyp,kyzp,kzp,    &
     &kxypd,kypd,kyzpd,kzpd,kzyp,nxhyzd,nxyzhd)
         implicit none
         integer, intent(in) :: isign, ntpose, indx, indy, indz, kstrt
         integer, intent(in) :: nvpy, nvpz, nxvh, nyv, nzv, kxyp, kyp
         integer, intent(in) :: kyzp, kzp, kxypd, kypd, kyzpd, kzpd
         integer, intent(in) :: kzyp, nxhyzd, nxyzhd
         real, intent(inout) :: ttp
         real, dimension(2*nxvh,kypd,kzpd), intent(inout) :: f
         complex, dimension(nyv,kxypd,kzpd), intent(inout) :: g
         complex, dimension(nzv,kxypd,kyzpd), intent(inout) :: h
         complex, dimension(kxyp*kzyp,kzp), intent(inout) :: bs, br
         integer, dimension(nxhyzd), intent(in) :: mixup
         complex, dimension(nxyzhd), intent(in) :: sct
         end subroutine
      end interface
!
      interface
         subroutine WPPFFT32R3(f,g,h,bs,br,isign,ntpose,mixup,sct,ttp,  &
     &indx,indy,indz,kstrt,nvpy,nvpz,nxvh,nyv,nzv,kxyp,kyp,kyzp,kzp,    &
     &kxypd,kypd,kyzpd,kzpd,kzyp,nxhyzd,nxyzhd)
         implicit none
         integer, intent(in) :: isign, ntpose, indx, indy, indz, kstrt
         integer, intent(in) :: nvpy, nvpz, nxvh, nyv, nzv, kxyp, kyp
         integer, intent(in) :: kyzp, kzp, kxypd, kypd, kyzpd, kzpd
         integer, intent(in) :: kzyp, nxhyzd, nxyzhd
         real, intent(inout) :: ttp
         real, dimension(3,2*nxvh,kypd,kzpd), intent(inout) :: f
         complex, dimension(3,nyv,kxypd,kzpd), intent(inout) :: g
         complex, dimension(3,nzv,kxypd,kyzpd), intent(inout) :: h
         complex, dimension(3,kxyp*kzyp,kzp), intent(inout) :: bs, br
         integer, dimension(nxhyzd), intent(in) :: mixup
         complex, dimension(nxyzhd), intent(in) :: sct
         end subroutine
      end interface
!
      interface
         subroutine PPFFT32RXX(f,isign,mixup,sct,indx,indy,indz,kstrt,  &
     &nvp,kypi,kypp,nxvh,kzpp,kypd,kzpd,nxhyzd,nxyzhd)
         implicit none
         integer, intent(in) :: isign, indx, indy, indz, kstrt, nvp
         integer, intent(in) :: kypi, kypp, nxvh, kzpp, kypd, kzpd
         integer, intent(in) :: nxhyzd, nxyzhd
         real, dimension(2*nxvh,kypd,kzpd), intent(inout) :: f
         integer, dimension(nxhyzd), intent(in) :: mixup
         complex, dimension(nxyzhd), intent(in) :: sct
         end subroutine
      end interface
!
      interface
         subroutine PPFFT32RXY(g,isign,mixup,sct,indx,indy,indz,kstrt,  &
     &nvpy,nvpz,kxypi,kxypp,nyv,kzpp,kxypd,kzpd,nxhyzd,nxyzhd)
         implicit none
         integer, intent(in) :: isign, indx, indy, indz, kstrt, nvpy
         integer, intent(in) :: nvpz, kxypi, kxypp, nyv, kzpp, kxypd
         integer, intent(in) :: kzpd, nxhyzd, nxyzhd
         complex, dimension(nyv,kxypd,kzpd), intent(inout) :: g
         integer, dimension(nxhyzd), intent(in) :: mixup
         complex, dimension(nxyzhd), intent(in) :: sct
         end subroutine
      end interface
!
      interface
         subroutine PPFFT32RXZ(h,isign,mixup,sct,indx,indy,indz,kstrt,  &
     &nvpy,nvpz,kxypi,kxypp,nzv,kyzp,kxypd,kyzpd,nxhyzd,nxyzhd)
         implicit none
         integer, intent(in) :: isign, indx, indy, indz, kstrt, nvpy
         integer, intent(in) :: nvpz, kxypi, kxypp, nzv, kyzp, kxypd
         integer, intent(in) :: kyzpd, nxhyzd, nxyzhd
         complex, dimension(nzv,kxypd,kyzpd), intent(inout) :: h
         integer, dimension(nxhyzd), intent(in) :: mixup
         complex, dimension(nxyzhd), intent(in) :: sct
         end subroutine
      end interface
!
      interface
         subroutine PPFFT32R3XX(f,isign,mixup,sct,indx,indy,indz,kstrt, &
     &nvp,kypi,kypp,nxvh,kzpp,kypd,kzpd,nxhyzd,nxyzhd)
         implicit none
         integer, intent(in) :: isign, indx, indy, indz, kstrt, nvp
         integer, intent(in) :: kypi, kypp, nxvh, kzpp, kypd, kzpd
         integer, intent(in) :: nxhyzd, nxyzhd
         real, dimension(3,2*nxvh,kypd,kzpd), intent(inout) :: f
         integer, dimension(nxhyzd), intent(in) :: mixup
         complex, dimension(nxyzhd), intent(in) :: sct
         end subroutine
      end interface
!
      interface
         subroutine PPFFT32R3XY(g,isign,mixup,sct,indx,indy,indz,kstrt, &
     &nvpy,nvpz,kxypi,kxypp,nyv,kzpp,kxypd,kzpd,nxhyzd,nxyzhd)
         implicit none
         integer, intent(in) :: isign, indx, indy, indz, kstrt, nvpy
         integer, intent(in) :: nvpz, kxypi, kxypp, nyv, kzpp, kxypd
         integer, intent(in) :: kzpd, nxhyzd, nxyzhd
         complex, dimension(3,nyv,kxypd,kzpd), intent(inout) :: g
         integer, dimension(nxhyzd), intent(in) :: mixup
         complex, dimension(nxyzhd), intent(in) :: sct
         end subroutine
      end interface
!
      interface
         subroutine PPFFT32R3XZ(h,isign,mixup,sct,indx,indy,indz,kstrt, &
     &nvpy,nvpz,kxypi,kxypp,nzv,kyzp,kxypd,kyzpd,nxhyzd,nxyzhd)
         implicit none
         integer, intent(in) :: isign, indx, indy, indz, kstrt, nvpy
         integer, intent(in) :: nvpz, kxypi, kxypp, nzv, kyzp, kxypd
         integer, intent(in) :: kyzpd, nxhyzd, nxyzhd
         complex, dimension(3,nzv,kxypd,kyzpd), intent(inout) :: h
         integer, dimension(nxhyzd), intent(in) :: mixup
         complex, dimension(nxyzhd), intent(in) :: sct
         end subroutine
      end interface
!
      interface
         function ranorm()
         implicit none
         double precision :: ranorm
         end function
      end interface
!
      end module
