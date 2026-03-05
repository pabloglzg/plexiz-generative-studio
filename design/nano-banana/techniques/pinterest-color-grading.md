# Pinterest Color Grading Method

Nano Banana defaults to a grayish color grade. This method fixes it.

## Workflow
1. **Find a reference photo** on Pinterest with the aesthetic/color grading you want
2. **Analyze with vision model** (ChatGPT 5.1 or Claude): "Analyze this photo and give me a very detailed JSON prompt that can recreate it. Break down the color grading and all exact colors."
3. **Use the JSON in Nano Banana** with your product/subject: "Using this JSON as reference, generate [subject] with [product]"
4. **Save the generated character** as reference for facial consistency
5. **Always attach the character photo** in subsequent generations for consistent UGC

## Why it works
The detailed color grading JSON forces Nano Banana out of its default grey palette. Without explicit color direction, the model defaults to desaturated, flat lighting.

## Pro tips
- Use ChatGPT for the analysis (strong photo analysis capabilities)
- The more specific the color breakdown (shadows, midtones, highlights separately), the better
- Works for both product photography and character generation

Source: @iamrollandex https://x.com/iamrollandex/status/2028430925072060783
