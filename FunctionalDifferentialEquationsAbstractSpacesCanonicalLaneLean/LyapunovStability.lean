import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure LyapunovStability where
  stateSpace : Type u
  equilibriumPoint : stateSpace
  lyapunovFunction : stateSpace → ℝ
  positiveDefinite : Prop
  derivativeNegative : Prop
  asymptoticStability : Prop

structure LyapunovStabilityEvidence (L : LyapunovStability) where
  positiveDefiniteClosed : L.positiveDefinite
  derivativeNegativeClosed : L.derivativeNegative
  asymptoticStabilityClosed : L.asymptoticStability

def LyapunovStabilityClosed (L : LyapunovStability) : Prop :=
  L.positiveDefinite ∧ L.derivativeNegative ∧ L.asymptoticStability

theorem lyapunov_stability_closed_from_evidence (L : LyapunovStability)
    (ev : LyapunovStabilityEvidence L) : LyapunovStabilityClosed L := by
  exact And.intro ev.positiveDefiniteClosed
    (And.intro ev.derivativeNegativeClosed ev.asymptoticStabilityClosed)

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse
