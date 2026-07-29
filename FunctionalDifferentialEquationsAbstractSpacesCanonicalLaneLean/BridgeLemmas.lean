import canonicalLaneMathlib.AdmissibleClass
import FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean.FunctionalEquationAdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FDESWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse