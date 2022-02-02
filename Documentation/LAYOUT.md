### TLDR
To provide 2 columns layout use markdown’s H1 element with text Column to identify that next content should be wrapped into column
To use different backgrounds use H1 elements with text Bg-yellow or Bg-blue
To provide styling for Title slide and for Copyright slide use H1 element with text Title-slide and Copyright

## 2 Columns layout
To provide 2 column layout need to add Markdown H1 element (with the word Column) before the content that should be wrapped to the column. The ending of content will be another H1 element or the end of the file.

In general, markdown will be next:

```
# Column
## Markdown Column Content
Test Content for left column

# Column

## Markdown Column Content
Test Content for right column
```
 

## Background color styling
For styling background Notebook has 2 predefined elements that will be marked as background should be Yellow or Blue
It’s H1 element with text Bg-blue and Bg-yellow both capitalized. 

```
# Bg-blue

# Thank you.
# Questions?

[Take me back to the Beginning](#1)
```

```
# Bg-yellow

# Thank you.
# Questions?

[Take me back to the Beginning](#1)
```

## Specific pages layout
For slides we have 2 pages that has specific styles - it’s title slide and copyright slide

Both should have H1 Elements in markdown at the top of the slide that will indicate that for these slides need to add specific styles. This elements should have text Title-slide and Copyright (both capitalized). 

 

Also, there might be an H1 element with text Position-inline that also a specific element to indicate that the next elements should be positioned inline instead of one after another.


```
# Title-slide

![header-image](assets/header.png)

# An Intro to Herding Cats
### A course to achieving the impossible
  
  
Lucy Alexander, SAP  
September, 2021

INTERNAL
```

```
# Copyright

### Follow us

![sap-link.png](attachment:sap-link.png)

# Position-inline

![social-logo](assets/facebook-logo.png)
![social-logo](assets/twitter-logo.png)
![social-logo](assets/youtube-logo.png)
![social-logo](assets/linkedin-logo.png)

© 2021 SAP SE or an SAP affiliate company. All rights reserved.
```
