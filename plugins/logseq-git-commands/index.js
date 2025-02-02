const logseq = window.logseq;
const { exec } = require('child_process');
const path = require('path');
const fs = require('fs');

function getFormattedDate() {
  const now = new Date();
  const day = String(now.getDate()).padStart(2, '0');
  const month = String(now.getMonth() + 1).padStart(2, '0'); // months are 0-indexed
  const year = now.getFullYear();
  const hours = String(now.getHours()).padStart(2, '0');
  const minutes = String(now.getMinutes()).padStart(2, '0');

  return `${day}/${month}/${year} ${hours}:${minutes}`;
}

async function pushToGit() {
  try {
    // Get the current Logseq directory (repo path)
    const logseqDir = logseq.App.getCurrentPath();
    if (!logseqDir) {
      console.error("Logseq path is unavailable.");
      return;
    }

    console.log("Logseq repo path:", logseqDir);

    // Ensure we're in the right directory
    process.chdir(logseqDir);

    // Add all changes
    exec('git add .', (err, stdout, stderr) => {
      if (err) {
        console.error('Error adding changes:', err);
        return;
      }
      if (stderr) {
        console.error('Git add stderr:', stderr);
        return;
      }
      console.log('Changes added to Git:', stdout);

      // Create commit with date as message
      const commitMessage = getFormattedDate();
      exec(`git commit -m "Commit at ${commitMessage}"`, (err, stdout, stderr) => {
        if (err) {
          console.error('Error creating commit:', err);
          return;
        }
        if (stderr) {
          console.error('Git commit stderr:', stderr);
          return;
        }
        console.log('Git commit created with message:', commitMessage);

        // Push changes
        exec('git push origin main', (err, stdout, stderr) => {
          if (err) {
            console.error('Error pushing to Git:', err);
            return;
          }
          if (stderr) {
            console.error('Git push stderr:', stderr);
            return;
          }
          console.log('Changes pushed to Git:', stdout);
        });
      });
    });
  } catch (err) {
    console.error('Error pushing to Git:', err);
  }
}

logseq.ready(() => {
  logseq.App.onSlashCommand((e) => {
    const { trigger, payload } = e;
    if (trigger === '/git-push') {
      pushToGit();
    }
  });

  logseq.Editor.registerSlashCommand('git-push', () => {
    // This is the slash command that triggers the Git push
    logseq.UI.showMsg("Pushing changes to Git...");
    pushToGit();
  });
});
