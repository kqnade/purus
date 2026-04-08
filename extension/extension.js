const vscode = require('vscode');

function activate(context) {
  context.subscriptions.push(
    vscode.commands.registerTextEditorCommand(
      'purus.surroundSlash',
      async (editor) => {
        const selection = editor.selection;
        if (selection.isEmpty) return;

        const text = editor.document.getText(selection);

        // Already wrapped in /// — stop progressive wrapping
        if (text.startsWith('///') && text.endsWith('///')) {
          return;
        }

        const wrapped = '/' + text + '/';

        const success = await editor.edit((editBuilder) => {
          editBuilder.replace(selection, wrapped);
        });

        if (success) {
          // Keep the result selected so the user can press / again
          // to progressively wrap: /text/ → //text// → ///text///
          const start = selection.start;
          const startOffset = editor.document.offsetAt(start);
          editor.selection = new vscode.Selection(
            start,
            editor.document.positionAt(startOffset + wrapped.length)
          );
        }
      }
    )
  );
}

function deactivate() {}

module.exports = { activate, deactivate };
