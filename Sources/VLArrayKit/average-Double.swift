import Foundation

extension Array where Element == Double
{
 @inlinable
 public func average() -> Double?
 {
  guard !self.isEmpty else { return nil }

  let sum = reduce(0, +)

  return sum / Double(count)
 }

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
 @inlinable
 public func average() -> Double?
 {
  self.compactMap { $0 }.average()
 }

 @inlinable
 public func trimmedAverage(percent: Int = 10) -> Double?
 {
  self.compactMap { $0 }.trimmedAverage(percent: percent)
 }
}
