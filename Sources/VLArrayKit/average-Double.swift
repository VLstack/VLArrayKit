import Foundation

extension Array where Element == Double
{
 public func average() -> Double?
 {
  guard !self.isEmpty else { return nil }

  let values = self.compactMap { $0 }
  guard !values.isEmpty else { return nil }

  let sum = self.reduce(0, +)
  let count = Double(values.count)

  return count > 0 ? sum / count : nil
 }
}
