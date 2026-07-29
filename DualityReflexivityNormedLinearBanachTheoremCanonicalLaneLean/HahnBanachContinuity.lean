import canonicalLaneMathlib.AdmissibleClass
import DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean.DualBoundedLinearMaps

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

structure HahnBanachContinuity (X : Type u) [NormedAddCommGroup X] [NormedSpace ℝ X] where
  extensionProperty : ∀ (Y : Subspace ℝ X) (f : Y →L[ℝ] ℝ), ∃ (g : X →L[ℝ] ℝ), ∀ (y : Y), g y = f y
  normPreserving : ∀ (Y : Subspace ℝ X) (f : Y →L[ℝ] ℝ), ∃ (g : X →L[ℝ] ℝ), (∀ y : Y, g y = f y) ∧ ‖g‖ = ‖f‖

structure HahnBanachContinuityEvidence (X : Type u) [NormedAddCommGroup X] [NormedSpace ℝ X] (H : HahnBanachContinuity X) where
  extensionPropertyClosed : H.extensionProperty
  normPreservingClosed : H.normPreserving

def HahnBanachContinuityClosed (X : Type u) [NormedAddCommGroup X] [NormedSpace ℝ X] (H : HahnBanachContinuity X) : Prop :=
  H.extensionProperty ∧ H.normPreserving

theorem hahn_banach_continuity_closed_from_evidence (X : Type u) [NormedAddCommGroup X] [NormedSpace ℝ X] (H : HahnBanachContinuity X)
    (E : HahnBanachContinuityEvidence X H) : HahnBanachContinuityClosed X H := by
  exact And.intro E.extensionPropertyClosed E.normPreservingClosed

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse
