import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean.AbstractCauchyProblem

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure StabilityAnalysis (C : AbstractCauchyProblem F) where
  equilibriumPoint : X
  stableCondition : Prop
  asymptoticallyStableCondition : Prop
  lyapunovFunction : X → ℝ
  lyapunovFunctionPositiveDefinite : ∀ x ≠ C.initialValue, lyapunovFunction x > 0
  lyapunovFunctionDerivativeNegative : ∀ t ∈ C.timeInterval, HasDerivAt (lyapunovFunction ∘ C.solution) ( - (lyapunovFunction (C.solution t))) t

structure StabilityEvidence (S : StabilityAnalysis C) where
  stableConditionClosed : S.stableCondition
  asymptoticallyStableConditionClosed : S.asymptoticallyStableCondition
  lyapunovFunctionPositiveDefiniteClosed : ∀ x ≠ C.initialValue, S.lyapunovFunction x > 0
  lyapunovFunctionDerivativeNegativeClosed : ∀ t ∈ C.timeInterval, HasDerivAt (S.lyapunovFunction ∘ C.solution) (-(S.lyapunovFunction (C.solution t))) t

def StabilityClosed (S : StabilityAnalysis C) : Prop :=
  S.stableCondition ∧ S.asymptoticallyStableCondition ∧
  (∀ x ≠ C.initialValue, S.lyapunovFunction x > 0) ∧
  (∀ t ∈ C.timeInterval, HasDerivAt (S.lyapunovFunction ∘ C.solution) (-(S.lyapunovFunction (C.solution t))) t)

theorem stabilityClosedFromEvidence (S : StabilityAnalysis C) (E : StabilityEvidence S) :
  StabilityClosed S := by
  exact And.intro E.stableConditionClosed (And.intro E.asymptoticallyStableConditionClosed (And.intro E.lyapunovFunctionPositiveDefiniteClosed E.lyapunovFunctionDerivativeNegativeClosed))

end HautevilleHouse
end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
