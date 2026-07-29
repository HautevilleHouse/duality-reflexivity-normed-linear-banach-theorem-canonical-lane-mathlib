import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

structure DualSpacePackage (V : NormedLinearSpacePackage) where
  dualSpace : Type
  dualNorm : Prop
  dualBoundedLinearFunctional : Prop

def DualSpaceClosed {V : NormedLinearSpacePackage} (D : DualSpacePackage V) : Prop :=
  D.dualNorm ∧ D.dualBoundedLinearFunctional

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse