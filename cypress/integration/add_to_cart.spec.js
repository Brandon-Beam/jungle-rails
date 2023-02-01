describe('example to-do app', () => {
  beforeEach(() => {

    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get('.btn').first().click({ force: true });
    cy.get('a[href="/cart"]').should("have.text", ' \n          My Cart (1) ')
  })

});