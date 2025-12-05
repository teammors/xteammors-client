import 'package:flutter/material.dart';
import '../viewmodels/contacts_viewmodel.dart';
import 'user_profile_page.dart';
import '../viewmodels/user_profile_viewmodel.dart';

class ContactsPage extends StatefulWidget {
  final ContactsViewModel viewModel;
  final void Function(Contact)? onOpenProfile;
  const ContactsPage({
    super.key,
    this.viewModel = const ContactsViewModel(),
    this.onOpenProfile,
  });

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  String _query = '';
  int? _hoverIndex;

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final list = widget.viewModel.contacts
        .where((c) =>
    _query.isEmpty ||
        c.name.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.08),
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
                  width: 0.5,
                ),
              ),
            ),
            child: Text(
              'Contacts',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          height: 55,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search contacts',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                BorderSide(color: Colors.grey.withValues(alpha: 0.4)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                BorderSide(color: Colors.grey.withValues(alpha: 0.4)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                BorderSide(color: Colors.grey.withValues(alpha: 0.6)),
              ),
              isDense: true,
            ),
          ),
        ),
        SizedBox(height: 10,),
        Expanded(
          child: ListView.separated(
            itemCount: list.length,
            separatorBuilder: (c, i) => Divider(
                height: 1,
                indent: 55,
                color: Theme.of(context).dividerColor.withValues(alpha: 0.2)),
            itemBuilder: (c, i) {
              final ct = list[i];
              final hovered = _hoverIndex == i;
              return MouseRegion(
                onEnter: (_) => setState(() => _hoverIndex = i),
                onExit: (_) => setState(() => _hoverIndex = null),
                child: InkWell(
                  onTap: () {
                    if (widget.onOpenProfile != null) {
                      widget.onOpenProfile!(ct);
                    } else {
                      final vm = UserProfileViewModel(
                        userId: ct.id,
                        name: ct.name,
                        avatarUrl: ct.avatarUrl,
                        bio: 'This person is very mysterious; he left nothing behind.',
                        online: ct.online,
                        sharedGroups: const [
                          GroupSummary(
                              id: 'g1', name: 'Flutter Devs', members: 128),
                          GroupSummary(
                              id: 'g2', name: 'Design Weekly', members: 42),
                          GroupSummary(
                              id: 'g3', name: 'Project X Team', members: 16),
                        ],
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => UserProfilePage(vm: vm)),
                      );
                    }
                  },
                  child: Container(
                    height: 55,
                    color: hovered
                        ? cs.primary.withValues(alpha: 0.06)
                        : Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center, // 垂直居中
                      children: [
                        // 头像
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: _buildAvatar(ct),
                        ),
                        // 姓名和状态
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ct.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: cs.onSurface,
                                ),
                              ),
                              _buildSubtitle(ct, cs),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(Contact c) {
    if (c.avatarUrl != null && c.avatarUrl!.isNotEmpty) {
      return CircleAvatar(
          backgroundImage: NetworkImage(c.avatarUrl!), radius: 16);
    }
    return CircleAvatar(
        radius: 16, child: Text(c.name.isNotEmpty ? c.name[0] : '?'));
  }

  Widget _buildSubtitle(Contact c, ColorScheme cs) {
    if (c.online) {
      return Text('Online',
          style: TextStyle(color: const Color(0xFF1DB954), fontSize: 11));
    }
    final ls = c.lastSeen;
    if (ls == null) {
      return Text('last seen unknown',
          style: TextStyle(color: cs.onSurfaceVariant, fontSize: 11));
    }
    final now = DateTime.now();
    String text;
    if (ls.year == now.year && ls.month == now.month && ls.day == now.day) {
      final hh = ls.hour.toString().padLeft(2, '0');
      final mm = ls.minute.toString().padLeft(2, '0');
      text = 'last seen $hh:$mm';
    } else {
      text = 'last seen ${ls.year}-${ls.month.toString().padLeft(2, '0')}-${ls.day.toString().padLeft(2, '0')}';
    }
    return Text(text, style: TextStyle(color: cs.onSurfaceVariant, fontSize: 11));
  }
}