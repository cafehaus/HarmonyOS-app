import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFF')
        Button('跳转 ToDoList')
          .borderRadius(8)
          .backgroundColor('#FFF')
          .width(200)
          .height(40)
          .margin(20)
          .fontColor('#57BC78')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/ToDoList'
            })
          })
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor('#57BC78')
  }
}