# Stop blaming the code does not work you Flutter hard struck beaches

- Stop crying and run `flutter pub get` you stupid!

---

## Routing

- I use the `go_router` package because it&#39;s easily customizable and performance friendly routing system. We can do a go or push with go route.
- GoRoute also make it easy so that we can make a layout without changeing a specific widget while navigating. eg. a navbar and/or an appbar where you want to use most of them in some pages.
- Which is why it&#39;s performance friendly.

### If you ever get an Overflow Pixel error

> If you are wondering why you are getting a overflowing pixel error, just check the home page where I use `SingleChildScrollView()` widget which made the entire page scrollable. But remember don&#39;t use `Expanded()` widget, it might get an infinite height error.
