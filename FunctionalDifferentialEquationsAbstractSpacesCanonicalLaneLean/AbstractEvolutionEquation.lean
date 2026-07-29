import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure EvolutionEquation (X : Type u) [NormedAddCommGroup X] [BanachSpace ℝ X] where
  timeInterval : Set ℝ
  initialCondition : X
  generator : Set (X → X)
  solutionExistence : Prop
  solutionUniqueness : Prop

def EvolutionEquationClosed (E : EvolutionEquation X) : Prop :=
  E.solutionExistence ∧ E.solutionUniqueness

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse