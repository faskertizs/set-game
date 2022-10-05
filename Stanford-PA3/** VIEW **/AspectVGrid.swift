//
//  AspectVGrid.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 18..
//

import SwiftUI

struct AspectVGrid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    private var items: [Item]
    private var aspectRatio: CGFloat
    #warning("!!! 'minimumWidth' could be 'CGFloat?'")
    private var minimumWidth: CGFloat
    private var content: (Item) -> ItemView

    init(items: [Item], aspectRatio: CGFloat, minimumWidth: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.minimumWidth = minimumWidth
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            let width: CGFloat = widthThatFits(itemCount: items.count, in: geometry.size, itemAspectRatio: aspectRatio)
            if minimumWidth < width {
                VStack {
                    LazyVGrid(columns: [adaptiveGridItem(width: width)]) {
                        ForEach(items) { item in
                            content(item).aspectRatio(aspectRatio, contentMode: .fit)
                        }
                    }
                }
            } else {
                ScrollView {
                    LazyVGrid(columns: [adaptiveGridItem(width: minimumWidth)]) {
                        ForEach(items) { item in
                            content(item).aspectRatio(aspectRatio, contentMode: .fit)
                        }
                    }
                }
            }
        }
    }
    
    private func adaptiveGridItem(width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
    
    private func widthThatFits(itemCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
        var columnCount = 1
        var rowCount = itemCount
        
        repeat {
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeight = itemWidth / itemAspectRatio
            if CGFloat(rowCount) * itemHeight < size.height {
                break
            }
            columnCount += 1
            rowCount = (itemCount + (columnCount - 1)) / columnCount
        } while columnCount < itemCount
        
        if columnCount > itemCount {
            columnCount = itemCount
        }
        
        return floor(size.width / CGFloat(columnCount))
    }
}

//struct AspectVGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectVGrid()
//    }
//}
