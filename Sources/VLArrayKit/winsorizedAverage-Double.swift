extension Array where Element == Double
{
 /// Computes the winsorized average.
 ///
 /// The smallest and largest values (by a fixed percentage) are replaced
 /// with the nearest non-trimmed values to reduce the effect of outliers.
 /// Defaults to 10% trimming.
 ///
 /// - Returns: The winsorized average, or nil if the array is empty.
 @inlinable
 public func winsorizedAverage(percent: Int = 10) -> Double?
 {
  guard !self.isEmpty,
        percent >= 0,
        percent <= 50 else { return nil }

  let sorted = self.sorted()
  let count = sorted.count
  let trimCount = Int(Double(count) * Double(percent) / 100.0)
  guard trimCount < count else { return nil }

  // If percent = 0, trimCount = 0 → no changes applied, returns simple average
  if trimCount == 0 { return self.reduce(0, +) / Double(count) }

  var winsorized = sorted

  // replace lower extremes
  for i in 0..<trimCount
  {
   winsorized[i] = sorted[trimCount]
  }

  // replace upper extremes
  for i in (count - trimCount)..<count
  {
   winsorized[i] = sorted[count - trimCount - 1]
  }

  let sum = winsorized.reduce(0, +)

  return sum / Double(count)
 }
}

extension Array where Element == Double?
{
 /// Computes the winsorized average.
 /// See `Array<Double>.winsorizedAverage()` for details.
 ///
 /// - Returns: The winsorized average, or nil if the array is empty.
 @inlinable
 public func winsorizedAverage(percent: Int = 10) -> Double?
 {
  self.compactMap { $0 }.winsorizedAverage(percent: percent)
 }
}
