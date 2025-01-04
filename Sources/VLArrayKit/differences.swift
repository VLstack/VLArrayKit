extension Array where Element: Hashable
{
 public func differences(from old: [ Element ]) -> (removed: Set<Element>, added: Set<Element>)
 {
  let newSet = Set(self)
  let oldSet = Set(old)

  let added = newSet.subtracting(oldSet)
  let removed = oldSet.subtracting(newSet)

  return (removed, added)
 }
}
