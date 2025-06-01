USE ShopProject;
GO
--making added product Available
CREATE TRIGGER make_Available ON Product AFTER INSERT AS BEGIN
	UPDATE Product SET Available=1 WHERE ProductID IN(SELECT ProductID FROM inserted)
END;
GO
--making added comment date up to date
CREATE TRIGGER UpToDate_Comment ON Comment AFTER INSERT AS BEGIN
	UPDATE Comment SET CommentDate=GETDATE() WHERE CommentID IN(SELECT CommentID FROM inserted);
END;

