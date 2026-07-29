import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure AbstractEvolutionEquation where
  stateSpace : Type u
  timeDomain : Type v
  vectorField : stateSpace → (timeDomain → stateSpace)
  carathéodoryCondition : Prop
  existenceInterval : Prop
  uniquenessCondition : Prop

structure EvolutionEquationEvidence (E : AbstractEvolutionEquation) where
  carathéodoryConditionClosed : E.carathéodoryCondition
  existenceIntervalClosed : E.existenceInterval
  uniquenessConditionClosed : E.uniquenessCondition

def EvolutionEquationClosed (E : AbstractEvolutionEquation) : Prop :=
  E.carathéodoryCondition ∧ E.existenceInterval ∧ E.uniquenessCondition

theorem evolution_equation_closed_from_evidence (E : AbstractEvolutionEquation)
    (ev : EvolutionEquationEvidence E) : EvolutionEquationClosed E := by
  exact And.intro ev.carathéodoryConditionClosed
    (And.intro ev.existenceIntervalClosed ev.uniquenessConditionClosed)

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse
