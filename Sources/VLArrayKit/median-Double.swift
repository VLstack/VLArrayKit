import Foundation

extension Array where Element == Double
{
 public func median() -> Double?
 {
  guard !self.isEmpty else { return nil }

  let values = self.compactMap { $0 }
  guard !values.isEmpty else { return nil }

  let sorted = values.sorted()
  let mid: Int = values.count / 2

  if self.count % 2 == 0 { return ( sorted[mid - 1] + sorted[mid] ) / 2 }

  return sorted[mid]
 }
}
