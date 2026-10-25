# Triage Labels

The skills speak in terms of five canonical triage roles. This file maps those roles to the actual label strings used in this repo's issue tracker. In Microsoft To Do a label is a tag on the task (Graph `categories`), set with `todo create --label X` or `todo label td-… --add X --remove Y`.

| Label in mattpocock/skills | To Do tag         | Meaning                                  |
| -------------------------- | ----------------- | ---------------------------------------- |
| `needs-triage`             | `needs-triage`    | Maintainer needs to evaluate this issue  |
| `needs-info`               | `needs-info`      | Waiting on reporter for more information |
| `ready-for-agent`          | `ready-for-agent` | Fully specified, ready for an AFK agent  |
| `ready-for-human`          | `ready-for-human` | Requires human implementation            |
| `wontfix`                  | `wontfix`         | Will not be actioned (tag it, then `todo close`) |

When a skill mentions a role (e.g. "apply the AFK-ready triage label"), use the corresponding tag from this table.

Edit the "To Do tag" column to match whatever vocabulary you actually use.
