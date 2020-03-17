import RxDataSources
import Rswift

extension RxTableViewSectionedAnimatedDataSource {
    convenience init<CellType: UITableViewCell>(
        reuseIdentifier: ReuseIdentifier<CellType>,
        provider: @escaping (Section.Item) -> (CellType.ConfigurationType),
        animationConfiguration: AnimationConfiguration = AnimationConfiguration(),
        decideViewTransition: @escaping DecideViewTransition = { _, _, _ in .animated },
        titleForHeaderInSection: @escaping TitleForHeaderInSection = { _, _ in nil },
        titleForFooterInSection: @escaping TitleForFooterInSection = { _, _ in nil },
        canEditRowAtIndexPath: @escaping CanEditRowAtIndexPath = { _, _ in false },
        canMoveRowAtIndexPath: @escaping CanMoveRowAtIndexPath = { _, _ in false },
        sectionIndexTitles: @escaping SectionIndexTitles = { _ in nil },
        sectionForSectionIndexTitle: @escaping SectionForSectionIndexTitle = { _, _, index in index }
    ) where CellType: Configurable {
        self.init(
            animationConfiguration: animationConfiguration,
            decideViewTransition: decideViewTransition,
            configureCell: { _, tableView, indexPath, item -> UITableViewCell in
                let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)!
                cell.configure(for: provider(item))
                return cell
            },
            titleForHeaderInSection: titleForHeaderInSection,
            titleForFooterInSection: titleForFooterInSection,
            canEditRowAtIndexPath: canEditRowAtIndexPath,
            canMoveRowAtIndexPath: canMoveRowAtIndexPath,
            sectionIndexTitles: sectionIndexTitles,
            sectionForSectionIndexTitle: sectionForSectionIndexTitle
        )
    }
}
