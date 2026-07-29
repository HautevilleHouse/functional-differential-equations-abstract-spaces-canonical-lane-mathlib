import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure FunctionAlgebra (X : Type u) where
  carrier : Set (X → ℝ)
  addClosed : ∀ f g ∈ carrier, f + g ∈ carrier
  mulClosed : ∀ f g ∈ carrier, f * g ∈ carrier
  containsConst : ∀ r : ℝ, (fun _ => r) ∈ carrier
  containsIdentity : (fun x : X => x) ∈ carrier

def FunctionAlgebraClosed {X : Type u} (A : FunctionAlgebra X) : Prop :=
  A.addClosed ∧ A.mulClosed ∧ A.containsConst ∧ A.containsIdentity

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse