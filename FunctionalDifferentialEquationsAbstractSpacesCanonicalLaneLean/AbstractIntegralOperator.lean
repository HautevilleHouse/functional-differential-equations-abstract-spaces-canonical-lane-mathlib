import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure IntegralOperator (X : Type u) [NormedAddCommGroup X] [BanachSpace ℝ X] where
  kernel : X × X → ℝ
  domain : Set (X → X)
  boundedness : Prop
  compactness : Prop
  spectralProperties : Prop

def IntegralOperatorClosed (I : IntegralOperator X) : Prop :=
  I.boundedness ∧ I.compactness ∧ I.spectralProperties

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse