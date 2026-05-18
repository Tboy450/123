# Map Fixes

## Issue: Extra Produce Bins at Back Wall

**Problem:** There are produce bins appearing at the back wall (north side) where the Stock Room, Cooler, and Loading Dock are located. This creates visual clutter and blocks access.

**Location in code:** Lines 929-953 in RetailStoreBlueprint.lua

**Root cause:** The produce bins loop creates 5 bins at Z position -36 (back wall) instead of in the sales floor area.

```lua
-- PROBLEMATIC CODE:
for i = -2, 2 do
    local bx = i * 10
    storePart({
        -- position: Z = -36 (BACK WALL - WRONG!)
        position = Vector3.new(bx, floorY + 2.6, -36),
    })
end
```

## Solutions

### Option 1: Remove the Back Wall Produce Section
Simply comment out or delete the produce bins loop (lines 930-953). The produce zone marker already shows where produce should be displayed.

### Option 2: Relocate to Sales Floor
Move the produce bins to the proper sales floor location around Z = -15 to -20 range.

### Option 3: Replace with Proper Shelves
Replace the bins with shelf units that match the department layout.

---

**Next Step:** Should we delete these bins, move them, or use actual shelves?
