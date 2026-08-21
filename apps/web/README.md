# Strona Dianovo

Landing page projektu Dianovo zbudowany w [Astro](https://astro.build/).

## Wymagania

- Node.js 22.12 lub nowszy
- pnpm 10 lub nowszy

## Instalacja

Z głównego katalogu repozytorium zainstaluj zależności:

```bash
pnpm install
```

Następnie przejdź do katalogu aplikacji web:

```bash
cd apps/web
```

## Uruchomienie lokalne

```bash
pnpm dev
```

Strona będzie dostępna pod adresem wyświetlonym w terminalu — domyślnie jest to
`http://localhost:4321`.

## Formatowanie kodu

```bash
pnpm exec prettier --write 'src/**/*.{astro,ts,css}'
```

## Budowanie wersji produkcyjnej

```bash
pnpm build
```

Gotowe pliki statyczne zostaną zapisane w katalogu `dist/`. Aby lokalnie
sprawdzić wynik budowania, uruchom:

```bash
pnpm preview
```

## Struktura katalogów

```text
src/
├── components/landing/  # Reużywalne sekcje strony
├── layouts/            # Wspólny układ dokumentu
├── pages/              # Trasy Astro
├── scripts/            # Interakcje po stronie przeglądarki
└── styles/             # Globalne style strony
```
