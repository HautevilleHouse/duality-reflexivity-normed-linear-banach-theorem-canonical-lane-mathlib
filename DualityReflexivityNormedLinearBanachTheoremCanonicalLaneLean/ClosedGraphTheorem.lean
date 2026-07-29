import DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean.BanachSpaceDuality

namespace HautevilleHouse
namespace DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean

structure ClosedGraphOperator (X Y : BanachSpace) where
  linearMap : X.carrier → Y.carrier
  graphClosed : IsClosed (Set.range (λ (x : X.carrier) => (x, linearMap x)) : Set (X.carrier × Y.carrier))

theorem closed_graph_continuous (X Y : BanachSpace) (T : ClosedGraphOperator X Y) :
    Continuous T.linearMap := by
  have h : X.carrier → Y.carrier := T.linearMap
  have hgraph : IsClosed (Set.range (λ (x : X.carrier) => (x, h x)) : Set (X.carrier × Y.carrier)) := T.graphClosed
  -- Use the closed graph theorem from mathlib
  let f : X.carrier → Y.carrier := h
  have hclosed_graph : IsClosed ((fun x : X.carrier => (x, f x)) '' Set.univ) := by
    simpa [Set.range_eq_image] using hgraph
  have hcontinuous : Continuous f := by
    apply closedGraphTheorem (h := hclosed_graph)
  exact hcontinuous

end DualityReflexivityNormedLinearBanachTheoremCanonicalLaneLean
end HautevilleHouse