import Foundation

extension Array where Element == Date
{
 public func intervals() -> [ Double ]
 {
  guard !self.isEmpty else { return [] }

  let timestamps: [ Date ] = self.compactMap { $0 }.sorted()
  guard !timestamps.isEmpty else { return [] }

  var intervals: [Double] = []
  for i in 1..<timestamps.count
  {
   let interval = timestamps[i].timeIntervalSince(timestamps[i - 1])
   intervals.append(interval)
  }

  return intervals
 }
}
