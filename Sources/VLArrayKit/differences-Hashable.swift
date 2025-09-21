extension Array where Element: Hashable
{
  /// Computes the differences between the current array and a previous one.
  ///
  /// Converts both arrays into sets, then determines which elements
  /// were removed and which were added.
  ///
  /// - Parameter old: The reference array to compare against.
  /// - Returns: A tuple containing:
  ///   - `removed`: Elements present in `old` but not in `self`.
  ///   - `added`: Elements present in `self` but not in `old`. @inlinable
 public func differences(from old: [ Element ]) -> (removed: Set<Element>, added: Set<Element>)
 {
  let newSet = Set(self)
  let oldSet = Set(old)

  let added = newSet.subtracting(oldSet)
  let removed = oldSet.subtracting(newSet)

  return (removed, added)
 }
}
