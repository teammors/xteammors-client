import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class Messages extends Table {
  TextColumn get id => text()();
  TextColumn get body => text().named('text')();
  IntColumn get isMe => integer()();
  TextColumn get timestamp => text()();
  IntColumn get isEdited => integer().withDefault(const Constant(0))();
  TextColumn get editTime => text().nullable()();
  IntColumn get isFavorite => integer().withDefault(const Constant(0))();
  IntColumn get isForwarded => integer().withDefault(const Constant(0))();
  TextColumn get forwardedFrom => text().nullable()();
  TextColumn get replyToId => text().nullable()();
  IntColumn get messageType => integer().withDefault(const Constant(0))();
  TextColumn get mediaUrls => text().nullable()();
  TextColumn get filePath => text().nullable()();
  TextColumn get fileName => text().nullable()();
  TextColumn get fileSize => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get locationName => text().nullable()();
  IntColumn get status => integer().withDefault(const Constant(1))();
  RealColumn get sendProgress => real().nullable()();
  TextColumn get imageSizes => text().nullable()();
  TextColumn get audioUrl => text().nullable()();
  IntColumn get audioDuration => integer().nullable()();
  IntColumn get videoDuration => integer().nullable()();
  RealColumn get videoAspectRatio => real().nullable()();
  RealColumn get videoBubbleWidth => real().nullable()();
  RealColumn get videoBubbleHeight => real().nullable()();
  IntColumn get isGroup => integer().withDefault(const Constant(0))();
  TextColumn get senderUid => text().nullable()();
  TextColumn get senderName => text().nullable()();
  TextColumn get senderAvatar => text().nullable()();
  TextColumn get mentions => text().nullable()();
  IntColumn get isSended => integer().withDefault(const Constant(0))();
  TextColumn get chatId => text()();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();
  IntColumn get isSystemMessage => integer().withDefault(const Constant(0))();
  TextColumn get systemData => text().nullable()();
  TextColumn get replyToJson => text().nullable()();
  TextColumn get bubbleEmoji => text().nullable()();
  IntColumn get callDuration => integer().nullable()();
  TextColumn get callResult => text().nullable()();
  TextColumn get callType => text().nullable()();
  TextColumn get thumbnailPath => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Contacts extends Table {
  IntColumn get myUid => integer()();
  IntColumn get friendUid => integer()();
  TextColumn get adddAt => text().nullable()();
  TextColumn get loginName => text().nullable()();
  TextColumn get firstName => text().nullable()();
  TextColumn get lastName => text().nullable()();
  TextColumn get userAvatar => text().nullable()();
  TextColumn get introduce => text().nullable()();
  TextColumn get birthday => text().nullable()();
  TextColumn get sex => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get otherCon => text().nullable()();
  TextColumn get lastActivityAt => text().nullable()();
  TextColumn get publicKey => text().nullable()();
  IntColumn get isOnline => integer().nullable()();

  @override
  Set<Column> get primaryKey => {friendUid};
}

class Groups extends Table {
  TextColumn get groupId => text()();
  TextColumn get groupName => text()();
  TextColumn get adminId => text()();
  TextColumn get createdAt => text()();
  TextColumn get memberIds => text()();
  TextColumn get groupAvatar => text().nullable()();
  TextColumn get description => text().nullable()();
  IntColumn get memberCount => integer().withDefault(const Constant(0))();
  TextColumn get updatedAt => text()();

  @override
  Set<Column> get primaryKey => {groupId};
}

@DriftDatabase(tables: [Messages, Contacts, Groups])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);
  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dir = await getApplicationDocumentsDirectory();
      final file = File(p.join(dir.path, 'xteammors.db'));
      return NativeDatabase.createInBackground(file);
    });
  }

  factory AppDatabase.makeDefault() => AppDatabase(_openConnection());
  @override
  int get schemaVersion => 1;

  Future<int> upsertMessage(MessagesCompanion entry) {
    return into(messages).insertOnConflictUpdate(entry);
  }

  Future<List<Message>> listMessagesByChat(String chatId) {
    return (select(messages)
          ..where((t) => t.chatId.equals(chatId))
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.timestamp, mode: OrderingMode.desc)
          ]))
        .get();
  }

  Future<int> upsertContact(ContactsCompanion entry) {
    return into(contacts).insertOnConflictUpdate(entry);
  }

  Future<List<Contact>> listContacts() {
    return select(contacts).get();
  }

  Future<int> upsertGroup(GroupsCompanion entry) {
    return into(groups).insertOnConflictUpdate(entry);
  }

  Future<List<Group>> listGroups() {
    return select(groups).get();
  }
}
