extension Array where Element == Double
{
 /// Computes the arithmetic mean of all elements in the array.
 /// - Returns: The average value, or `nil` if the array is empty.
 @inlinable
 public func average() -> Double?
 {
  guard !self.isEmpty else { return nil }

  let sum = reduce(0, +)

  return sum / Double(count)
 }
}

extension Array where Element == Double?
{
 /// Computes the arithmetic mean of all non-`nil` elements.
 /// - Returns: The average value, or `nil` if no valid elements exist.
 @inlinable
 public func average() -> Double?
 {
  self.compactMap { $0 }.average()
 }
}
