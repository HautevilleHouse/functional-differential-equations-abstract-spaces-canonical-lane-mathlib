import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure FunctionalDifferentialEquationsAdmittedObject where
  space : Type u
  topology : TopologicalSpace space
  abstractSpace : Prop
  functionalDifferentialEquation : Prop
  wellPosedness : Prop
  conclusion : wellPosedness

def FunctionalDifferentialEquationsWitnessClosed (O : FunctionalDifferentialEquationsAdmittedObject) : Prop :=
  O.wellPosedness

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse