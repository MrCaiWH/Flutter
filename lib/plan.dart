class Plan {
  Plan({
    this.id,
    this.avatar,
    this.time,
    this.tasks,
    this.selectTaskId,
    this.selectIndex
  });

  final int id;
  final String avatar;
  final String time;
  final List<Task> tasks;
  int selectTaskId;
  int selectIndex;
}

  final List<Plan> plans = [
    Plan(
      id: 1,
      avatar: 'images/avatar.png',
      time: '2019年5月22日',
      tasks: [
        Task(taskId: 101,title: 'IM迁移项目一期'),
        Task(taskId: 102,title: 'IM自转项目'),
        Task(taskId: 103,title: '01移动系统运维'),
      ],
      selectTaskId: 0,
      selectIndex: 100
    ),
    Plan(
      id: 2,
      avatar: 'images/avatar.png',
      time: '2019年5月23日',
      tasks: [
        Task(taskId: 201,title: '表情包'),
        Task(taskId: 202,title: '语音功能'),
        Task(taskId: 203,title: '自测'),
      ],
      selectTaskId: 0,
      selectIndex: 100
    ),
    Plan(
      id: 3,
      avatar: 'images/avatar.png',
      time: '2019年5月24日',
      tasks: [
        Task(taskId: 301,title: '聊天列表优化'),
        Task(taskId: 302,title: '群聊功能'),
        Task(taskId: 303,title: '重构IM'),
      ],
      selectTaskId: 0,
      selectIndex: 100
    ),
  ];


class Task {
  const Task({
    this.taskId,
    this.title,
  });

  final int taskId;
  final String title;
}
