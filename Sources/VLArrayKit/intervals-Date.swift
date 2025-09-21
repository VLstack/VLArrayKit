import Foundation

extension Array where Element == Date
{
 /// Computes the time intervals between consecutive dates in the array.
 ///
 /// - Note:
 ///   - The array is sorted before computing intervals to ensure chronological order.
 ///   - Returns an empty array if there are fewer than two dates.
 ///
 /// - Returns:
 ///   An array of `Double` values representing the intervals, in seconds,
 ///   between each pair of consecutive dates. @inlinable
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
 /// Computes the time intervals between consecutive non-nil dates in the array.
 ///
 /// - Note:
 ///   - `nil` values are ignored.
 ///   - Uses the same logic as `Array<Date>.intervals()`.
 ///
 /// - Returns:
 ///   An array of `Double` values representing the intervals, in seconds,
 ///   between each pair of consecutive non-nil dates. @inlinable
 public func intervals() -> [ Double ]
 {
  self.compactMap { $0 }.intervals()
 }
}
