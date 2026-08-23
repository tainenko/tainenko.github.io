---
name: technical-blog-writing
description: "Writing guidance for software engineering / technical blog posts on this Jekyll blog (tainenko.github.io) — post structure templates, voice and tone, code example conventions, and this repo's front matter format. Use this whenever the user asks to draft, write, or outline a new blog post, article, or _posts/ entry for this repo, whether it's about an algorithm/Leetcode problem, an interview writeup, a framework deep dive (Vue/React/etc.), a bug postmortem, a benchmark, or a system design explainer — even if they just say something like '幫我寫一篇關於 X 的文章' or 'draft a post about Y' without naming this skill."
---

# Technical Blog Writing (tainenko.github.io)

Guidance for drafting software-engineering blog posts for this repo. The goal is a post that reads like the rest of this blog and like something a working engineer would actually want to read — not a generic AI essay with a title slapped on it.

## Before writing: pick the post type

Different technical content wants a different shape. Skimming for the shape first keeps the post from turning into an undifferentiated wall of text. Ask yourself what kind of thing this actually is, then follow that structure loosely (adapt it — these are starting points, not forms to fill in):

**Tutorial / How-To** — reader should be able to follow along and end up with something working.
1. What we're building (show the end result up front, so the reader knows if it's worth continuing)
2. Prerequisites (don't waste the wrong audience's time)
3. Step-by-step implementation, each step: explanation → code → output
4. Complete code / repo link
5. Next steps or extensions

**Deep Dive / Explainer** — explains a concept, API, or language feature in depth.
1. What it is and why it matters
2. Simplified mental model first, then the detailed mechanics
3. Real-world example
4. Trade-offs / when *not* to use it
5. Further reading

**Postmortem / Incident Report** — a bug or outage writeup.
1. Summary (what happened, impact, duration)
2. Timeline
3. Root cause
4. Fix
5. Prevention going forward
6. Lessons learned

**Benchmark / Comparison** — data-driven comparison of tools or approaches.
1. What's being compared and why
2. Methodology (specific enough to reproduce)
3. Results (numbers/tables)
4. Analysis — what the numbers actually mean
5. Recommendation, with caveats
6. Raw data or reproduction steps

**Architecture / System Design** — explains how something is built and why.
1. Problem being solved
2. Constraints and requirements
3. Options considered
4. Chosen design (diagram if it helps — a diagram beats 500 words of prose description)
5. Trade-offs accepted
6. Results / lessons

If a Leetcode or interview-prep post is being drafted, that's closest to Tutorial or Deep Dive depending on whether it's "how to solve this problem" (tutorial) or "here's a technique/pattern and when to reach for it" (deep dive) — pick based on what the reader actually walks away able to do.

## Voice

Write the way this blog already does: direct, first-person, willing to say what didn't work. A few concrete habits:

| Do | Don't |
|----|-------|
| State the answer plainly: "用 `next()` 搭配 generator comprehension" | Hedge: "你可能會想要考慮使用..." |
| Give specific numbers when they exist: "從 800ms 降到 90ms" | Vague claims: "效能有顯著改善" |
| Say what the downside is | Pretend the approach has none |
| Say when *not* to use something | Only cover the happy path |

Avoid filler that adds words without adding information: "在這個快速變化的技術時代..."、"眾所皆知..."、"很簡單，只要..."（如果真的很簡單，讀者不需要一篇文章）、"顯而易見...". If it's obvious, don't spend a sentence saying so.

## Code examples

Every code block in a technical post is implicitly a promise that it works. Treat it that way:
- Make it runnable/complete, not a fragment missing the imports or setup it depends on
- Tag the language for syntax highlighting
- Use realistic names (`calculate_retry_delay`, not `foo`)
- Show the output or result when it's not obvious from reading the code
- Note the language/library version when behavior could differ across versions (Python 3 vs 2 sensitivities, Vue2 vs Vue3 API differences, etc. — relevant a lot on this blog given the Vue3 series)

## Calibrate explanation depth to the audience signal

The topic and framing tell you how much to explain. A post titled "[入門]" or introducing a tool for the first time should assume nothing; a post that's clearly "how we solved X" for an audience that already knows the basics can skip them. When it's ambiguous, say the assumption out loud near the top ("這篇文章假設你已經熟悉...") rather than guessing silently — it lets the wrong-level reader bail early instead of getting lost or bored partway through.

## Shape of a post

Loose template — TL;DR and a trade-offs/limitations section are the two pieces most often missing from a first draft, and both are cheap to add:

```
# Title
[TL;DR — one to three sentences, the key takeaway before any setup]

## 問題 / 動機
[Why this matters — specific to a real situation, not generic]

## 做法 / 解法
[The core content: code, explanation, steps]

## 結果
[What happened — numbers if there are any]

## Trade-offs / 限制
[Honest about the downsides — this is what makes a post trustworthy instead of like marketing]

## 總結
[Key takeaway, what to do next]
```

Rough length by type, as a sanity check rather than a hard rule: quick tip ~500-800 words, tutorial ~1500-3000, deep dive ~2000-4000, architecture post ~2000-3500 (diagrams carry some of the load), benchmark ~1500-2500 (the data does the heavy lifting).

## Common mistakes to avoid

| Mistake | Why it hurts |
|---|---|
| No TL;DR | Busy readers bounce before reaching the point |
| Untested/broken code block | Destroys trust in the rest of the post |
| No version pinned on a fast-moving API | Post silently goes stale |
| "只要...", "很簡單..." | Reads as dismissive of the reader's actual experience |
| Wall of prose describing an architecture instead of a diagram | Much harder to follow than it needs to be |
| No trade-offs section | Reads as biased/marketing rather than engineering judgment |
| Giant intro before the actual content | Readers leave before getting there |

## This repo's conventions

New posts go in `_posts/`, filename `YYYY-MM-DD-slug.md` (existing posts are further organized into subfolders by topic, e.g. `_posts/leetcode/`, `_posts/vue3/`, `_posts/interview/` — put a new post in the matching subfolder, or `_posts/` directly if it doesn't fit an existing category).

Front matter, matching existing posts:

```yaml
---
layout: post
title:  "[分類] 標題"
author: tony
categories: [category1, category2]
tags: [tag1,tag2]
crosspost_to_medium: true
---
```

- `title` conventionally starts with a bracketed tag matching the topic, e.g. `[Leetcode]`, `[Interview]`
- `categories` and `tags` follow the existing taxonomy in `_posts/` — check a couple of recent posts in the same topic area for the exact values already in use rather than inventing new ones
- Only add `crosspost_to_medium: true` if the user actually wants this post pushed to Medium too — leave it out otherwise. This is a real, public, external publish action (see [_plugins/medium_crosspost.rb](../../_plugins/medium_crosspost.rb)), so don't add it silently on the user's behalf without them asking for the crosspost.
- Body text is Traditional Chinese prose with English left in place for code, library/API names, and technical terms that don't have a natural Chinese equivalent in this blog's existing usage (match what similar existing posts do rather than translating everything or leaving too much in English)
