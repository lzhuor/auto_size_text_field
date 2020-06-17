# Auto Size Text Field

*Note*: This work is inspired by [Auto Size Text](https://github.com/leisim/auto_size_text). Please check it out if you want to auto size the display text. 

Flutter TextField widget that automatically resizes text field to fit perfectly within its bounds.

![](https://raw.githubusercontent.com/lzhuor/auto_size_text/master/.github/img/basic_example.gif)

**Show some ❤️ and star the repo to support the project**

## Contents

- [Usage](#usage)
  - [maxLines](#maxlines)
  - [minFontSize & maxFontSize](#minfontsize--maxfontsize)
  - [stepGranularity](#stepgranularity)
  - [presetFontSizes](#presetfontsizes)
  - [overflowReplacement](#overflowreplacement)
- [Parameters](#parameters)
- [Performance](#performance)
- [Troubleshooting](#roubleshooting)
  - [Missing bounds](#missing-bounds)
  - [MinFontSize too large](#minfontsize-too-large)


## Usage

`AutoSizeTextField` behaves exactly like a `TextField`. The only difference is that it resizes text to fit within its bounds.

```dart
AutoSizeTextField(
  'The text to display',
  style: TextStyle(fontSize: 20),
  maxLines: 2,
)
```
**Note:** `AutoSizeTextField` needs bounded constraints to resize the text. More info [here](#troubleshooting).

### maxLines

The `maxLines` parameter works like you are used to with the `Text` widget. If there is no `maxLines` parameter specified, the `AutoSizeTextField` only fits the text according to the available width and height.

```dart
AutoSizeTextField(
  controller: _textEditingController,
  style: TextStyle(fontSize: 30),
  maxLines: 2,
)
```

*Sample above*


### minFontSize & maxFontSize

The `AutoSizeTextField` starts with `TextStyle.fontSize`. It measures the resulting text and rescales it to fit within its bonds. You can however set the allowed range of the resulting font size.

With `minFontSize` you can specify the smallest possible font size. If the text still doesn't fit, it will be handled according to `overflow`. The default `minFontSize` is `12`.

`maxFontSize` sets the largest possible font size. This is useful if the `TextStyle` inherits the font size and you want to constrain it.

```dart
AutoSizeTextField(
  controller: _textEditingController,
  style: TextStyle(fontSize: 30),
  minFontSize: 18,
  maxLines: 4,
  overflow: TextOverflow.ellipsis,
)
```

![](https://raw.githubusercontent.com/leisim/auto_size_text/master/.github/art/minfontsize.gif)

### stepGranularity

The `AutoSizeTextField` will try each font size, starting with `TextStyle.fontSize` until the text fits within its bounds.  
`stepGranularity` specifies how much the font size is decreased each step. Usually, this value should not be below `1` for best performance.

```dart
AutoSizeTextField(
  controller: _textEditingController,
  style: TextStyle(fontSize: 40),
  minFontSize: 10,
  stepGranularity: 10,
  maxLines: 4,
  overflow: TextOverflow.ellipsis,
)
```

![](https://raw.githubusercontent.com/leisim/auto_size_text/master/.github/art/stepgranularity.gif)


### presetFontSizes

If you want to allow only specific font sizes, you can set them with `presetFontSizes`.
If `presetFontSizes` is set, `minFontSize`, `maxFontSize` and `stepGranularity` will be ignored.

```dart
AutoSizeTextField(
  controller: _textEditingController,
  presetFontSizes: [40, 20, 14],
  maxLines: 4,
)
```

![](https://raw.githubusercontent.com/leisim/auto_size_text/master/.github/art/presetfontsizes.gif)


### overflowReplacement

If the text is overflowing and does not fit its bounds, this widget is displayed instead. This can be useful to prevent text being too small to read.

```dart
AutoSizeTextField(
  maxLines: 1,
  controller: _textEditingController
)
```

![](https://raw.githubusercontent.com/leisim/auto_size_text/master/.github/art/overflowreplacement.gif)

## Parameters

| Parameter | Description |
|---|---|
| `key`* | Controls how one widget replaces another widget in the tree. |
| `textKey` | Sets the key for the resulting `Text` widget |
| `style`* | If non-null, the style to use for this text |
| `minFontSize` | The **minimum** text size constraint to be used when auto-sizing text. <br>*Is being ignored if `presetFontSizes` is set.*  |
| `maxFontSize` | The **maximum** text size constraint to be used when auto-sizing text. <br>*Is being ignored if `presetFontSizes` is set.* |
| `stepGranularity` | The step size in which the font size is being adapted to constraints. |
| `presetFontSizes` | Predefines all the possible font sizes.<br> **Important:** `presetFontSizes` have to be in descending order.  |
| `textAlign`* | How the text should be aligned horizontally. |
| `textDirection`* | The directionality of the text. This decides how `textAlign` values like `TextAlign.start` and `TextAlign.end` are interpreted. |
| `locale`* |  Used to select a font when the same Unicode character can be rendered differently, depending on the locale. |
| `wrapWords` | Whether words which don't fit in one line should be wrapped. *Defaults to `true` to behave like `Text`.* |
| `overflowReplacement` | If the text is overflowing and does not fit its bounds, this widget is displayed instead. |
| `maxLines` | An optional maximum number of lines for the text to span. |
| `semanticsLabel`* | An alternative semantics label for this text. |

Parameters marked with \* behave exactly the same as in `Text`


## Performance

`AutoSizeTextField` is really fast. In fact, you can replace all your `Text` widgets with `AutoSizeTextField`.<br>
Nevertheless you should not use an unreasonable high `fontSize` in your `TextStyle`. E.g. don't set the `fontSize` to `1000` if you know, that the text will never be larger than `30`.

If your font size has a very large range, consider increasing `stepGranularity`.


## Troubleshooting

### Missing bounds

If `AutoSizeTextField` overflows or does not resize the text, you should check if it has constrained width and height.

**Wrong** code:
```dart
Row(
  children: <Widget>[
    AutoSizeTextField(
      controller: _textEditingController,
      maxLines: 1,
    ),
  ],
)
```
Because `Row` and other widgets like `Container`, `Column` or `ListView` do not constrain their children, the text will overflow.  
You can fix this by constraining the `AutoSizeTextField`. Wrap it with `Expanded` in case of `Row` and `Column` or use a `SizedBox` or another widget with fixed width (and height).

**Correct** code:
```dart
Row(
  children: <Widget>[
    Expanded( // Constrains AutoSizeTextField to the width of the Row
      child: AutoSizeTextField(
        controller: _textEditingController,
        maxLines: 1,
      )
    ),
  ],
)
}
```

Further explanation can be found [here](https://stackoverflow.com/a/53908204). If you still have problems, please [open an issue](https://github.com/leisim/auto_size_text/issues/new).


### MinFontSize too large

`AutoSizeTextField` does not resize text below the `minFontSize` which defaults to 12.:

## MIT License
```
Copyright (c) 2020 Zhuoran LI

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the 'Software'), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```