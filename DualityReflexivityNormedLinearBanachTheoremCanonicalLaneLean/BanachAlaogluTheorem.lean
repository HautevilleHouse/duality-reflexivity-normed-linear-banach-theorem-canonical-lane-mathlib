import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.NormedSpace.Dual
import HautevilleHouse.DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean.BanachSpaceDuality

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

structure BanachAlaogluPackage {B : BanachSpacePackage} (D : DualSpacePackage B) where
  closedUnitBallInDual : Set D.dualCarrier
  closedUnitBallDefined : Prop
  closedUnitBallDefinedTerm : closedUnitBallDefined
  weakStarCompact : Prop
  weakStarCompactTerm : weakStarCompact

def BanachAlaogluClosed {B : BanachSpacePackage} {D : DualSpacePackage B} (A : BanachAlaogluPackage D) : Prop :=
  A.closedUnitBallDefined ∧ A.weakStarCompact

theorem banach_alaoglu_closed_from_evidence {B : BanachSpacePackage} {D : DualSpacePackage B} (A : BanachAlaogluPackage D) (Eball : A.closedUnitBallDefined) (Ecompact : A.weakStarCompact) : BanachAlaogluClosed A :=
  And.intro Eball Ecompact

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse
