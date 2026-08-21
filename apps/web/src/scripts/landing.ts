const reveals = document.querySelectorAll<HTMLElement>('.reveal');
const observer = new IntersectionObserver(
	(entries) =>
		entries.forEach(({ isIntersecting, target }) => {
			if (isIntersecting) target.classList.add('in');
		}),
	{ threshold: 0.12 },
);
reveals.forEach((element) => observer.observe(element));

const track = document.querySelector<HTMLElement>('#fcarousel');
document
	.querySelector('#carNext')
	?.addEventListener('click', () =>
		track?.scrollBy({ left: 360, behavior: 'smooth' }),
	);
document
	.querySelector('#carPrev')
	?.addEventListener('click', () =>
		track?.scrollBy({ left: -360, behavior: 'smooth' }),
	);

const tabs = document.querySelectorAll<HTMLButtonElement>('.tab-btn');
const panels = document.querySelectorAll<HTMLElement>('.tab-panel');
tabs.forEach((tab) =>
	tab.addEventListener('click', () => {
		tabs.forEach((button) => {
			button.classList.remove('active');
			button.setAttribute('aria-selected', 'false');
		});
		panels.forEach((panel) => panel.classList.remove('active'));
		tab.classList.add('active');
		tab.setAttribute('aria-selected', 'true');
		document.querySelector(`#tab-${tab.dataset.tab}`)?.classList.add('active');
	}),
);

const banner = document.querySelector<HTMLElement>('#cookieBanner');
window.setTimeout(() => banner?.classList.add('show'), 900);
['cookieAccept', 'cookieEssential'].forEach((id) =>
	document
		.querySelector(`#${id}`)
		?.addEventListener('click', () => banner?.classList.remove('show')),
);
