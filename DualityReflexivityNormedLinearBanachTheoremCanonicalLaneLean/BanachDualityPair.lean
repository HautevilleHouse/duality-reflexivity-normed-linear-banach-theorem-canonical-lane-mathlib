import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

structure BanachDualityPair (X : Type u) [NormedAddCommGroup X] where
  dual : Type u
  dualNormedAddCommGroup : NormedAddCommGroup dual
  dualNormedSpace : NormedSpace ℝ dual
  pairing : X → dual → ℝ
  bilinear : ∀ (x : X) (f : dual), pairing x f = f x
  separate : ∀ (x : X), (∀ f : dual, pairing x f = 0) → x = 0

structure BanachDualityPairEvidence (X : Type u) [NormedAddCommGroup X] (P : BanachDualityPair X) where
  dualNormedAddCommGroupClosed : P.dualNormedAddCommGroup = inferInstance
  dualNormedSpaceClosed : P.dualNormedSpace = inferInstance
  bilinearClosed : ∀ (x : X) (f : P.dual), P.pairing x f = f x
  separateClosed : ∀ (x : X), (∀ f : P.dual, P.pairing x f = 0) → x = 0

def BanachDualityPairClosed (X : Type u) [NormedAddCommGroup X] (P : BanachDualityPair X) : Prop :=
  P.dualNormedAddCommGroup = inferInstance ∧ P.dualNormedSpace = inferInstance ∧
  (∀ (x : X) (f : P.dual), P.pairing x f = f x) ∧ (∀ (x : X), (∀ f : P.dual, P.pairing x f = 0) → x = 0)

theorem banach_duality_pair_closed_from_evidence (X : Type u) [NormedAddCommGroup X] (P : BanachDualityPair X)
    (E : BanachDualityPairEvidence X P) : BanachDualityPairClosed X P := by
  exact And.intro E.dualNormedAddCommGroupClosed (And.intro E.dualNormedSpaceClosed (And.intro E.bilinearClosed E.separateClosed))

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse
