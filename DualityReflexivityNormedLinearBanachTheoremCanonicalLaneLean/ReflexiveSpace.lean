import DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean.BanachSpaceDuality

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

structure ReflexiveSpace (X : BanachSpace) where
  biDualIsometric : Type u
  isometricMap : X.carrier ≃ biDualIsometric
  isometricMapIsLinearIsometry : IsLinearIsometry isometricMap
  surjective : Function.Surjective isometricMap

def ReflexiveSpaceClosed (X : BanachSpace) : Prop :=
  Nonempty (ReflexiveSpace X)

theorem reflexive_if_finite_dimensional (X : BanachSpace) [FiniteDimensional ℝ X.carrier] :
    ReflexiveSpaceClosed X := by
  sorry

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse
