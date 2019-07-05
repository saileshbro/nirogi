import 'package:meta/meta.dart';

abstract class VoteState {}

class VoteUninitialisedState extends VoteState {}

class VoteSendingState extends VoteState {}

class UpvotedState extends VoteState {
  final int voteStatus;
  UpvotedState({@required this.voteStatus}) : assert(voteStatus != null);
}

class DownVotedState extends VoteState {
  final int voteStatus;
  DownVotedState({@required this.voteStatus}) : assert(voteStatus != null);
}

class VoteFailedState extends VoteState {}
