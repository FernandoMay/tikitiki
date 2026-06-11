import 'package:flutter_test/flutter_test.dart';
import 'package:tikitiki/models.dart';

void main() {
  group('Comment', () {
    test('toJson returns correct map', () {
      final comment = Comment(
        username: 'test_user',
        comment: 'nice video!',
        datePublished: DateTime(2024, 1, 1),
        likes: ['uid1', 'uid2'],
        profilePhoto: 'https://example.com/photo.jpg',
        uid: 'user123',
        id: 'comment_0',
      );

      final json = comment.toJson();

      expect(json['username'], 'test_user');
      expect(json['comment'], 'nice video!');
      expect(json['datePublished'], DateTime(2024, 1, 1));
      expect(json['likes'], ['uid1', 'uid2']);
      expect(json['profilePhoto'], 'https://example.com/photo.jpg');
      expect(json['uid'], 'user123');
      expect(json['id'], 'comment_0');
    });

    test('default likes is empty list', () {
      final comment = Comment(
        username: 'a',
        comment: 'b',
        datePublished: DateTime.now(),
        likes: [],
        profilePhoto: 'https://example.com/p.jpg',
        uid: 'u1',
        id: 'c1',
      );
      expect(comment.likes, isEmpty);
    });
  });

  group('User', () {
    test('toJson returns correct map', () {
      final user = User(
        name: 'Alice',
        email: 'alice@example.com',
        uid: 'uid_001',
        profilePhoto: 'https://example.com/alice.jpg',
      );

      final json = user.toJson();

      expect(json['name'], 'Alice');
      expect(json['email'], 'alice@example.com');
      expect(json['uid'], 'uid_001');
      expect(json['profilePhoto'], 'https://example.com/alice.jpg');
    });

    test('default fields are set correctly', () {
      final user = User(
        name: 'Bob',
        email: 'bob@test.com',
        uid: 'uid_002',
        profilePhoto: 'https://example.com/bob.jpg',
      );
      expect(user.name, 'Bob');
      expect(user.email, 'bob@test.com');
      expect(user.uid, 'uid_002');
      expect(user.profilePhoto, 'https://example.com/bob.jpg');
    });
  });

  group('Video', () {
    test('toJson returns correct map', () {
      final video = Video(
        username: 'creator',
        uid: 'uid_003',
        id: 'video_1',
        likes: ['uid_a', 'uid_b'],
        commentCount: 5,
        shareCount: 10,
        songName: 'Song Title',
        caption: 'My first video',
        videoUrl: 'https://example.com/video.mp4',
        profilePhoto: 'https://example.com/creator.jpg',
        thumbnail: 'https://example.com/thumb.jpg',
      );

      final json = video.toJson();

      expect(json['username'], 'creator');
      expect(json['uid'], 'uid_003');
      expect(json['id'], 'video_1');
      expect(json['likes'], ['uid_a', 'uid_b']);
      expect(json['commentCount'], 5);
      expect(json['shareCount'], 10);
      expect(json['songName'], 'Song Title');
      expect(json['caption'], 'My first video');
      expect(json['videoUrl'], 'https://example.com/video.mp4');
      expect(json['profilePhoto'], 'https://example.com/creator.jpg');
      expect(json['thumbnail'], 'https://example.com/thumb.jpg');
    });

    test('default values are zero', () {
      final video = Video(
        username: 'u',
        uid: 'uid',
        id: 'vid',
        likes: [],
        commentCount: 0,
        shareCount: 0,
        songName: '',
        caption: '',
        videoUrl: '',
        profilePhoto: '',
        thumbnail: '',
      );
      expect(video.commentCount, 0);
      expect(video.shareCount, 0);
      expect(video.likes, isEmpty);
    });
  });
}
