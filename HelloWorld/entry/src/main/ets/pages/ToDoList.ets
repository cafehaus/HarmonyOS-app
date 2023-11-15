import router from '@ohos.router';

@Entry
@Component
struct ToDoList {
  @State totalTasks: Array<string> = [
    '早期晨练',
    '准备早餐',
    '阅读新闻',
    '看剧放松',
  ]
  @State checkedIndex: number = 0
  build(): void {
    Column() {
      Row() {
        Column() {
          ForEach(this.totalTasks, (item, index) => {
            ToDoItem({content: item, index: index, checkedIndex: $checkedIndex})
          })
        }
        .width('100%')
      }
      .padding(10)
      .alignItems(VerticalAlign.Top)
      Row() {
        Button('增加')
          .borderRadius(8)
          .backgroundColor('#FFF')
          .height(40)
          .margin(20)
          .fontColor('#57BC78')
          .onClick(() => {
            this.totalTasks.push('我是增加的')
          })
        Button('删除')
          .borderRadius(8)
          .backgroundColor('#FFF')
          .height(40)
          .margin(20)
          .fontColor('#57BC78')
          .onClick(() => {
            this.totalTasks.pop()
          })
        Button('返回上一页')
          .borderRadius(8)
          .backgroundColor('#FFF')
          .height(40)
          .margin(20)
          .fontColor('#57BC78')
          .onClick(() => {
            router.back()
          })
      }
    }
    .height('100%')
    .backgroundColor('#F5F7F7')
  }
}

// 如果拆到单独的页面里可以用 import 导入
@Component
struct ToDoItem {
  private content?: string;
  private index?: number;
  @State isComplete: boolean = false;
  @Link @Watch('checkChange') checkedIndex: number;

  checkChange() {
    if (this.checkedIndex !== this.index) {
      this.isComplete = false
    }
  }

  build() {
    Row() {
      Text(this.index + 1 + '')
        .fontColor(this.isComplete ? '#FFF' : '#333')
      Text(this.content)
        .fontColor(this.isComplete ? '#FFF' : '#333')
    }
    .width('100%')
    .borderRadius(12)
    .padding(20)
    .margin(10)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(this.isComplete ? '#57BC78' : '#FFF')
    .onClick(() => {
      this.isComplete = true;
      this.checkedIndex = this.index;
    })
  }
}