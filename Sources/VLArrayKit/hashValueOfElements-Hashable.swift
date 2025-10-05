extension Array where Element: Hashable
{
 /// Returns a combined hash value of all elements in the array.
 ///
 /// This function iterates over each element in the array, combines their individual hash values
 /// using Swift's `Hasher`, and returns a single hash representing the entire array.
 ///
 /// Use this to detect changes in the array's contents, including any property changes of
 /// the elements, when each element conforms to `Hashable`.
 ///
 /// - Returns: An `Int` representing the combined hash of all elements.
 public func hashValueOfElements() -> Int
 {
  var hasher = Hasher()
  for element in self
  {
   hasher.combine(element)
  }
  return hasher.finalize()
 }
}
