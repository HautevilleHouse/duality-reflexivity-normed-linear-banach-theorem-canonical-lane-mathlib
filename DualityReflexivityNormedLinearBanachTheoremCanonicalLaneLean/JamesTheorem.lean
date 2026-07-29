import canonicalLaneMathlib.AdmissibleClass
import DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean.BanachSpaceStructure
import DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean.Reflexivity

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

structure JamesTheoremPackage (X : BanachSpace) where
  conditionOnFunctionals : Prop
  reflexivityConclusion : Prop
  conditionImpliesReflexivity : conditionOnFunctionals → reflexivityConclusion

def JamesTheoremClosed (X : BanachSpace) (J : JamesTheoremPackage X) : Prop :=
  J.conditionOnFunctionals → J.reflexivityConclusion

theorem james_theorem_closed (X : BanachSpace) (J : JamesTheoremPackage X) (h : J.conditionOnFunctionals) :
    JamesTheoremClosed X J := by
  intro hcond; exact J.conditionImpliesReflexivity h cond

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse