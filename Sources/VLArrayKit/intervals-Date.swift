import Foundation

extension Array where Element == Date
{
 @inlinable
 public func intervals() -> [ Double ]
 {
  guard self.count > 1 else { return [] }

  let sortedDates = self.sorted()
  var intervals: [ Double ] = []
  intervals.reserveCapacity(sortedDates.count - 1)

  for i in 1..<sortedDates.count
  {
   let interval = sortedDates[i].timeIntervalSince(sortedDates[i - 1])
   intervals.append(interval)
  }

  return intervals
 }
}

extension Array where Element == Date?
{
 @inlinable
 public func intervals() -> [ Double ]
 {
  self.compactMap { $0 }.intervals()
 }
}
