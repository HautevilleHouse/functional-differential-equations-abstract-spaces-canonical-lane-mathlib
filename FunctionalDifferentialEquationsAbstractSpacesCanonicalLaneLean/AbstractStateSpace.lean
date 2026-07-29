import canonicalLaneMathlib.AdmissibleClass

/-!
# Abstract State Space Package
-/

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure AbstractStateSpacePackage where
  stateSpaceType : Type u
  metricStructure : Prop
  linearStructure : Prop
  completeness : Prop
  boundedness : Prop

structure AbstractStateSpaceEvidence (S : AbstractStateSpacePackage) where
  metricStructureClosed : S.metricStructure
  linearStructureClosed : S.linearStructure
  completenessClosed : S.completeness
  boundednessClosed : S.boundedness

def AbstractStateSpaceClosed (S : AbstractStateSpacePackage) : Prop :=
  S.metricStructure ∧ S.linearStructure ∧ S.completeness ∧ S.boundedness

theorem abstract_state_space_closed_from_evidence
    (S : AbstractStateSpacePackage) (E : AbstractStateSpaceEvidence S) :
    AbstractStateSpaceClosed S := by
  exact And.intro E.metricStructureClosed
    (And.intro E.linearStructureClosed
      (And.intro E.completenessClosed E.boundednessClosed))

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse