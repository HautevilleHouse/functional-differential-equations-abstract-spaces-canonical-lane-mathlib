import canonicalLaneMathlib.AdmissibleClass
import FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean.AbstractStateSpace

/-!
# Functional Differential Operator Package
-/

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean

structure FunctionalDifferentialOperatorPackage {S : AbstractStateSpacePackage}
    (X : AbstractStateSpacePackage) where
  domain : Prop
  range : Prop
  linearity : Prop
  boundedness : Prop
  closedGraph : Prop

structure FunctionalDifferentialOperatorEvidence {S : AbstractStateSpacePackage}
    {X : AbstractStateSpacePackage}
    (O : FunctionalDifferentialOperatorPackage X) where
  domainClosed : O.domain
  rangeClosed : O.range
  linearityClosed : O.linearity
  boundednessClosed : O.boundedness
  closedGraphClosed : O.closedGraph

def FunctionalDifferentialOperatorClosed {S : AbstractStateSpacePackage}
    {X : AbstractStateSpacePackage}
    (O : FunctionalDifferentialOperatorPackage X) : Prop :=
  O.domain ∧ O.range ∧ O.linearity ∧ O.boundedness ∧ O.closedGraph

theorem functional_differential_operator_closed_from_evidence
    {S : AbstractStateSpacePackage} {X : AbstractStateSpacePackage}
    (O : FunctionalDifferentialOperatorPackage X)
    (E : FunctionalDifferentialOperatorEvidence O) :
    FunctionalDifferentialOperatorClosed O := by
  exact And.intro E.domainClosed
    (And.intro E.rangeClosed
      (And.intro E.linearityClosed
        (And.intro E.boundednessClosed E.closedGraphClosed)))

end FunctionalDifferentialEquationsAbstractSpacesCanonicalLaneLean
end HautevilleHouse