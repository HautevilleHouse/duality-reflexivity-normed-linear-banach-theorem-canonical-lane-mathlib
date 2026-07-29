import DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean.BanachSpaceDuality

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

structure HahnBanachExtension (X : BanachSpace) where
  subspace : Submodule ℝ X.carrier
  functionalOnSubspace : subspace →L[ℝ] ℝ
  extension : X.carrier →L[ℝ] ℝ
  extendsOnSubspace : ∀ x : subspace, extension x = functionalOnSubspace x
  normPreserving : ‖extension‖ = ‖functionalOnSubspace‖

theorem hahn_banach_exists (X : BanachSpace) (Y : Submodule ℝ X.carrier) (f : Y →L[ℝ] ℝ) :
    Nonempty (HahnBanachExtension X) := by
  let p : X.carrier → ℝ := λ x => ‖f‖ * ‖x‖
  have hp_seminorm : Seminorm ℝ X.carrier := by
    refine {
      toFun := p
      smul' := λ a x => ?_
      add_le' := λ x y => ?_
      neg' := λ x => ?_
      nonneg' := λ x => ?_
    }
    · calc
        p (a • x) = ‖f‖ * ‖a • x‖ := rfl
        _ = ‖f‖ * (|a| * ‖x‖) := by simp
        _ = |a| * (‖f‖ * ‖x‖) := by ring
        _ = |a| * p x := rfl
    · calc
        p (x + y) = ‖f‖ * ‖x + y‖ := rfl
        _ ≤ ‖f‖ * (‖x‖ + ‖y‖) := mul_le_mul_of_nonneg_left (norm_add_le _ _) (by positivity)
        _ = ‖f‖ * ‖x‖ + ‖f‖ * ‖y‖ := by ring
        _ = p x + p y := rfl
    · simp [p]
    · positivity
  have h_p_ge_f : ∀ x : Y, f x ≤ p x := by
    intro x
    calc
      f x ≤ ‖f‖ * ‖x‖ := le_op_norm _ _
      _ = p x := rfl
  have h_p_neg_f : ∀ x : Y, -f x ≤ p x := by
    intro x
    calc
      -f x = f (-x) := by simp
      _ ≤ ‖f‖ * ‖-x‖ := le_op_norm _ _
      _ = ‖f‖ * ‖x‖ := by simp
      _ = p x := rfl
  rcases exists_extension_norm_eq (p := hp_seminorm) (f := f) (h1 := h_p_ge_f) (h2 := h_p_neg_f) with ⟨F, hF_ext, hF_norm⟩
  refine ⟨{
    subspace := Y
    functionalOnSubspace := f
    extension := F
    extendsOnSubspace := λ x => ?_
    normPreserving := ?_
  }⟩
  · exact hF_ext x
  · rw [← hF_norm, ContinuousLinearMap.norm_eq_op_norm]
    rfl

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse