import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean.AbstractFunctionSpaces

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure SemilinearEvolutionEquation (F : AbstractFunctionSpace ℝ X) where
  timeDomain : Set ℝ
  initialCondition : X
  linearPart : X → X
  nonlinearPart : X → X
  solution : ℝ → X
  initialConditionSatisfied : solution 0 = initialCondition
  differentialEquation : ∀ t ∈ timeDomain, HasDerivAt solution (linearPart (solution t) + nonlinearPart (solution t)) t
  solutionRegularity : solution ∈ F.carrier

structure SemilinearEvolutionEvidence (E : SemilinearEvolutionEquation F) where
  initialConditionClosed : E.initialConditionSatisfied
  differentialEquationClosed : ∀ t ∈ E.timeDomain, HasDerivAt E.solution (E.linearPart (E.solution t) + E.nonlinearPart (E.solution t)) t
  solutionRegularityClosed : E.solution ∈ F.carrier

def SemilinearEvolutionClosed (E : SemilinearEvolutionEquation F) : Prop :=
  E.initialConditionSatisfied ∧
  (∀ t ∈ E.timeDomain, HasDerivAt E.solution (E.linearPart (E.solution t) + E.nonlinearPart (E.solution t)) t) ∧
  (E.solution ∈ F.carrier)

theorem semilinearEvolutionClosedFromEvidence (E : SemilinearEvolutionEquation F) (Ev : SemilinearEvolutionEvidence E) :
  SemilinearEvolutionClosed E := by
  exact And.intro Ev.initialConditionClosed (And.intro Ev.differentialEquationClosed Ev.solutionRegularityClosed)

end HautevilleHouse
end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
