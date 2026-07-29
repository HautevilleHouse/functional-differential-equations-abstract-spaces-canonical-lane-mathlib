import canonicalLaneMathlib.AdmissibleClass
import FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse