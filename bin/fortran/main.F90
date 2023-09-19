program main

        use WMPlib


        character*9 :: string,output
        type(CNeutron_Type) :: ntrn
         
        print *, 'fin'
        string = "stringsss"
        call new(ntrn,1)
        call delete(ntrn)




end program main
        
