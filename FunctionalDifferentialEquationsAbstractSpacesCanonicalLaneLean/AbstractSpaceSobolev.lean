import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure SobolevSpace (X : Type u) [NormedAddCommGroup X] [BanachSpace ℝ X] where
  exponent : ℝ
  derivativeOrder : ℕ
  normDefined : Prop
  completeness : Prop
  embeddingTheorems : Prop

def SobolevSpaceClosed (S : SobolevSpace X) : Prop :=
  S.normDefined ∧ S.completeness ∧ S.embeddingTheorems

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse