import canonicalLaneMathlib.Reflexivity

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

structure BanachFixedPointPackage {V : NormedLinearSpacePackage} {D : DualSpacePackage V} (R : ReflexivityPackage D) where
  contractionMapping : Prop
  uniqueFixedPoint : Prop
  fixedPointExists : Prop

def BanachFixedPointClosed {V : NormedLinearSpacePackage} {D : DualSpacePackage V} {R : ReflexivityPackage D} (B : BanachFixedPointPackage R) : Prop :=
  B.contractionMapping ∧ B.uniqueFixedPoint ∧ B.fixedPointExists

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse