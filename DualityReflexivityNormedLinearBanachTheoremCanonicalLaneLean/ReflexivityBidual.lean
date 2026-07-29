import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.NormedSpace.Dual
import HautevilleHouse.DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean.BanachSpaceDuality

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

structure ReflexivityPackage {B : BanachSpacePackage} (D : DualSpacePackage B) where
  bidualInclusion : B.carrier → D.dualCarrier
  isometric : Prop
  isometricTerm : isometric
  surjective : Prop
  surjectiveTerm : surjective
  reflexiveProp : Prop := isometric ∧ surjective
  reflexiveTerm : reflexiveProp

def ReflexivityClosed {B : BanachSpacePackage} {D : DualSpacePackage B} (R : ReflexivityPackage D) : Prop :=
  R.isometric ∧ R.surjective

theorem reflexivity_closed_from_evidence {B : BanachSpacePackage} {D : DualSpacePackage B} (R : ReflexivityPackage D) (Eiso : R.isometric) (Esurj : R.surjective) : ReflexivityClosed R :=
  And.intro Eiso Esurj

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse
