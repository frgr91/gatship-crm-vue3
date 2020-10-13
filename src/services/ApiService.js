import axios from "axios";

const apiClient = axios.create({
  baseURL: "https://localhost:44386",
  withCredentials: false,
  headers: {
    Accept: "application/json",
    "Content-Type": "application/json",
  },
});

export default {
  // GET API
  async getKunder() {
    return apiClient.get("/api/kunde");
  },
  getKunde(id) {
    return apiClient.get("/api/kunde/" + id);
  },
  getKundetyper() {
    return apiClient.get("/api/kundetype");
  },
  async getKundetype(kundeNr) {
    return apiClient.get("/api/kundekundetype?kundenr=" + kundeNr);
  },
  getKontaktpersoner() {
    return apiClient.get("/api/kontaktperson");
  },
  getKontaktperson(kundeNr) {
    return apiClient.get("/api/kontaktperson?kundenr=" + kundeNr);
  },
  getPostadresse(postNr) {
    return apiClient.get("/api/postadresse/" + postNr);
  },

  // POST API
  postKontaktpersoner(kontaktperson) {
    return apiClient.post("/api/kontaktperson", kontaktperson);
  },
  postKunde(kunde) {
    return apiClient.post("/api/kunde", kunde);
  },
  postKundetype(kundetype) {
    return apiClient.post("/api/kundetype", kundetype);
  },

  // PUT API
  putKunde(kunde) {
    return apiClient.put("/api/kunde/" + kunde.kundeNr, {
      kundeNr: kunde.kundeNr,
      kundeTypeNavn: kunde.kundeTypeNavn,
      firmaNavn: kunde.firmaNavn,
      telefonNr: kunde.telefonNr,
      epost: kunde.epost,
      adresse: kunde.adresse,
      postNr: kunde.postNr,
    });
  },
  putKontaktperson(kontaktperson) {
    return apiClient.put("/api/kontaktperson/" + kontaktperson.id, {
      id: kontaktperson.id,
      kundeNr: kontaktperson.kundeNr,
      fornavn: kontaktperson.fornavn,
      etternavn: kontaktperson.etternavn,
      tittel: kontaktperson.tittel,
      epost: kontaktperson.epost,
      mobilNr: kontaktperson.mobilNr,
    });
  },

  // DELETE API
  deleteKunde(id) {
    return apiClient.delete("/api/kunde/" + id, { data: id });
  },
  deleteKontaktperson(id) {
    return apiClient.delete("/api/kontaktperson/" + id, { data: id });
  },
};
