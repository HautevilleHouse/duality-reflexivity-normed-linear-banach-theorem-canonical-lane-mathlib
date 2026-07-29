import DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean.BanachSpaceDuality

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

structure SurjectiveLinearOperator (X Y : BanachSpace) where
  linearMap : X.carrier →L[ℝ] Y.carrier
  surjective : Function.Surjective linearMap

theorem open_mapping (X Y : BanachSpace) (T : SurjectiveLinearOperator X Y) :
    IsOpenMap T.linearMap := by
  apply IsOpenMap.of_surjective (h := T.surjective)
  exact ContinuousLinearMap.continuous T.linearMap

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse