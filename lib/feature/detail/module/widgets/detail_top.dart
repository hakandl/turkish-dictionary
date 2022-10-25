part of '../../view/detail_view.dart';

class DetailTop extends StatelessWidget {
  const DetailTop({
    Key? key,
    this.title,
    this.subtitle,
    this.signLanguageWidget,
    this.onVoice,
    this.onSaved,
    this.child,
  }) : super(key: key);
  final String? title;
  final String? subtitle;
  final VoidCallback? onVoice;
  final VoidCallback? onSaved;
  final Widget? signLanguageWidget;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return context.watch<DetailViewModel>().isLoading
        ? const DetailTopViewShimmer()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(context),
              _subtitle(context),
              _buttons(context),
            ],
          );
  }

  Text _title(BuildContext context) {
    return Text(
      title ?? context.watch<DetailViewModel>().detailList?.firstOrNull?.word ?? TurkceSozlukStringConstants.empty,
      style: context.textTheme.headlineLarge?.copyWith(
        color: context.colorScheme.background,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Text _subtitle(BuildContext context) {
    return Text(
      subtitle ??
          '${context.watch<DetailViewModel>().detailList?.firstOrNull?.pronunciation ?? TurkceSozlukStringConstants.empty} ${context.watch<DetailViewModel>().detailList?.firstOrNull?.language ?? TurkceSozlukStringConstants.empty}',
      style:
          context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onBackground, fontWeight: FontWeight.w500),
    );
  }

  Padding _buttons(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingNormal,
      child: Row(
        children: [
          _VoiceButton(onVoice: onVoice),
          context.emptySizedWidthBoxLow3x,
          _SavedButton(
            onSaved: onSaved,
            child: child,
          ),
          const Spacer(),
          _SignLanguageButton(signLanguageWidget: signLanguageWidget)
        ],
      ),
    );
  }
}

class _VoiceButton extends StatelessWidget {
  const _VoiceButton({
    Key? key,
    required this.onVoice,
  }) : super(key: key);

  final VoidCallback? onVoice;

  @override
  Widget build(BuildContext context) {
    return TurkceSozlukCircleElevatedButton(
      onPressed: onVoice ??
          () => context.read<DetailViewModel>().speak(DetailViewModel.word ?? TurkceSozlukStringConstants.empty),
      child: SvgWidget(
        icon: SvgNameEnum.voice.icon,
        color: context.colorScheme.onSecondary,
      ),
    );
  }
}

class _SavedButton extends StatefulWidget {
  const _SavedButton({
    Key? key,
    required this.onSaved,
    this.child,
  }) : super(key: key);

  final Widget? child;
  final VoidCallback? onSaved;

  @override
  State<_SavedButton> createState() => _SavedButtonState();
}

class _SavedButtonState extends State<_SavedButton> {
  @override
  Widget build(BuildContext context) {
    return TurkceSozlukCircleElevatedButton(
      onPressed: widget.onSaved ??
          () {
            setState(() {
              if (context.read<SavedViewModel>().savedWordBox.containsKey(DetailViewModel.word)) {
                context.read<SavedViewModel>().savedWordBox.delete(DetailViewModel.word);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBarCard(content: LocaleKeys.info_savedRemove.tr(), context));
                return;
              }
              context
                  .read<SavedViewModel>()
                  .savedWordBox
                  .put(DetailViewModel.word, DetailViewModel.word ?? TurkceSozlukStringConstants.empty);
              ScaffoldMessenger.of(context).showSnackBar(SnackBarCard(content: LocaleKeys.info_savedAdd.tr(), context));
            });
          },
      child: widget.child ?? _savedIcon(context),
    );
  }

  SvgWidget _savedIcon(BuildContext context) {
    return SvgWidget(
      icon: context.read<SavedViewModel>().savedWordBox.containsKey(DetailViewModel.word)
          ? SvgNameEnum.savedSolid.icon
          : SvgNameEnum.saved.icon,
      color: context.colorScheme.onSecondary,
    );
  }
}

class _SignLanguageButton extends StatelessWidget with TurkceSozlukModalSheet {
  const _SignLanguageButton({this.signLanguageWidget});
  final Widget? signLanguageWidget;

  @override
  Widget build(BuildContext context) {
    return TurkceSozlukIconTextButton(
      text: LocaleKeys.button_turkishSignLanguage.tr(),
      textStyle: TextStyle(color: context.colorScheme.onSecondary),
      icon: SvgWidget(
        icon: SvgNameEnum.hand.icon,
        color: context.colorScheme.onSecondary,
      ),
      onPressed: () => showTurkceSozlukModalSheet(
        context,
        Expanded(child: _ModalSheetList(signLanguageWidget: signLanguageWidget)),
      ),
    );
  }
}

class _ModalSheetList extends StatelessWidget {
  const _ModalSheetList({
    Key? key,
    required this.signLanguageWidget,
  }) : super(key: key);

  final Widget? signLanguageWidget;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: DetailViewModel(DetailService(ProjectNetworkManager.instance.service)),
      builder: (context, child) {
        return context.watch<DetailViewModel>().isLoading
            ? const DetailModalSheetShimmer()
            : signLanguageWidget ??
                SignLanguageListView(
                  itemCount: context.read<DetailViewModel>().detailList?.firstOrNull?.word?.length ?? 1,
                  word: context.read<DetailViewModel>().detailList?.firstOrNull?.word ??
                      TurkceSozlukStringConstants.empty,
                );
      },
    );
  }
}
