class WorkoutModel {
  final String name;
  final String link;
  final String goal;
  final int id;
  final int reps;
  final int sets;
  final int weight;
  int completSets;
  final int rests;

  WorkoutModel({
    required this.name,
     required this.id,
     required this.link,
     required this.reps,
     required this.sets,
     required this.weight,
     required this.completSets,
     required this.rests,
     required this.goal,
     });

  factory WorkoutModel.fromJson(jsonData) {
    return WorkoutModel(
      name: jsonData['name'],
      id: jsonData['id'],
      link: jsonData['link'],
      reps: jsonData['reps'],
      sets: jsonData['sets'],
      weight: jsonData['weight'],
      completSets: jsonData['completed_sets'],
      rests: jsonData['rest'],
      goal: jsonData['goal'],
    );
  }
}
