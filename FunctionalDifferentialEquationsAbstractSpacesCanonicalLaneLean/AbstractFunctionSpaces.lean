import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure AbstractFunctionSpace where
  carrier : Type u
  norm : carrier → ℝ
  completeness : Prop
  linearity : Prop
  normedSpaceCondition : Prop

dualSpace : AbstractFunctionSpace → Type u

dualSpace S := { f : S.carrier → ℝ | f is linear }

structure AbstractFunctionSpaceEvidence (S : AbstractFunctionSpace) where
  completenessClosed : S.completeness
  linearityClosed : S.linearity
  normedSpaceConditionClosed : S.normedSpaceCondition

def AbstractFunctionSpaceClosed (S : AbstractFunctionSpace) : Prop :=
  S.completeness ∧ S.linearity ∧ S.normedSpaceCondition

theorem abstract_function_space_closed_from_evidence
    (S : AbstractFunctionSpace) (E : AbstractFunctionSpaceEvidence S) :
    AbstractFunctionSpaceClosed S := by
  exact And.intro E.completenessClosed (And.intro E.linearityClosed E.normedSpaceConditionClosed)

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse