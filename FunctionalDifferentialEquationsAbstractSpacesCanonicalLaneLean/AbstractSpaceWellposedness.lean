import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure AbstractFunctionSpace where
  carrier : Type u
  norm : carrier → ℝ
  completeness : Prop
  separability : Prop

structure AbstractSpaceWellposednessPackage where
  space : AbstractFunctionSpace
  wellposedOperator : carrier → carrier
  existenceResult : Prop
  uniquenessResult : Prop
  continuousDependence : Prop

structure AbstractSpaceWellposednessEvidence (P : AbstractSpaceWellposednessPackage) where
  existenceResultClosed : P.existenceResult
  uniquenessResultClosed : P.uniquenessResult
  continuousDependenceClosed : P.continuousDependence

def AbstractSpaceWellposednessClosed (P : AbstractSpaceWellposednessPackage) : Prop :=
  P.existenceResult ∧ P.uniquenessResult ∧ P.continuousDependence

theorem abstract_space_wellposedness_closed_from_evidence
    (P : AbstractSpaceWellposednessPackage) (E : AbstractSpaceWellposednessEvidence P) :
    AbstractSpaceWellposednessClosed P := by
  exact And.intro E.existenceResultClosed
    (And.intro E.uniquenessResultClosed E.continuousDependenceClosed)

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse