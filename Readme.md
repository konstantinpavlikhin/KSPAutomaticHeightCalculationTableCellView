# KSPAutomaticHeightCalculationTableCellView

A useful superclass for a custom view-based `NSTableView`’s cell.

## How To Use

### Your custom cell class should inherit from `KSPAutomaticHeightCalculationTableCellView`

This is how it used to look in Objective-C:

```objective-c
#import <KSPAutomaticHeightCalculationTableCellView+Private.h>

@interface MyLovelyCell : KSPAutomaticHeightCalculationTableCellView
…
@end
```

### Decide whether your custom table cell should have a variable height

Cell has a variable height == Cell height depends on a represented object value || cell height depends on cell's width.

By default, `KSPAutomaticHeightCalculationTableCellView` assumes that your cell has a variable height.

Override `+hasFixedHeight` and return `YES` if your cell's height is really fixed.

```objective-c
+ (BOOL) hasFixedHeight
{
  return YES;
}
```

In this case `KSPAutomaticHeightCalculationTableCellView` will cache the height after it will be calculated for the first time.

### Your cell should have its own XIB and it should be called exactly like your class

It is generally a good idea to put your cell into a separate XIB, but `KSPAutomaticHeightCalculationTableCellView` usage makes this mandatory. If you call you cell class `MyLovelyCell` you have to name your XIB `MyLovelyCell.xib`. This XIB should contain one and only one root view of MyLovelyCell class. You still can have an arbitrary number of other objects in a XIB.

### Layout your cell via Auto Layout

This step is also mandatory. `KSPAutomaticHeightCalculationTableCellView` only functions in Auto Layout-enabled mode. There is no point of using the class if you perform manual frame computations.

**Attention, this is really important**:  
After you add layout constraints, the height of your cell __should be unambiguous__! This means, height have to be constraint either directly (which will render KSPAutomaticHeightCalculationTableCellView usage pretty pointless) or in a derived-fashion (in which height of a cell somehow depends on a geometry of its subviews).

Remember it, cause if you leave your cell view's height ambigous you will end up with a table view rows having a zero height.

### Implement a `NSTableViewDelegate` method `-tableView:heightOfRow:`

```objective-c
- (CGFloat) tableView: (NSTableView*) tableView heightOfRow: (NSInteger) row
{
  // Get the width of a column in which the cell should reside.
  CGFloat columnWidth = [tableView tableColumnWithIdentifier: @“MainColumn”].width;

  // Let the KSPAutomaticHeightCalculationTableCellView to calculate the preffered cell height for you.
  return [MyLovelyCell heightWithRepresentedObject: #<a model object for this row> width: columnWidth];
}
```

At this point `KSPAutomaticHeightCalculationTableCellView` will create a prototype cell instance, set its `objectValue` property to the passed value, constrain its width to the `columnWidth` and calculate the minimum required height.

That's it!
