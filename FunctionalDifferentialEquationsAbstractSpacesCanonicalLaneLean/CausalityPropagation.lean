import canonicalLaneMathlib.AdmissibleClass
import FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean.FunctionalDifferentialOperator

/-!
# Causality Propagation Package
-/

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure CausalityPropagationPackage {S : AbstractStateSpacePackage}
    {X : AbstractStateSpacePackage}
    (O : FunctionalDifferentialOperatorPackage X) where
  delayFunctional : Type v
  memoryDomain : Prop
  causalMapping : Prop
  propagationSpeed : Prop

structure CausalityPropagationEvidence {S : AbstractStateSpacePackage}
    {X : AbstractStateSpacePackage}
    {O : FunctionalDifferentialOperatorPackage X}
    (C : CausalityPropagationPackage O) where
  delayFunctionalClosed : C.delayFunctional
  memoryDomainClosed : C.memoryDomain
  causalMappingClosed : C.causalMapping
  propagationSpeedClosed : C.propagationSpeed

def CausalityPropagationClosed {S : AbstractStateSpacePackage}
    {X : AbstractStateSpacePackage}
    {O : FunctionalDifferentialOperatorPackage X}
    (C : CausalityPropagationPackage O) : Prop :=
  C.delayFunctional ∧ C.memoryDomain ∧ C.causalMapping ∧ C.propagationSpeed

theorem causality_propagation_closed_from_evidence
    {S : AbstractStateSpacePackage} {X : AbstractStateSpacePackage}
    {O : FunctionalDifferentialOperatorPackage X}
    (C : CausalityPropagationPackage O)
    (E : CausalityPropagationEvidence C) :
    CausalityPropagationClosed C := by
  exact And.intro E.delayFunctionalClosed
    (And.intro E.memoryDomainClosed
      (And.intro E.causalMappingClosed E.propagationSpeedClosed))

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse