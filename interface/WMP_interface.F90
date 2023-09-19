 ! WMP_interface.F90 ! 
module WMPlib
        use, intrinsic :: iso_C_binding
        implicit none
        
        ! a container for a c_ptr ! 
        type CNeutron_type
                private
                type(c_ptr) :: object = C_null_ptr
        end type CNeutron_type

        interface
                function C_CNeutron__ctor(a) result(this) bind(c,name="__wmplib_MOD_cneutron__ctor")
                        import 
                        type(c_ptr) :: this 
                        integer(c_int) :: a
                end function C_CNeutron__ctor

                subroutine C_CNeutron__delete(this) bind(c,name="__wmplib_MOD_cneutron__delete")
                        import 
                        type(c_ptr) :: this
                end subroutine C_CNeutron__delete

                function C_CNeutron__grab_a(this) result(a) bind(c,name="__wmplib_MOD_cneutron__grab_a")
                        import
                        type(c_ptr) :: this
                        integer(c_int) :: a
                end function C_CNeutron__grab_a 
                       

        end interface

        
        interface new
                module procedure CNeutron__ctor
        end interface new
         
        interface delete
                module procedure CNeutron__delete
        end interface delete

        interface grab_a
                module procedure CNeutron__grab_a
        end interface grab_a

        public :: new, delete, grab_a, CNeutron_type
contains 
        subroutine CNeutron__ctor(this,a)
                type(CNeutron_type), intent(out) :: this
                integer :: a 
                this%object = C_CNeutron__ctor(int(a,c_int))
        end subroutine CNeutron__ctor

        subroutine CNeutron__delete(this)
                type(CNeutron_type), intent(inout) :: this
                call C_CNeutron__delete(this%object)
        end subroutine CNeutron__delete

        subroutine CNeutron__grab_a(this)
                type(CNeutron_type), intent(inout) :: this 
                integer :: a
                a = C_CNeutron__grab_a(this%object)
        end subroutine CNeutron__grab_a

end module WMPlib

! declare the type
! type(CNeutron_type) :: this 
! 
! call new(this,x) where x is just some int 
! then we can call functions like AWR(this)
! don't know if that's how I want to do it but we're trying it 
! Source: https://fortranwiki.org/fortran/show/Fortran+and+Cpp+objects




