import Foundation

extension Array where Element == Double
{
 @inlinable
 public func median() -> Double?
 {
  guard !self.isEmpty else { return nil }

  let sorted = self.sorted()
  let mid = self.count / 2

  if self.count % 2 == 0 { return ( sorted[mid - 1] + sorted[mid] ) / 2  }

  return sorted[mid]
 }
}

extension Array where Element == Double?
{
 @inlinable
 public func median() -> Double?
 {
  self.compactMap { $0 }.median()
 }
}
