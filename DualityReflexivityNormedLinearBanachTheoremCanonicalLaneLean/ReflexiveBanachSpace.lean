import canonicalLaneMathlib.AdmissibleClass
import DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean.HahnBanachContinuity

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

structure ReflexiveBanachSpace (X : Type u) [NormedAddCommGroup X] [NormedSpace ℝ X] where
  bidualMap : X → (X →L[ℝ] ℝ) →L[ℝ] ℝ
  isIsometricInclusion : ∀ (x : X), ‖bidualMap x‖ = ‖x‖
  surjectivity : Function.Surjective bidualMap

structure ReflexiveBanachSpaceEvidence (X : Type u) [NormedAddCommGroup X] [NormedSpace ℝ X] (R : ReflexiveBanachSpace X) where
  isIsometricInclusionClosed : ∀ (x : X), ‖R.bidualMap x‖ = ‖x‖
  surjectivityClosed : Function.Surjective R.bidualMap

def ReflexiveBanachSpaceClosed (X : Type u) [NormedAddCommGroup X] [NormedSpace ℝ X] (R : ReflexiveBanachSpace X) : Prop :=
  (∀ (x : X), ‖R.bidualMap x‖ = ‖x‖) ∧ Function.Surjective R.bidualMap

theorem reflexive_banach_space_closed_from_evidence (X : Type u) [NormedAddCommGroup X] [NormedSpace ℝ X] (R : ReflexiveBanachSpace X)
    (E : ReflexiveBanachSpaceEvidence X R) : ReflexiveBanachSpaceClosed X R := by
  exact And.intro E.isIsometricInclusionClosed E.surjectivityClosed

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse
