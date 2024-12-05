! PWR072: Split the variable initialization from the declaration to prevent the
!         implicit 'save' behavior

program test_implicit_save
  implicit none
  integer, dimension(3) :: A = [1, 1, 1], B = [2, 2, 2]
  integer :: result

  result = sum_array(A)
  print *, "Sum of A:", result ! Expected: 3

  result = sum_array(B)
  print *, "Sum of B:", result ! Expected: 6

contains

  pure integer function sum_array(array)
    implicit none
    integer, intent(in) :: array(:)
    integer :: result
    integer :: i

    result = 0

    do i = 1, size(array)
      result = result + array(i)
    end do

    sum_array = result
  end function sum_array

end program test_implicit_save
