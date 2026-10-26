# Strona Dialy

Landing page projektu Dialy zbudowany w [Astro](https://astro.build/). Wejdź na <a href="dialyapp.pl" target="_blank">dialyapp.pl</a>, aby zobaczyć stronę na żywo :)

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
## Zrzuty ekranu
<img width="1470" height="808" alt="Zrzut ekranu 2026-10-26 o 08 33 32" src="https://github.com/user-attachments/assets/b0393dd3-d27e-4607-b540-c92007f163d8" />
<img width="1470" height="808" alt="Zrzut ekranu 2026-10-26 o 08 34 16 1" src="https://github.com/user-attachments/assets/6d8dfe47-5dae-4d56-97c0-ff9a79c6f1ed" />
