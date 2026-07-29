import DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Analysis.NormedSpace.Banach

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BanachSpace where
  carrier : Type
  norm : carrier → ℝ
  completeness : Prop

structure BanachAdmittedObject where
  space : BanachSpace
  dualSpaceDefined : Prop
  isReflexive : Prop
  conclusion : isReflexive

structure BanachEndgameState where
  object : BanachAdmittedObject

def BanachWitnessClosed (O : BanachAdmittedObject) : Prop :=
  O.isReflexive

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse