import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := "duality-reflexivity-normed-linear-banach-canonical-lane",
    theoremName := "Duality Reflexivity Normed Linear Banach Theorem",
    theoremObject := "Every bounded linear functional on a Banach space attains its norm if and only if the space is reflexive (by the Eberlein–Šmulian theorem and James' theorem)",
    classicalBoundary := "classical source boundary: the unrestricted theorem quantifying over all Banach spaces and all bounded linear functionals",
    manifoldConstrainedStatement := "manifold-constrained theorem certificate internalized through baseline gates, source constants, reviewer bridge, manifest hashes, and outside-constant dependency count",
    certificateLane := "manifold_constrained",
    carriedRemainder := "classical source boundary carried by formalizationCertificate.theoremBoundaryOpen and sourceTheoremBoundary"
  }

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse