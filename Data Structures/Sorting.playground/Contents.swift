import UIKit

// Perform selection sort
var selArray = [5,2,3,4,1,3]
selectionSort(array: &selArray)
print("Selection Sort: \(selArray)")

// Perform bubble sort
var bubArray = [5,2,3,4,1,3]
bubbleSort(array: &bubArray)
print("Bubble Sort: \(bubArray)")

// Perform insertion sort
var insArray = [5,2,3,4,1,3]
bubbleSort(array: &insArray)
print("Insertion Sort: \(insArray)")

// Perform merge sort
var merArray = [5,2,3,4,1,3]
let merSorted = mergeSort(array: merArray)
print("Merge Sort: \(merSorted)")

// Perform quick sort
var quiArray = [5,2,3,4,1,3]
quickSort(array: &quiArray, startIndex: 0, endIndex: quiArray.count - 1)
print("Quick Sort: \(quiArray)")

// MARK: - Selection Sort
func selectionSort(array: inout [Int]) {
    for i in 0..<array.count {
        var minIndex = i
        
        for j in i+1..<array.count {
            if array[j] < array[minIndex] {
                minIndex = j
            }
        }
        
        let temp = array[i]
        array[i] = array[minIndex]
        array[minIndex] = temp
    }
}

// MARK: - Bubble Sort
func bubbleSort(array: inout [Int]) {
    let count = array.count - 1
    for i in 0..<count {
        for j in 0..<(count - i) {
            if array[j] > array[j + 1] {
                let temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
            }
        }
    }
}

// MARK: - Insertion Sort
func insertionSort(array: inout [Int]) {
    for i in 1..<array.count {
        while i - 1 > 0 && array[i] < array[i - 1] {
            let temp = array[i]
            array[i] = array[i - 1]
            array[i - 1] = temp
        }
    }
}

// MARK: - Merge Sort
func mergeSort(array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let left = mergeSort(array: Array(array[0..<middleIndex]))
    let right = mergeSort(array: Array(array[middleIndex..<array.count]))
    
    return merge(left: left, right: right)
}
func merge(left: [Int], right: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    
    var sortedArray: [Int] = []
    
    while leftIndex < left.count, rightIndex < right.count {
        if left[leftIndex] <= right[rightIndex] {
            sortedArray.append(left[leftIndex])
            leftIndex = leftIndex + 1
        } else {
            sortedArray.append(right[rightIndex])
            rightIndex = rightIndex + 1
        }
    }
    
    while leftIndex < left.count {
        sortedArray.append(left[leftIndex])
        leftIndex = leftIndex + 1
    }
    
    while rightIndex < right.count {
        sortedArray.append(right[rightIndex])
        rightIndex = rightIndex + 1
    }
    
    return sortedArray
}

// MARK: - Quick Sort
func quickSort(array: inout [Int], startIndex: Int, endIndex: Int) {
    if startIndex >= endIndex { return }
    
    let partitionIndex = partition(array: &array, startIndex: startIndex, endIndex: endIndex)
        
    quickSort(array: &array, startIndex: startIndex, endIndex: partitionIndex - 1)
    quickSort(array: &array, startIndex: partitionIndex + 1, endIndex: endIndex)
}
func partition(array: inout [Int], startIndex: Int, endIndex: Int) -> Int {

    var tracker = startIndex
    
    for index in startIndex..<endIndex {
        if array[index] < array[endIndex] {
            swap(array: &array, l: tracker, r: index)
            tracker = tracker + 1
        }
    }
    swap(array: &array, l: tracker, r: endIndex)
    return tracker
}
func swap(array: inout [Int], l: Int, r: Int) {
    let temp = array[l]
    array[l] = array[r]
    array[r] = temp
}
