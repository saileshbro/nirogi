import 'package:meta/meta.dart';

abstract class VoteState {}

class VoteUninitialisedState extends VoteState {}

class UpVoteSendingState extends VoteState {}

class DownVoteSendingState extends VoteState {}

class UpvotedState extends VoteState {
  final int voteStatus;
  final int voteCount;
  UpvotedState({@required this.voteStatus, @required this.voteCount})
      : assert(voteStatus != null),
        assert(voteCount != null);
}

class DownVotedState extends VoteState {
  final int voteStatus;
  final int voteCount;
  DownVotedState({@required this.voteStatus, @required this.voteCount})
      : assert(voteStatus != null),
        assert(voteCount != null);
}

class VoteFailedState extends VoteState {}
