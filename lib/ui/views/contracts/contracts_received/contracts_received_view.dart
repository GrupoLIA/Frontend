import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lia_frontend/ui/views/contracts/contracts_viewmodel.dart';
import 'package:lia_frontend/ui/views/dumb_widgets/contract_list_item/contract_list_item.dart';
import 'package:lia_frontend/ui/views/smart_widgets/creation_aware_list_item/creation_aware_list_item.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:stacked/stacked.dart';

class ContractsReceivedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return ViewModelBuilder.reactive(
      viewModelBuilder: () =>
          ContractsViewModel(isEmployee: args['isEmployee']),
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: [
            model.isBusy || model.data == null
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: ScrollablePositionedList.builder(
                      itemScrollController: model.itemScrollController,
                      itemCount: model.items.length,
                      itemBuilder: (context, index) => CreationAwareListItem(
                        itemCreated: () {
                          SchedulerBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            model.handleItemCreated(index);
                          });
                        },
                        child: ContractListItem(
                          id: model.items[index].id,
                          status: model.items[index].status,
                          hasReview: model.items[index].hasReview,
                          trade: model.items[index].trade,
                          employee: model.items[index].employee,
                          employer: model.items[index].employer,
                          onTapFunction: model.items[index].status == "pending"
                              ? model.showAcceptContractConfirmationDialog
                              : null,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
