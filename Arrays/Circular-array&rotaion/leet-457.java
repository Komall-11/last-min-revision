Approach Explanation (Interview Style)

We treat every index as a node in a circular structure, where the value at that index determines how many steps we move. For a current index curr, the next index is calculated using modulo so that movement wraps around the array:

next = (curr + nums[curr]) % n;

If the result is negative, we add n to bring it back into the valid index range.

For every unvisited index, we start a new traversal and store its direction using dir = 1 for positive movement and dir = -1 for negative movement. During the traversal, every element must move in the same direction; if nums[curr] * dir < 0, the path becomes invalid and we stop. We use a vis array along with a unique traverseId to distinguish indices visited during the current traversal from those visited in previous traversals. If we encounter an index whose vis value equals the current traverseId, it means we have returned to an index within the same traversal, confirming a cycle. We also check next == curr because a cycle containing only one element is not considered valid.

The time complexity is O(n) because once an index is visited and marked, future traversals do not process it again; they stop when reaching an already visited index. The space complexity is O(n) due to the vis array used to track visited indices.

  Space Complexity: O(n) because we use the vis array of size n. Apart from this array, we only use a few variables such as curr, next, dir, and traverseId, which take O(1) extra space. Therefore, the overall space complexity is dominated by the vis array, resulting in O(n).
