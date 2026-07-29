import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean.AbstractFunctionSpaces

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure ODESolvabilityData (X : AbstractFunctionSpace) where
  vectorField : X.carrier → X.carrier
  lipschitzCondition : Prop
  localExistence : Prop
  uniqueness : Prop
  continuousDependence : Prop

structure ODESolvabilityEvidence (X : AbstractFunctionSpace) (O : ODESolvabilityData X) where
  lipschitzConditionClosed : O.lipschitzCondition
  localExistenceClosed : O.localExistence
  uniquenessClosed : O.uniqueness
  continuousDependenceClosed : O.continuousDependence

def ODESolvabilityClosed (X : AbstractFunctionSpace) (O : ODESolvabilityData X) : Prop :=
  O.lipschitzCondition ∧ O.localExistence ∧ O.uniqueness ∧ O.continuousDependence

theorem ode_solvability_closed_from_evidence
    (X : AbstractFunctionSpace) (O : ODESolvabilityData X)
    (E : ODESolvabilityEvidence X O) : ODESolvabilityClosed X O := by
  exact And.intro E.lipschitzConditionClosed
    (And.intro E.localExistenceClosed
      (And.intro E.uniquenessClosed E.continuousDependenceClosed))

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse