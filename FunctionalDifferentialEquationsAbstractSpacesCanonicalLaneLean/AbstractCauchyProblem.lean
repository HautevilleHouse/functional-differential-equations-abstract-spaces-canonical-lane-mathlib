import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean.AbstractFunctionSpaces

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure AbstractCauchyProblem (F : AbstractFunctionSpace ℝ X) where
  timeInterval : Set ℝ
  initialTime : ℝ
  initialValue : X
  vectorField : ℝ → X → X
  solution : ℝ → X
  initialCondition : solution initialTime = initialValue
  solutionSatisfiesODE : ∀ t ∈ timeInterval, HasDerivAt solution (vectorField t (solution t)) t
  solutionInSpace : solution ∈ F.carrier

structure AbstractCauchyProblemEvidence (C : AbstractCauchyProblem F) where
  initialConditionClosed : C.solution C.initialTime = C.initialValue
  solutionSatisfiesODEClosed : ∀ t ∈ C.timeInterval, HasDerivAt C.solution (C.vectorField t (C.solution t)) t
  solutionInSpaceClosed : C.solution ∈ F.carrier

def AbstractCauchyProblemClosed (C : AbstractCauchyProblem F) : Prop :=
  C.solution C.initialTime = C.initialValue ∧
  (∀ t ∈ C.timeInterval, HasDerivAt C.solution (C.vectorField t (C.solution t)) t) ∧
  (C.solution ∈ F.carrier)

theorem abstractCauchyProblemClosedFromEvidence (C : AbstractCauchyProblem F) (E : AbstractCauchyProblemEvidence C) :
  AbstractCauchyProblemClosed C := by
  exact And.intro E.initialConditionClosed (And.intro E.solutionSatisfiesODEClosed E.solutionInSpaceClosed)

end HautevilleHouse
end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
