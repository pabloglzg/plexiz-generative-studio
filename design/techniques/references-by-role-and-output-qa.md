# References by role and output QA

Source: [existing JSON prompting recipe](../nano-banana/techniques/json-prompting.md) and a local assisted image-generation rehearsal on 2026-10-09. This note documents input preparation and visual checks, not an advertising-performance experiment. No client assets or private campaign data are included.

## Resolve authority before prompting

A social screenshot can contain the subject, an old offer, platform UI and a past layout. Prefer the original identity resource when available. Assign each actual attachment a narrow role:

| Reference | Governs | Does not govern |
| --- | --- | --- |
| Character sheet | Face, silhouette, proportions, clothing and material | Sheet labels, old campaign palette or layout |
| Original logo | Symbol, colors, lettering and proportions | Character clothing unless that application is documented |
| Font specimen | Letterforms, weights, numerals and punctuation | Example copy or specimen arrangement |

Write the role map in the same order as the actual attachments. A prompt mentioning a reference is insufficient if the file was not attached.

## Specify the production mode

For a new composition, use original identity resources and describe the new layout. An earlier generated ad becomes a layout/style reference if attached; calling it “identity only” does not reliably undo that influence. Use previous outputs for edits only when that inheritance is intended.

Separate scene direction from graphic direction: the subject's action and physical relationships are one decision; hierarchy, color, spacing and text are another.

## Use a real typography specimen

Render the selected font locally instead of asking the image model to invent a font sample. Include numerals and the actual language's diacritics and punctuation. If the brand has no established family, label the choice as a proposal for this task.

Attaching the specimen can guide the result; it does not establish exact font reproduction or a license to redistribute the font.

## Inspect the effective output

Check the actual image, not only the prompt or success receipt:

- Identity, clothing applications and logo geometry against their respective references.
- Visible limbs, contacts and occlusions; do not claim anatomy outside the frame.
- Exact copy, numeric values, units and dates.
- Hierarchy and readability at intended viewing size.
- Actual pixel dimensions and margins; the requested aspect ratio or resolution may be approximate.
- Native platform previews before release. Visibility in a PNG does not prove safety under every overlay or crop.

Record prompt, effective attachment order, tool, exposed parameters, output hash and review verdict. Use unknown values when model, cost or preset are not exposed.

## What the rehearsal established

Original references and a deterministically rendered font specimen were successfully supplied to an integrated image-generation tool, and the resulting image could be checked against those roles. Numeric text and visible clothing attributes were reviewed.

This does not establish pixel-exact logos, exact font replication, cross-shot consistency, native-placement acceptance, autonomous repeatability or better ad results. Those require their own evidence. Keep output approval, publication and measured performance separate.
