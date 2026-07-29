import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean.FrechetDerivativeStructure

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure ImplicitFunctionData (U V W : AbstractFunctionSpace) where
  F : U.carrier × V.carrier → W.carrier
  basePoint : U.carrier × V.carrier
  derivativeInvertible : Prop
  existenceNeighborhood : Prop
  uniqueness : Prop

structure ImplicitFunctionEvidence (U V W : AbstractFunctionSpace) (I : ImplicitFunctionData U V W) where
  derivativeInvertibleClosed : I.derivativeInvertible
  existenceNeighborhoodClosed : I.existenceNeighborhood
  uniquenessClosed : I.uniqueness

def ImplicitFunctionClosed (U V W : AbstractFunctionSpace) (I : ImplicitFunctionData U V W) : Prop :=
  I.derivativeInvertible ∧ I.existenceNeighborhood ∧ I.uniqueness

theorem implicit_function_closed_from_evidence
    (U V W : AbstractFunctionSpace) (I : ImplicitFunctionData U V W)
    (E : ImplicitFunctionEvidence U V W I) : ImplicitFunctionClosed U V W I := by
  exact And.intro E.derivativeInvertibleClosed
    (And.intro E.existenceNeighborhoodClosed E.uniquenessClosed)

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse