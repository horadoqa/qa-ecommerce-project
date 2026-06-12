# Dynamic Variables

O Postman possui as chamadas **Dynamic Variables**, que funcionam de forma muito parecida com o Faker. Elas geram dados aleatórios automaticamente durante a execução da requisição usando a sintaxe:

```text
{{$randomFirstName}}
{{$randomEmail}}
{{$randomUUID}}
```

ou em scripts:

```javascript
pm.variables.replaceIn('{{$randomFirstName}}')
```

Essas variáveis são baseadas na biblioteca Faker e existem mais de 100 delas. ([Documentação Postman][1])

## Comuns

```text
{{$guid}}
{{$timestamp}}
{{$isoTimestamp}}
{{$randomUUID}}
```

## Texto, números e cores

```text
{{$randomAlphaNumeric}}
{{$randomBoolean}}
{{$randomInt}}
{{$randomColor}}
{{$randomHexColor}}
{{$randomAbbreviation}}
{{$randomWord}}
{{$randomWords}}
{{$randomPhrase}}
{{$randomNoun}}
{{$randomVerb}}
{{$randomIngverb}}
{{$randomAdjective}}
```

## Pessoas

```text
{{$randomFirstName}}
{{$randomLastName}}
{{$randomFullName}}
{{$randomNamePrefix}}
{{$randomNameSuffix}}
{{$randomJobTitle}}
{{$randomJobDescriptor}}
{{$randomJobArea}}
{{$randomJobType}}
```

### Exemplo

```json
{
  "nome": "{{$randomFullName}}",
  "cargo": "{{$randomJobTitle}}"
}
```

---

## Internet

```text
{{$randomEmail}}
{{$randomExampleEmail}}
{{$randomUserName}}
{{$randomPassword}}
{{$randomDomainName}}
{{$randomDomainSuffix}}
{{$randomDomainWord}}
{{$randomIp}}
{{$randomIpv6}}
{{$randomMacAddress}}
{{$randomProtocol}}
{{$randomSemver}}
```

### Exemplo

```json
{
  "email": "{{$randomEmail}}",
  "username": "{{$randomUserName}}"
}
```

---

## Endereço

```text
{{$randomCity}}
{{$randomStreetName}}
{{$randomStreetAddress}}
{{$randomCountry}}
{{$randomCountryCode}}
{{$randomLatitude}}
{{$randomLongitude}}
{{$randomZipCode}}
{{$randomState}}
{{$randomStateAbbr}}
```

### Exemplo

```json
{
  "cidade": "{{$randomCity}}",
  "estado": "{{$randomState}}",
  "cep": "{{$randomZipCode}}"
}
```

---

## Telefone

```text
{{$randomPhoneNumber}}
{{$randomPhoneNumberExt}}
```

---

## Empresa / Negócio

```text
{{$randomCompanyName}}
{{$randomCompanySuffix}}
{{$randomBs}}
{{$randomBsAdjective}}
{{$randomBsBuzz}}
{{$randomBsNoun}}
```

### Exemplo

```json
{
  "empresa": "{{$randomCompanyName}}"
}
```

---

## Comércio / Produtos

```text
{{$randomDepartment}}
{{$randomProduct}}
{{$randomProductAdjective}}
{{$randomProductMaterial}}
{{$randomProductName}}
{{$randomPrice}}
```

### Exemplo

```json
{
  "produto": "{{$randomProductName}}",
  "preco": "{{$randomPrice}}"
}
```

---

## Financeiro

```text
{{$randomBankAccount}}
{{$randomBankAccountName}}
{{$randomBankAccountBic}}
{{$randomBankAccountIban}}
{{$randomCreditCardMask}}
{{$randomTransactionType}}
{{$randomCurrencyCode}}
{{$randomCurrencyName}}
{{$randomCurrencySymbol}}
{{$randomBitcoin}}
```

---

## Datas

```text
{{$randomPastDate}}
{{$randomFutureDate}}
{{$randomRecentDate}}
{{$randomWeekday}}
{{$randomMonth}}
```

---

## Imagens

```text
{{$randomAvatarImage}}
{{$randomImageUrl}}
{{$randomAbstractImage}}
{{$randomAnimalsImage}}
{{$randomBusinessImage}}
{{$randomCatsImage}}
{{$randomCityImage}}
{{$randomFoodImage}}
{{$randomNightlifeImage}}
{{$randomFashionImage}}
{{$randomPeopleImage}}
{{$randomNatureImage}}
{{$randomSportsImage}}
{{$randomTechnicsImage}}
{{$randomTransportImage}}
```

---

## Animais

```text
{{$randomAnimal}}
{{$randomCat}}
{{$randomDog}}
{{$randomBird}}
{{$randomFish}}
{{$randomHorse}}
```

---

## Veículos

```text
{{$randomVehicle}}
{{$randomVehicleManufacturer}}
{{$randomVehicleModel}}
{{$randomVehicleType}}
{{$randomVin}}
```

---

## Sistema / Banco

```text
{{$randomUuid}}
{{$randomSemver}}
{{$randomMimeType}}
{{$randomFileName}}
{{$randomFileType}}
{{$randomFileExt}}
```

---

## Exemplo completo

```json
{
  "id": "{{$randomUUID}}",
  "nome": "{{$randomFullName}}",
  "email": "{{$randomEmail}}",
  "telefone": "{{$randomPhoneNumber}}",
  "empresa": "{{$randomCompanyName}}",
  "cidade": "{{$randomCity}}",
  "produto": "{{$randomProductName}}",
  "preco": "{{$randomPrice}}"
}
```

A lista oficial completa e sempre atualizada das Dynamic Variables do Postman está em: [Postman Dynamic Variables Documentation](https://learning.postman.com/docs/postman/environments-and-globals/variables-list/?utm_source=chatgpt.com). ([Documentação Postman][1])

[1]: https://learning.postman.com/docs/postman/environments-and-globals/variables-list/?utm_source=chatgpt.com "Use dynamic variables to return randomly generated data | Postman Docs"
