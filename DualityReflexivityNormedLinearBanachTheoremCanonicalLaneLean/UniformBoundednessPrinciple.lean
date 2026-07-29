import DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean.BanachSpaceDuality

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

structure PointwiseBoundedFamily (X Y : BanachSpace) where
  operators : Set (X.carrier →L[ℝ] Y.carrier)
  pointwiseBounded : ∀ x : X.carrier, ∃ M : ℝ, ∀ T ∈ operators, ‖T x‖ ≤ M

theorem uniform_boundedness (X Y : BanachSpace) (F : PointwiseBoundedFamily X Y) :
    ∃ M : ℝ, ∀ T ∈ F.operators, ‖T‖ ≤ M := by
  have h := normedSpace.uniform_boundedness (F.operators) (fun x => F.pointwiseBounded x)
  exact h

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse