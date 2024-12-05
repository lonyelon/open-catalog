! PWR055: consider applying offloading parallelism to forall loop

! NOT-PWR003: `pure` prevents OpenMP/OpenACC offloading
subroutine example(D, X, Y, a)
  implicit none
  real(kind=8), intent(out) :: D(:)
  real(kind=8), intent(in) :: X(:), Y(:)
  real(kind=8), intent(in) :: a
  integer :: i

  do i = 1, size(D, 1)
    D(i) = a * X(i) + Y(i)
  end do
end subroutine example
