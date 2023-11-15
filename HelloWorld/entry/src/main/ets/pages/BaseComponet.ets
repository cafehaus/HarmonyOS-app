@Entry
@Component
struct BaseComponet {
  @State message: string = '我是 Text 文本组件，可以用来展示文本信息'
  @State text: string = ''

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontColor(Color.Orange)
          .fontWeight(700)
          .textAlign(TextAlign.Start)
          .width('100%')
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
        Image($r('app.media.icon'))
          .width(100)
          .height(100)
          .margin({ top: 20, bottom: 20 })
        TextInput({ placeholder: '请输入...' })
          .placeholderColor(Color.Red)
          .type(InputType.Number)
          .onChange((value: string) => {
            this.text = value
          })
        Button('登录', { type: ButtonType.Normal })
          .width('60%')
          .margin({ top: 20 })
        LoadingProgress()
          .color(Color.Green)
          .width(120)
          .height(120)
        Image($r('app.media.icon'))
          .width(100)
          .height(100)
          .animation({
            duration: 1000,
            tempo: 1.0,
            delay: 0,
            curve: Curve.Linear,
            playMode: PlayMode.Normal,
            iterations: 1
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}