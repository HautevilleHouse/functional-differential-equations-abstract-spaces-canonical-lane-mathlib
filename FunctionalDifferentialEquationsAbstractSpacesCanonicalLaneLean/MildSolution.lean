import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure MildSolutionData where
  stateSpace : Type u
  linearOperator : stateSpace → stateSpace
  nonlinearPerturbation : stateSpace → stateSpace
  initialCondition : stateSpace
  variationOfParameters : Prop
  fixedPointEquation : Prop
  localExistence : Prop

structure MildSolutionEvidence (M : MildSolutionData) where
  variationOfParametersClosed : M.variationOfParameters
  fixedPointEquationClosed : M.fixedPointEquation
  localExistenceClosed : M.localExistence

def MildSolutionClosed (M : MildSolutionData) : Prop :=
  M.variationOfParameters ∧ M.fixedPointEquation ∧ M.localExistence

theorem mild_solution_closed_from_evidence (M : MildSolutionData)
    (ev : MildSolutionEvidence M) : MildSolutionClosed M := by
  exact And.intro ev.variationOfParametersClosed
    (And.intro ev.fixedPointEquationClosed ev.localExistenceClosed)

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse
