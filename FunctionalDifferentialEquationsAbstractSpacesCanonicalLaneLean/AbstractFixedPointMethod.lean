import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure ContractionMapping (X : Type u) [MetricSpace X] where
  map : X → X
  contractionFactor : ℝ
  factorLessThanOne : contractionFactor < 1
  lipschitzCondition : ∀ x y, dist (map x) (map y) ≤ contractionFactor * dist x y
  fixedPoint : X
  fixedPointProperty : map fixedPoint = fixedPoint

def ContractionMappingClosed (C : ContractionMapping X) : Prop :=
  C.factorLessThanOne ∧ C.lipschitzCondition ∧ C.fixedPointProperty

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse