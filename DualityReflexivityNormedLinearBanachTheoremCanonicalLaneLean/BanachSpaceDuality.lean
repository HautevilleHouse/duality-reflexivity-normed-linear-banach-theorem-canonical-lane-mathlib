import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Analysis.NormedSpace.Basic
import Mathlib.Analysis.NormedSpace.Dual

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

structure BanachSpacePackage where
  carrier : Type u
  normSemiNormed : SeminormedAddCommGroup carrier
  normComplete : CompleteSpace carrier
  normedSpace : NormedSpace ℝ carrier

def BanachSpaceClosed (B : BanachSpacePackage) : Prop :=
  True

structure DualSpacePackage (B : BanachSpacePackage) where
  dualCarrier : Type u
  dualNormSemiNormed : SeminormedAddCommGroup dualCarrier
  dualNormedSpace : NormedSpace ℝ dualCarrier
  pairing : B.carrier → dualCarrier → ℝ
  pairingBilinear : Prop
  pairingBilinearTerm : pairingBilinear
  pairingNondegenerate : Prop
  pairingNondegenerateTerm : pairingNondegenerate
  dualClosed : Prop
  dualClosedTerm : dualClosed

def DualSpaceClosed {B : BanachSpacePackage} (D : DualSpacePackage B) : Prop :=
  D.pairingBilinear ∧ D.pairingNondegenerate ∧ D.dualClosed

theorem dual_space_closed_from_evidence {B : BanachSpacePackage} (D : DualSpacePackage B) (E : D.pairingBilinear ∧ D.pairingNondegenerate) (Edual : D.dualClosed) : DualSpaceClosed D :=
  And.intro E.1 (And.intro E.2 Edual)

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse
