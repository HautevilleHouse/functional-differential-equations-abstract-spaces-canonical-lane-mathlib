import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure Semigroup (X : Type u) [NormedAddCommGroup X] [BanachSpace ℝ X] where
  family : ℝ → (X → X)
  semigroupProperty : ∀ s t, family (s + t) = family s ∘ family t
  strongContinuity : Prop
  generatorUniqueness : Prop

def SemigroupClosed (S : Semigroup X) : Prop :=
  S.semigroupProperty ∧ S.strongContinuity ∧ S.generatorUniqueness

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse