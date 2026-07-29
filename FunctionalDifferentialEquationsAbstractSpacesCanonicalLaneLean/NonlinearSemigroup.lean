import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure NonlinearSemigroup where
  stateSpace : Type u
  family : ℝ → (stateSpace → stateSpace)
  semigroupProperty : ∀ t s, family (t + s) = family t ∘ family s
  continuity : ∀ x, ContinuousAt (λ t => family t x) 0
  generation : Prop

structure NonlinearSemigroupEvidence (S : NonlinearSemigroup) where
  semigroupPropertyClosed : S.semigroupProperty
  continuityClosed : S.continuity
  generationClosed : S.generation

def NonlinearSemigroupClosed (S : NonlinearSemigroup) : Prop :=
  S.semigroupProperty ∧ S.continuity ∧ S.generation

theorem nonlinear_semigroup_closed_from_evidence (S : NonlinearSemigroup)
    (ev : NonlinearSemigroupEvidence S) : NonlinearSemigroupClosed S := by
  exact And.intro ev.semigroupPropertyClosed
    (And.intro ev.continuityClosed ev.generationClosed)

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse
