import 'package:flutter/material.dart';
import 'package:nyt_flutter_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

enum DialogType { loading }

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.loading: (context, sheetRequest, completer) => _LoadingDialog(request: sheetRequest),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class _LoadingDialog extends StatelessWidget {
  final DialogRequest request;

  const _LoadingDialog({required this.request});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 20),
            Expanded(child: Text(request.description ?? 'Loading...')),
          ],
        ),
      ),
    );
  }
}
