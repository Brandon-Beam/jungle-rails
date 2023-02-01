describe('example to-do app', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get("[alt='Scented Blade']").click();
    cy.contains("Scented Blade").should("be.visible")

  })

});