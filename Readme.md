## KSPAutomaticHeightCalculationTableCellView

A useful superclass for a custom view-based `NSTableView`’s cell.

## How To Use

#### Your custom cell class should inherit from `KSPAutomaticHeightCalculationTableCellView`

This is how it used to look in Objective-C:

```objective-c
#import <KSPAutomaticHeightCalculationTableCellView+Private.h>

@interface MyLovelyCell : KSPAutomaticHeightCalculationTableCellView
…
@end
```

#### Put your cell into a separate XIB and let the `KSPAutomaticHeightCalculationTableCellView` know how to find it at runtime

It is generally a good idea to put your cell into a separate XIB, but usage of a `KSPAutomaticHeightCalculationTableCellView` makes this mandatory.

By default `KSPAutomaticHeightCalculationTableCellView` will look for a nib file named exactly like your cell's subclass in a main bundle.

That is, if you call your cell class `MyLovelyCell` you have to name your XIB `MyLovelyCell.xib`. This xib should contain one and only one root view of MyLovelyCell class. You still can have an arbitrary number of other objects in a XIB, though.

You can customize the behaviour by overriding the following class methods:

```objective-c
+ (NSString*) correspondingNibName
{
  return @"SomethingDifferent";
}
```

```objective-c
+ (NSBundle*) correspondingBundle
{
  return [NSBundle bundle...];
}
```

#### Decide whether your custom table cell should have a variable height

**Cell has a variable height** == **Cell's height depends on a represented object value** `OR` **cell's height depends on cell's width**.

By default, `KSPAutomaticHeightCalculationTableCellView` assumes that your cell has a variable height, since this is the basic reason to use the class in your project at all.

Override `+hasFixedHeight` and return `YES` if your cell's height is really fixed.

```objective-c
+ (BOOL) hasFixedHeight
{
  return YES;
}
```

In this case `KSPAutomaticHeightCalculationTableCellView` will cache the height after it will be calculated for the first time. Subsequent calls to `+heightWithRepresentedObject:width:` will return the stored value.

#### Layout your cell via Auto Layout

This step is also mandatory. `KSPAutomaticHeightCalculationTableCellView` only functions in Auto Layout-enabled mode. There is no point of using the class if you perform manual frame computations.

**Attention, this part is really important**:  
After you add layout constraints, the height of your cell __should be unambiguous__! This means, height have to be constraint either directly (via explicit height constraint, which will render `KSPAutomaticHeightCalculationTableCellView` usage pretty pointless, since you already know the height value) or in a derived-fashion (in which height of a cell somehow depends on a geometry of its subviews, and the geometry, in its turn, depends on content).

Remember it, cause if you leave your cell view's height ambigous you will end up with a table view rows having a zero height.

#### Implement a `NSTableViewDelegate` method `-tableView:heightOfRow:`

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
