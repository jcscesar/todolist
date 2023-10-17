class CloseConnection {
  static void close(db) {
    db?.close();
    db = null;
  }
}
