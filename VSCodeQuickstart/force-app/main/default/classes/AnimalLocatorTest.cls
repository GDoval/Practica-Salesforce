@isTest
public with sharing class AnimalLocatorTest {
    @isTest static  void testGetCallout() {
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
      String result = AnimalLocator.getAnimalNameById(1);
      // Verify mock response is not null
      String esperado = 'chicken';
      System.assertEquals(esperado,result,
          'The callout returned a null response.');      
  }
}
