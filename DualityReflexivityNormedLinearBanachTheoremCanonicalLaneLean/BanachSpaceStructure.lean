import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

structure BanachSpace where
  carrier : Type u
  norm : carrier → ℝ
  norm_nonneg : ∀ x : carrier, 0 ≤ norm x
  norm_eq_zero_iff : ∀ x : carrier, norm x = 0 ↔ x = 0
  norm_triangle : ∀ x y : carrier, norm (x + y) ≤ norm x + norm y
  norm_smul : ∀ (α : ℝ) (x : carrier), norm (α • x) = |α| * norm x
  complete : Prop

def BanachSpaceClosed (B : BanachSpace) : Prop :=
  B.norm_nonneg ∧ B.norm_eq_zero_iff ∧ B.norm_triangle ∧ B.norm_smul ∧ B.complete

theorem banach_space_closed_iff (B : BanachSpace) :
    BanachSpaceClosed B ↔ (B.norm_nonneg ∧ B.norm_eq_zero_iff ∧ B.norm_triangle ∧ B.norm_smul) ∧ B.complete := by
  constructor
  · intro h; exact ⟨by exact And.intro h.1 (And.intro h.2.1 (And.intro h.2.2.1 h.2.2.2.1)), h.2.2.2.2⟩
  · intro h; exact And.intro h.1.1 (And.intro h.1.2.1 (And.intro h.1.2.2.1 (And.intro h.1.2.2.2 h.2)))

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse