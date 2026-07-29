import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean.ODESolvabilityAbstract

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure DelayEquationData (X : AbstractFunctionSpace) where
  historySpace : AbstractFunctionSpace
  delay : ℝ
  delayOperator : X.carrier → historySpace.carrier
  stateEquation : X.carrier → X.carrier
  wellposedness : Prop
  stability : Prop

structure DelayEquationEvidence (X : AbstractFunctionSpace) (D : DelayEquationData X) where
  wellposednessClosed : D.wellposedness
  stabilityClosed : D.stability

def DelayEquationClosed (X : AbstractFunctionSpace) (D : DelayEquationData X) : Prop :=
  D.wellposedness ∧ D.stability

theorem delay_equation_closed_from_evidence
    (X : AbstractFunctionSpace) (D : DelayEquationData X)
    (E : DelayEquationEvidence X D) : DelayEquationClosed X D := by
  exact And.intro E.wellposednessClosed E.stabilityClosed

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse