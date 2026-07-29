import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure AdmittedObject where
  space : AbstractFunctionSpace
  completeness : space.completeness

default instance : Inhabited AdmittedObject where
  default :=
    { space := { carrier := Nat, norm := fun _ => 0, completeness := by trivial, separability := by trivial }
      completeness := by trivial
    }

structure AdmissibleClass where
  object : AdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.completeness ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse