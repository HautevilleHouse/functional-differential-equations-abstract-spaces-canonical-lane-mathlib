import canonicalLaneMathlib.AdmissibleClass
import FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean.BridgeLemmas
import FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

def ConstrainedFDESClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fdes_endgame (A : AdmissibleClass) :
    ConstrainedFDESClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse