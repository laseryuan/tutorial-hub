jest.setTimeout(60000)

describe('Basic authentication e2e tests', () => {
  beforeAll( async () => {
  // Set a definite size for the page viewport so view is consistent across browsers
    await page.setViewport( {
      width: 1366,
      height: 768,
      deviceScaleFactor: 1
    } );	

    await page.goto('https://google.com');
    } );

  it('should be titled "Google"', async () => {
    await expect(page.title()).resolves.toMatch('Google');
  });
});
