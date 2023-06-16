# mdt-demo-SwiftUI-Kit
Library of Swift UI Components for BBC Mobile Development Team.

## BannerView Component
### Description
My solution for banner view in SwiftUI is a View Modifier. Which means that it can only be used with another view. But the control over it can be delegated to the view model (or somewhere else) when necessary. 

### How it works
To get a banner view working inside you app you’ll need 2 things:
1. A Swift UI view to connect it to:
```
List {
  ...
} 
.banner(data: $data, showBanner: $isShowing)
```
2. And two binding variables - one that triggers the appearance (and in case of loading - disappearance) of the banner and one with the information you want displayed:
```
@State var isShowing: Bool = false
@State var data: BannerData = BannerData.defaultData()
```


### Additional note
Here is an example of functions you can use to show / dismiss loading view. No additional set up needed.
```
func showLoadingBanner() {
        DispatchQueue.main.async {
            self.bannerData = BannerData(detail: "Loading...", type: .loading)
            self.showBanner = true
        }
    }
    
    func dismissLoadingBanner() {
        DispatchQueue.main.async {
            withAnimation {
                self.showBanner = false
            }
        }
    }
```

### How banners look

<img width="450" alt="SuccsessBanner" src="https://github.com/bbc/mdt-ios-SwiftUIKit/assets/45575272/bafe9b45-9097-4a7b-b52b-fb14925c8340">
<img width="450" alt="InfoBanner" src="https://github.com/bbc/mdt-ios-SwiftUIKit/assets/45575272/2910b9be-87a4-4a91-a247-a183993beebc">


<img width="450" alt="ErrorBanner" src="https://github.com/bbc/mdt-ios-SwiftUIKit/assets/45575272/45b5cde7-17d1-4d5e-af03-bc1b7ed2dd58">
<img width="450" alt="WarningBanner" src="https://github.com/bbc/mdt-ios-SwiftUIKit/assets/45575272/e9d5e822-b76a-4051-b4f3-674fb143a504">

<details>
    <summary> ✨ Bonus gif </summary>
	
 ![LoadingBanner](https://github.com/bbc/mdt-ios-SwiftUIKit/assets/45575272/9ea23eba-fdcf-4d6a-9aad-f4996bb97b06)

</details>

If you like to see more options - download the project and check previews for the BannerView.
