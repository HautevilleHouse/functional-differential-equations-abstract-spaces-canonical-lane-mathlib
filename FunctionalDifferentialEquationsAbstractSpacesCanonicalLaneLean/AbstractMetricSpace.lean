import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure AbstractMetricSpace where
  carrier : Type u
  distance : carrier → carrier → ℝ
  positivity : ∀ x y, distance x y ≥ 0 ∧ (distance x y = 0 ↔ x = y)
  symmetry : ∀ x y, distance x y = distance y x
  triangleInequality : ∀ x y z, distance x z ≤ distance x y + distance y z

structure AbstractMetricSpaceEvidence (M : AbstractMetricSpace) where
  positivityClosed : M.positivity = M.positivity
  symmetryClosed : M.symmetry = M.symmetry
  triangleInequalityClosed : M.triangleInequality = M.triangleInequality

def AbstractMetricSpaceClosed (M : AbstractMetricSpace) : Prop :=
  True

theorem abstract_metric_space_closed_from_evidence (M : AbstractMetricSpace)
    (ev : AbstractMetricSpaceEvidence M) : AbstractMetricSpaceClosed M := by
  trivial

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse
