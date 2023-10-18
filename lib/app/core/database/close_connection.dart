class CloseConnection {
  void close(db) {
    db?.close();
    db = null;
  }
}
