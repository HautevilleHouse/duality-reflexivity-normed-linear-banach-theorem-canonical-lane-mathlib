import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BanachWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse