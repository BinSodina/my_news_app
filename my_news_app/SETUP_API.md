# Setup Instructions for newsdata.io API

## 1. Get Your API Key

1. Go to [newsdata.io](https://newsdata.io/)
2. Sign up for a free account
3. Copy your API key from the dashboard

## 2. Add Your API Key

Open the file: `lib/core/constants/app_constants.dart`

Replace `YOUR_API_KEY_HERE` with your actual API key:

```dart
static const String apiKey = 'pub_123456abcdef'; // Your actual key
```

## 3. Run the App

```bash
flutter run
```

## API Endpoint Being Used

```
https://newsdata.io/api/1/latest?apikey=YOUR_KEY&language=en
```

## Response Structure

The newsdata.io API returns:
```json
{
  "status": "success",
  "totalResults": 10,
  "results": [
    {
      "article_id": "unique-id",
      "title": "Article Title",
      "description": "Article description",
      "creator": ["Author Name"],
      "pubDate": "2026-01-13 16:04:00",
      "image_url": "https://...",
      "source_name": "Source Name",
      "link": "https://..."
    }
  ]
}
```

## Field Mapping

| newsdata.io API | Our App Entity |
|----------------|----------------|
| `article_id`   | `id`          |
| `title`        | `title`       |
| `description`  | `description` |
| `creator[0]`   | `author`      |
| `pubDate`      | `publishedAt` |
| `image_url`    | `imageUrl`    |

## Optional: Add Query Parameters

You can customize the API call in `news_remote_datasource.dart`:

```dart
final url = Uri.parse(
  '${AppConstants.baseUrl}${AppConstants.latestNewsEndpoint}'
  '?apikey=${AppConstants.apiKey}'
  '&language=en'           // Language filter
  '&country=us'            // Country filter (optional)
  '&category=technology'   // Category filter (optional)
  '&q=flutter'             // Search query (optional)
);
```

## Available Parameters

- `language`: Language code (en, es, fr, etc.)
- `country`: Country code (us, gb, ca, etc.)
- `category`: business, entertainment, environment, food, health, politics, science, sports, technology, top, world
- `q`: Search keyword
- `page`: Page number for pagination

## Free Tier Limits

- 200 API calls per day
- Latest news only (historical data requires paid plan)

## Troubleshooting

If you get errors:
1. Check your API key is valid
2. Ensure you haven't exceeded daily limit
3. Check internet connection
4. View error messages in the app's error state
