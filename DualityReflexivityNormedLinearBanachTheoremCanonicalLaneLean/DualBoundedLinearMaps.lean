import canonicalLaneMathlib.AdmissibleClass
import DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean.BanachDualityPair

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

open scoped Topology

structure DualBoundedLinearMaps (X : Type u) [NormedAddCommGroup X] [NormedSpace ℝ X] where
  dualSpace : Type u
  dualNormedAddCommGroup : NormedAddCommGroup dualSpace
  dualNormedSpace : NormedSpace ℝ dualSpace
  evaluationMap : X → (dualSpace → ℝ)
  evaluationContinuous : Continuous (evaluationMap)
  normInequality : ∀ (x : X), ‖evaluationMap x‖ ≤ ‖x‖
  isometry : ∀ (x : X), ‖evaluationMap x‖ = ‖x‖

structure DualBoundedLinearMapsEvidence (X : Type u) [NormedAddCommGroup X] [NormedSpace ℝ X] (D : DualBoundedLinearMaps X) where
  dualNormedAddCommGroupClosed : D.dualNormedAddCommGroup = inferInstance
  dualNormedSpaceClosed : D.dualNormedSpace = inferInstance
  evaluationContinuousClosed : D.evaluationContinuous
  normInequalityClosed : ∀ (x : X), ‖D.evaluationMap x‖ ≤ ‖x‖
  isometryClosed : ∀ (x : X), ‖D.evaluationMap x‖ = ‖x‖

def DualBoundedLinearMapsClosed (X : Type u) [NormedAddCommGroup X] [NormedSpace ℝ X] (D : DualBoundedLinearMaps X) : Prop :=
  D.dualNormedAddCommGroup = inferInstance ∧ D.dualNormedSpace = inferInstance ∧
  D.evaluationContinuous ∧ (∀ (x : X), ‖D.evaluationMap x‖ ≤ ‖x‖) ∧ (∀ (x : X), ‖D.evaluationMap x‖ = ‖x‖)

theorem dual_bounded_linear_maps_closed_from_evidence (X : Type u) [NormedAddCommGroup X] [NormedSpace ℝ X] (D : DualBoundedLinearMaps X)
    (E : DualBoundedLinearMapsEvidence X D) : DualBoundedLinearMapsClosed X D := by
  exact And.intro E.dualNormedAddCommGroupClosed (And.intro E.dualNormedSpaceClosed
    (And.intro E.evaluationContinuousClosed (And.intro E.normInequalityClosed E.isometryClosed)))

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse
