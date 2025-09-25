extension Array where Element == Double
{
 /// Computes the average after trimming a percentage of values
 /// from both the lower and upper ends of the sorted array.
 ///
 /// Useful to reduce the influence of outliers.
 /// - Parameter percent: The percentage (0–50) of values to trim on each side.
 ///   Defaults to 10.
 /// - Returns: The trimmed average, or `nil` if the array is empty
 ///   or trimming removes all elements.
 @inlinable
 public func trimmedAverage(percent: Int = 10) -> Double?
 {
  guard !self.isEmpty,
         percent >= 0,
         percent <= 50
  else { return nil }

  let sorted = self.sorted()
  let trimCount = Int(Double(self.count) * Double(percent) / 100.0)
  let lowerBound = trimCount
  let upperBound = self.count - trimCount

  guard lowerBound < upperBound else { return nil }

  let values = sorted[lowerBound..<upperBound]
  let sum = values.reduce(0, +)

  return sum / Double(values.count)
 }
}

extension Array where Element == Double?
{
 /// Computes the trimmed average of all non-`nil` elements.
 /// See `Array<Double>.trimmedAverage(percent:)` for details.
 /// 
 /// - Parameter percent: The percentage (0–50) of values to trim on each side.
 /// - Returns: The trimmed average, or `nil` if no valid elements exist.
 @inlinable
 public func trimmedAverage(percent: Int = 10) -> Double?
 {
  self.compactMap { $0 }.trimmedAverage(percent: percent)
 }
}
