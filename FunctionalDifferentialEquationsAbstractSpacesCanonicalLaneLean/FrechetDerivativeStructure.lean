import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean.AbstractFunctionSpaces

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure FrechetDerivativeStructure (U V : AbstractFunctionSpace) where
  derivativeMap : U.carrier → (U.carrier → V.carrier)
  linearityBoundedness : Prop
  chainRule : Prop

differentiableAt (f : U.carrier → V.carrier) (x : U.carrier) : Prop := sorry

structure FrechetDerivativeEvidence (U V : AbstractFunctionSpace) (F : FrechetDerivativeStructure U V) where
  linearityBoundednessClosed : F.linearityBoundedness
  chainRuleClosed : F.chainRule

def FrechetDerivativeClosed (U V : AbstractFunctionSpace) (F : FrechetDerivativeStructure U V) : Prop :=
  F.linearityBoundedness ∧ F.chainRule

theorem frechet_derivative_closed_from_evidence
    (U V : AbstractFunctionSpace) (F : FrechetDerivativeStructure U V)
    (E : FrechetDerivativeEvidence U V F) : FrechetDerivativeClosed U V F := by
  exact And.intro E.linearityBoundednessClosed E.chainRuleClosed

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse