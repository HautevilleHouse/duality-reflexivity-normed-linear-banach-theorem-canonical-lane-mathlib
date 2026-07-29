import canonicalLaneMathlib.DualSpace

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

structure ReflexivityPackage {V : NormedLinearSpacePackage} (D : DualSpacePackage V) where
  reflexiveProperty : Prop
  doubleDualIsometric : Prop
  canonicalEmbeddingInjective : Prop

def ReflexivityClosed {V : NormedLinearSpacePackage} {D : DualSpacePackage V} (R : ReflexivityPackage D) : Prop :=
  R.reflexiveProperty ∧ R.doubleDualIsometric ∧ R.canonicalEmbeddingInjective

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse