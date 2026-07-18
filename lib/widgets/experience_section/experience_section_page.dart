import 'package:flutter/material.dart';
import 'package:resource/resource.dart';
import 'package:shared/shared.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _openLink(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

/// Một sản phẩm làm tại công ty, kèm các kênh phân phối có thể mở được.
class ProductLink {
  final String name;
  final String? webUrl;
  final String? appStoreUrl;
  final String? playStoreUrl;

  const ProductLink({
    required this.name,
    this.webUrl,
    this.appStoreUrl,
    this.playStoreUrl,
  });
}

/// Một điểm nhấn trong công việc: icon + nhãn nhóm + mô tả + màu accent.
class ExperienceHighlight {
  final String category;
  final String description;
  final Color brutalAccent;
  final SvgGenImage icon;

  const ExperienceHighlight({
    required this.category,
    required this.description,
    required this.brutalAccent,
    required this.icon,
  });
}

class ExperienceData {
  final String role;
  final String company;
  final String? companyUrl;
  final String period;
  final List<ExperienceHighlight> highlights;
  final List<ProductLink> products;

  const ExperienceData({
    required this.role,
    required this.company,
    this.companyUrl,
    required this.period,
    required this.highlights,
    this.products = const [],
  });
}

List<ExperienceData> workExperiences(BuildContext context) => [
  ExperienceData(
    role: S.of(context).role_flutter_dev,
    company: "LongVan SystemSolution",
    companyUrl: "https://longvan.net/",
    period: S.of(context).period_longvan,
    products: const [
      ProductLink(
        name: "SaleOne",
        webUrl: "https://app.saleone.vn/",
        playStoreUrl: "https://play.google.com/store/apps/details?id=com.longvan.saleone",
      ),
      ProductLink(
        name: "DoctorHub",
        webUrl: "https://doctor-app.truedoc.vn/",
        playStoreUrl: "https://play.google.com/store/apps/details?id=com.longvan.doctorhub",
      ),
      ProductLink(
        name: "Longvan Wellness",
        webUrl: "https://app.longvan.vn/",
        appStoreUrl: "https://apps.apple.com/vn/app/longvan-wellness/id6788248596",
        playStoreUrl: "https://play.google.com/store/apps/details?id=com.longvan.wellness",
      ),
    ],
    highlights: [
      ExperienceHighlight(
        icon: Assets.svg.icData,
        category: S.of(context).hl_monorepo_title,
        description: S.of(context).hl_monorepo_desc,
        brutalAccent: BrutalColors.yellow,
      ),
      ExperienceHighlight(
        icon: Assets.svg.icApi,
        category: S.of(context).hl_auth_title,
        description: S.of(context).hl_auth_desc,
        brutalAccent: BrutalColors.blue,
      ),
      ExperienceHighlight(
        icon: Assets.svg.icFlutter,
        category: S.of(context).hl_web_title,
        description: S.of(context).hl_web_desc,
        brutalAccent: BrutalColors.purple,
      ),
      ExperienceHighlight(
        icon: Assets.svg.icRocket,
        category: S.of(context).hl_devops_title,
        description: S.of(context).hl_devops_desc,
        brutalAccent: BrutalColors.orange,
      ),
    ],
  ),
  ExperienceData(
    role: S.of(context).role_flutter_intern,
    company: "AILOGY Technology JSC",
    period: S.of(context).period_ailogy,
    products: const [
      ProductLink(
        name: "Hyperlution",
        webUrl: "https://hyperlution.com/about-us",
      ),
    ],
    highlights: [
      ExperienceHighlight(
        icon: Assets.svg.icMobile,
        category: S.of(context).hl_charge_title,
        description: S.of(context).hl_charge_desc,
        brutalAccent: BrutalColors.green,
      ),
      ExperienceHighlight(
        icon: Assets.svg.icHome,
        category: S.of(context).hl_landing_title,
        description: S.of(context).hl_landing_desc,
        brutalAccent: BrutalColors.pink,
      ),
    ],
  ),
];

class ExperienceSectionPage extends StatelessWidget {
  const ExperienceSectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isBrutal = context.isBrutal;
    final subtitleColor = isBrutal ? BrutalColors.inkSoft : context.color.neutral.text.quaternary;

    return Container(
      padding: EdgeInsets.symmetric(vertical: context.padding48_32_24, horizontal: context.padding128_32_16),
      child: Column(
        children: [
          SectionTag(text: S.of(context).tag_experience).marginOnly(bottom: context.gap12_04_04),
          S.of(context).work_experience
              .typo({context.heading3Semibold, Typo.color(isBrutal ? BrutalColors.ink : context.color.neutral.text.primary)})
              .marginOnly(bottom: context.gap12_04_04),
          S.of(context).experience_subtitle
              .typo({context.heading6Light, Typo.color(subtitleColor)})
              .marginOnly(bottom: context.gap80_64_40),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: _ExperienceTimeline(entries: workExperiences(context)),
          ),
        ],
      ),
    );
  }
}

/// Timeline dọc có hiệu ứng "vẽ" khi cuộn tới lần đầu:
/// đường kẻ tự vẽ từ trên xuống, node pop ra khi đường kẻ chạm tới,
/// card trượt vào so le. Node đầu tiên (việc hiện tại) có ring pulse liên tục.
class _ExperienceTimeline extends StatefulWidget {
  final List<ExperienceData> entries;

  const _ExperienceTimeline({required this.entries});

  @override
  State<_ExperienceTimeline> createState() => _ExperienceTimelineState();
}

class _ExperienceTimelineState extends State<_ExperienceTimeline> with TickerProviderStateMixin {
  late final AnimationController _entrance = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  );
  ScrollPosition? _position;
  bool _played = false;

  static const double _railWidth = 56;
  static const double _nodeSize = 18;
  // Node nằm ngang hàng tiêu đề card (xấp xỉ padding trên của card).
  static const double _nodeTop = 28;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (MediaQuery.disableAnimationsOf(context)) {
      _play();
      return;
    }

    final position = Scrollable.maybeOf(context)?.position;
    if (position != _position) {
      _position?.removeListener(_onScroll);
      _position = position;
      _position?.addListener(_onScroll);
    }

    if (_position == null) {
      _play();
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) => _onScroll());
    }
  }

  @override
  void dispose() {
    _position?.removeListener(_onScroll);
    _entrance.dispose();
    super.dispose();
  }

  void _play() {
    if (_played) return;
    _played = true;
    _position?.removeListener(_onScroll);
    _entrance.forward();
  }

  void _onScroll() {
    if (_played || !mounted) return;
    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize || !box.attached) return;
    final topEdge = box.localToGlobal(Offset.zero).dy;
    if (topEdge < MediaQuery.sizeOf(context).height * 0.8) _play();
  }

  // Khoảng thời gian (0..1) cho từng phần của entrance animation.
  Interval _nodeInterval(int i) {
    final start = 0.1 + 0.5 * i / widget.entries.length;
    return Interval(start, (start + 0.22).clamp(0.0, 1.0), curve: Curves.elasticOut);
  }

  Interval _cardInterval(int i) {
    final start = 0.18 + 0.5 * i / widget.entries.length;
    return Interval(start, (start + 0.4).clamp(0.0, 1.0), curve: Curves.easeOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    final isBrutal = context.isBrutal;
    const cyan = Color(0xFF06B6D4);

    return AnimatedBuilder(
      animation: _entrance,
      builder: (context, _) {
        final lineProgress = Curves.easeInOut.transform(
          const Interval(0.0, 0.6).transform(_entrance.value),
        );

        return Stack(
          children: [
            // Đường kẻ timeline tự vẽ theo tiến độ entrance.
            Positioned.fill(
              child: CustomPaint(
                painter: _TimelineLinePainter(
                  progress: lineProgress,
                  x: _railWidth / 2,
                  startY: _nodeTop + _nodeSize / 2,
                  isBrutal: isBrutal,
                ),
              ),
            ),
            Column(
              children: [
                for (var i = 0; i < widget.entries.length; i++)
                  Padding(
                    padding: EdgeInsets.only(bottom: i == widget.entries.length - 1 ? 0 : 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: _railWidth,
                          child: Padding(
                            padding: const EdgeInsets.only(top: _nodeTop),
                            child: Center(
                              child: _buildNode(
                                index: i,
                                isBrutal: isBrutal,
                                cyan: cyan,
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: _buildAnimatedCard(i)),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildNode({required int index, required bool isBrutal, required Color cyan}) {
    final pop = _nodeInterval(index).transform(_entrance.value);
    final isCurrent = index == 0;

    final nodeColor = isBrutal
        ? (isCurrent ? BrutalColors.yellow : BrutalColors.blue)
        : cyan;

    Widget node = Container(
      width: _nodeSize,
      height: _nodeSize,
      decoration: isBrutal
          ? BoxDecoration(
              color: nodeColor,
              border: Border.all(color: BrutalColors.ink, width: 2.5),
              borderRadius: BorderRadius.circular(4),
            )
          : BoxDecoration(
              color: nodeColor,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: cyan.withOpacity(0.6), blurRadius: 10)],
            ),
    );

    if (isBrutal) {
      // Node brutal xoay 45° thành hình kim cương.
      node = Transform.rotate(angle: 0.785398, child: node);
    }

    // Ring tĩnh đánh dấu công việc hiện tại — không animation.
    if (isCurrent) {
      node = Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: _nodeSize + 12,
            height: _nodeSize + 12,
            decoration: BoxDecoration(
              shape: isBrutal ? BoxShape.rectangle : BoxShape.circle,
              borderRadius: isBrutal ? BorderRadius.circular(6) : null,
              border: Border.all(
                color: (isBrutal ? BrutalColors.orange : cyan).withOpacity(0.8),
                width: 2,
              ),
            ),
          ),
          node,
        ],
      );
    }

    return Transform.scale(scale: pop.clamp(0.0, 1.6), child: node);
  }

  Widget _buildAnimatedCard(int index) {
    final t = _cardInterval(index).transform(_entrance.value);
    return Opacity(
      opacity: t.clamp(0.0, 1.0),
      child: Transform.translate(
        offset: Offset(40 * (1 - t), 0),
        child: _ExperienceCard(data: widget.entries[index]),
      ),
    );
  }
}

class _TimelineLinePainter extends CustomPainter {
  final double progress;
  final double x;
  final double startY;
  final bool isBrutal;

  _TimelineLinePainter({
    required this.progress,
    required this.x,
    required this.startY,
    required this.isBrutal,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;
    final endY = startY + (size.height - startY) * progress;

    if (isBrutal) {
      final paint = Paint()
        ..color = BrutalColors.ink
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round;
      canvas.drawLine(Offset(x, startY), Offset(x, endY), paint);
    } else {
      const cyan = Color(0xFF06B6D4);
      final paint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [cyan, cyan.withOpacity(0.15)],
        ).createShader(Rect.fromLTRB(x - 1, startY, x + 1, endY))
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round;
      canvas.drawLine(Offset(x, startY), Offset(x, endY), paint);
    }
  }

  @override
  bool shouldRepaint(_TimelineLinePainter old) =>
      old.progress != progress || old.isBrutal != isBrutal;
}

class _ExperienceCard extends StatefulWidget {
  final ExperienceData data;

  const _ExperienceCard({required this.data});

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _hovered = false;

  ExperienceData get data => widget.data;

  @override
  Widget build(BuildContext context) {
    final isBrutal = context.isBrutal;
    const cyan = Color(0xFF06B6D4);
    final accent = isBrutal ? BrutalColors.ink : cyan;

    // Desktop: gọn mặc định, hover mở chi tiết. Mobile/tablet không có
    // hover nên luôn mở.
    final hoverable = context.isDesktopBreakPoint;
    final expanded = !hoverable || _hovered;

    final header = _buildHeader(context, isBrutal, accent, hoverable: hoverable, expanded: expanded);

    final details = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: isBrutal ? 2 : 1,
          margin: EdgeInsets.symmetric(vertical: context.gap24_16_12),
          color: isBrutal ? BrutalColors.ink.withOpacity(0.12) : Colors.white.withOpacity(0.08),
        ),
        ...data.highlights.map((h) => _buildHighlight(context, h, isBrutal)),
        if (data.products.isNotEmpty) ...[
          Text(
            S.of(context).products_i_worked_on,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
              color: isBrutal ? BrutalColors.inkSoft : Colors.white.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: data.products.map((p) => _ProductChip(product: p)).toList(),
          ),
        ],
      ],
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        width: double.infinity,
        padding: EdgeInsets.all(context.padding32_16_12),
        decoration: isBrutal
            ? BrutalDecoration.card(
                color: BrutalColors.paper,
                borderWidth: 3,
                radius: 16,
                shadowOffset: expanded && hoverable ? const Offset(10, 10) : const Offset(7, 7),
              )
            : BoxDecoration(
                color: const Color(0xFF1A1F28),
                border: Border.all(
                  color: expanded && hoverable ? cyan.withOpacity(0.6) : const Color(0xFF414651),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: expanded && hoverable
                    ? [BoxShadow(color: cyan.withOpacity(0.25), blurRadius: 30, spreadRadius: -6, offset: const Offset(0, 12))]
                    : const [],
              ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header,
            // AnimatedSize + AnimatedOpacity: mở/đóng chi tiết mượt,
            // không giật layout.
            AnimatedSize(
              duration: const Duration(milliseconds: 320),
              curve: Curves.easeOutCubic,
              alignment: Alignment.topCenter,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: expanded ? 380 : 180),
                curve: Curves.easeOut,
                opacity: expanded ? 1 : 0,
                child: expanded ? details : const SizedBox(width: double.infinity),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isBrutal, Color accent,
      {required bool hoverable, required bool expanded}) {
    final roleText = "${data.role} "
        .typo({context.heading5Semibold, Typo.color(isBrutal ? BrutalColors.ink : Colors.white)});
    Widget companyText = "@ ${data.company}"
        .typo({context.heading5Semibold, Typo.color(isBrutal ? BrutalColors.orange : accent)});

    // Company mở website khi có URL. Không bọc text + icon trong Row cứng —
    // Row không cho text xuống dòng nên tràn ở màn hẹp; icon là Wrap-item riêng.
    Widget? companyLinkIcon;
    if (data.companyUrl != null) {
      Widget clickable(Widget child) => Tooltip(
            message: data.companyUrl!,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(onTap: () => _openLink(data.companyUrl!), child: child),
            ),
          );
      companyText = clickable(companyText);
      companyLinkIcon = clickable(
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Icon(
            Icons.open_in_new_rounded,
            size: 15,
            color: isBrutal ? BrutalColors.orange : accent,
          ),
        ),
      );
    }

    // Chevron gợi ý có nội dung ẩn, xoay khi mở.
    final chevron = hoverable
        ? AnimatedRotation(
            turns: expanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 22,
              color: isBrutal ? BrutalColors.ink : Colors.white.withOpacity(0.6),
            ),
          )
        : const SizedBox.shrink();

    final periodBadge = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: isBrutal
          ? BrutalDecoration.flatChip(color: BrutalColors.green, borderWidth: 2, radius: 100)
          : BoxDecoration(
              color: accent.withOpacity(0.12),
              border: Border.all(color: accent.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(100),
            ),
      child: Text(
        data.period,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: isBrutal ? BrutalColors.ink : accent,
        ),
      ),
    );

    final title = Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        roleText,
        companyText,
        if (companyLinkIcon != null) companyLinkIcon,
      ],
    );

    // Desktop: title trái, badge + chevron phải cùng hàng. Hẹp: xuống dòng.
    if (context.isDesktopBreakPoint) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: title),
          const SizedBox(width: 16),
          periodBadge,
          const SizedBox(width: 10),
          chevron,
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title,
        const SizedBox(height: 12),
        periodBadge,
      ],
    );
  }

  Widget _buildHighlight(BuildContext context, ExperienceHighlight h, bool isBrutal) {
    final markerColor = isBrutal ? h.brutalAccent : const Color(0xFF06B6D4);
    return Padding(
      padding: EdgeInsets.only(bottom: context.gap24_16_12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon box: chip màu viền đen (brutal) / ô cyan mờ (classic)
          Container(
            width: 36,
            height: 36,
            decoration: isBrutal
                ? BrutalDecoration.flatChip(color: markerColor, borderWidth: 2, radius: 10)
                : BoxDecoration(
                    color: markerColor.withOpacity(0.12),
                    border: Border.all(color: markerColor.withOpacity(0.35)),
                    borderRadius: BorderRadius.circular(10),
                  ),
            child: Center(
              child: h.icon.svg(
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(
                  isBrutal ? BrutalColors.ink : markerColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  h.category,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: isBrutal ? BrutalColors.ink : Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  h.description,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.55,
                    color: isBrutal ? BrutalColors.inkSoft : Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Chip sản phẩm: tên + các nút kênh (web / App Store / Google Play).
class _ProductChip extends StatelessWidget {
  final ProductLink product;

  const _ProductChip({required this.product});

  @override
  Widget build(BuildContext context) {
    final isBrutal = context.isBrutal;

    final channels = <Widget>[
      if (product.webUrl != null)
        _ChannelIcon(icon: Icons.language_rounded, tooltip: S.of(context).tooltip_web_app, url: product.webUrl!),
      if (product.appStoreUrl != null)
        _ChannelIcon(icon: Icons.apple_rounded, tooltip: S.of(context).tooltip_app_store, url: product.appStoreUrl!),
      if (product.playStoreUrl != null)
        _ChannelIcon(icon: Icons.android_rounded, tooltip: S.of(context).tooltip_google_play, url: product.playStoreUrl!),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: isBrutal
          ? BrutalDecoration.flatChip(color: BrutalColors.cream, borderWidth: 2, radius: 10)
          : BoxDecoration(
              color: const Color(0xFF2A3038),
              border: Border.all(color: const Color(0xFF414651)),
              borderRadius: BorderRadius.circular(10),
            ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Flexible + ellipsis: trong Wrap chip nhận đúng bề rộng dòng,
          // tên dài phải co lại thay vì tràn khỏi Row.
          Flexible(
            child: Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: isBrutal ? BrutalColors.ink : Colors.white,
              ),
            ),
          ),
          Container(
            width: 1.5,
            height: 16,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: isBrutal ? BrutalColors.ink.withOpacity(0.25) : Colors.white.withOpacity(0.15),
          ),
          Row(mainAxisSize: MainAxisSize.min, spacing: 8, children: channels),
        ],
      ),
    );
  }
}

/// Icon một kênh phân phối, hover đổi màu, click mở link.
class _ChannelIcon extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final String url;

  const _ChannelIcon({required this.icon, required this.tooltip, required this.url});

  @override
  State<_ChannelIcon> createState() => _ChannelIconState();
}

class _ChannelIconState extends State<_ChannelIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isBrutal = context.isBrutal;
    const cyan = Color(0xFF06B6D4);

    final color = _hovered
        ? (isBrutal ? BrutalColors.orange : cyan)
        : (isBrutal ? BrutalColors.ink : Colors.white.withOpacity(0.65));

    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => _openLink(widget.url),
          child: AnimatedScale(
            scale: _hovered ? 1.2 : 1.0,
            duration: const Duration(milliseconds: 150),
            child: Icon(widget.icon, size: 18, color: color),
          ),
        ),
      ),
    );
  }
}
