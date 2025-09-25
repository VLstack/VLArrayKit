import Foundation

extension Array where Element == Double
{
 /// Computes the average excluding outliers based on the interquartile range (IQR).
 ///
 /// Outliers are defined as values outside the range [Q1 - 1.5 * IQR, Q3 + 1.5 * IQR],
 /// where Q1 and Q3 are the 25th and 75th percentiles of the sorted array.
 ///
 /// This method is robust to outliers and small arrays. Returns `nil` if the array is empty
 /// or if all values are considered outliers.
 ///
 /// - Returns: The IQR-based average, or `nil` if not computable.
 @inlinable
 public func iqrAverage() -> Double?
 {
  guard !self.isEmpty else { return nil }

  let sorted = self.sorted()
  let count = sorted.count

  func percentile(_ p: Double) -> Double
  {
   let pos = p * Double(count - 1)
   let lower = Int(floor(pos))
   let upper = Int(ceil(pos))
   if lower == upper { return sorted[lower] }
   return sorted[lower] * (Double(upper) - pos) + sorted[upper] * (pos - Double(lower))
  }

  let q1 = percentile(0.25)
  let q3 = percentile(0.75)
  let iqr = q3 - q1

  let lowerBound = q1 - 1.5 * iqr
  let upperBound = q3 + 1.5 * iqr

  let filtered = sorted.filter { $0 >= lowerBound && $0 <= upperBound }
  guard !filtered.isEmpty else { return nil }

  let sum = filtered.reduce(0, +)

  return sum / Double(filtered.count)
 }
}

extension Array where Element == Double?
{
 /// Computes the IQR-based average of all non-`nil` elements.
 /// See `Array<Double>.iqrAverage()` for details.
 ///
 /// - Returns: The IQR-based average, or `nil` if no valid elements exist.
 @inlinable
 public func iqrAverage() -> Double?
 {
  self.compactMap { $0 }.iqrAverage()
 }
}
