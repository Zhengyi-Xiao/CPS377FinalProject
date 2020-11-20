INSERT INTO University VALUES("Franklin and Marshall College", "Lancaster", "PA");
INSERT INTO University VALUES("Columbia University", "New York City", "NY");

INSERT INTO Department VALUES("Math", "Franklin and Marshall College", 100000, 13);
INSERT INTO Department VALUES("Computer Science", "Franklin and Marshall College", 20000, 5);
INSERT INTO Department VALUES("Biology", "Franklin and Marshall College", 1045, 15);
INSERT INTO Department VALUES("Physics", "Franklin and Marshall College", 200220, 12);
INSERT INTO Department VALUES("Math", "Columbia University", 100000, 53);
INSERT INTO Department VALUES("Biology", "Columbia University", 1000000, 33);
INSERT INTO Department VALUES("Physics", "Columbia University", 2000000, 30);
INSERT INTO Department VALUES("Computer Science", "Columbia University", 1000000, 60);

INSERT INTO Course VALUES("MAT109", "Math", "It is an intro class.");
INSERT INTO Course VALUES("MAT110", "Math", "It is an intermediate class.");
INSERT INTO Course VALUES("MAT111", "Math", "It is an advanced class.");
INSERT INTO Course VALUES("CPS101", "Computer Science", "It is an intro class.");
INSERT INTO Course VALUES("CPS102", "Computer Science", "It is an intermediate class.");
INSERT INTO Course VALUES("CPS222", "Computer Science", "It is an advanced class.");
INSERT INTO Course VALUES("PHY110", "Physics", "It is an intro class.");
INSERT INTO Course VALUES("PHY111", "Physics", "It is an intermediate class.");

INSERT INTO Professor VALUES("zx123@fandm.edu", "Franklin and Marshall College","Bob","Hamiliton","He/him","Math","asdasd","On Earth");
INSERT INTO Professor VALUES("de312@fandm.edu", "Franklin and Marshall College","James","Hamiliton","He/him","Computer Science","123123","On Earth");
INSERT INTO Professor VALUES("zg567@fandm.edu", "Franklin and Marshall College","John","Hamiliton","He/him","Computer Science","afe","On Earth");
INSERT INTO Professor VALUES("es133@fandm.edu", "Franklin and Marshall College","Mary","Hamiliton","She/her","Physics","zxcvzxcv","On Earth");
INSERT INTO Professor VALUES("dd312@columbia.edu", "Columbia University","Patricia","Hamiliton","She/her","Computer Science","zxasdfcvzxcv","On Earth");

INSERT INTO Student VALUES("st123@fandm.edu","Studnet", "A", '1998-11-12', "Franklin and Marshall College","asdasd","He/him","Computer Science",3.0,2021,"On earth");
INSERT INTO Student VALUES("st124@fandm.edu","Studnet", "B", '1998-1-12', "Franklin and Marshall College","asdasd","He/him","Math",3.6,2022,"On earth");
INSERT INTO Student VALUES("st125@fandm.edu","Studnet", "C", '2000-12-12', "Franklin and Marshall College","asdasd","She/her","Physics",3.3,2023,"On earth");
INSERT INTO Student VALUES("st126@fandm.edu","Studnet", "D", '1997-10-2', "Franklin and Marshall College","asdasd","She/her","Computer Science",3.2,2023,"On earth");
INSERT INTO Student VALUES("st127@columbia.edu","Studnet", "E", '1998-10-2', "Columbia University","asdasd","She/her","Computer Science",3.6,2021,"On earth");
INSERT INTO Student VALUES("st128@fandm.edu","Studnet", "F", '1999-10-2', "Franklin and Marshall College","asdasd","She/her","Computer Science",2.9,2023,"On earth");
INSERT INTO Student VALUES("st129@fandm.edu","Studnet", "G", '1999-10-2', "Franklin and Marshall College","asdasd","He/him","Computer Science",2.8,2023,"On earth");
INSERT INTO Student VALUES("st127@fandm.edu","Studnet", "E", '1998-10-2', "Franklin and Marshall College","asdasd","She/her","Computer Science",3.6,2021,"On earth");

INSERT INTO Advising VALUES("dd312@columbia.edu","st127@columbia.edu");
INSERT INTO Advising VALUES("zx123@fandm.edu","st123@fandm.edu");
INSERT INTO Advising VALUES("zx123@fandm.edu","st124@fandm.edu");
INSERT INTO Advising VALUES("zx123@fandm.edu","st125@fandm.edu");
INSERT INTO Advising VALUES("zx123@fandm.edu","st126@fandm.edu");

INSERT INTO Advising VALUES("de312@fandm.edu","st124@fandm.edu");
INSERT INTO Advising VALUES("de312@fandm.edu","st125@fandm.edu");

INSERT INTO Section VALUES("CPS101","01","10:20","Room 102", "Stager");
INSERT INTO Section VALUES("CPS102","01","10:20","Room 302", "Stager");
INSERT INTO Section VALUES("CPS101","02","13:20","Room 102", "Stager");
INSERT INTO Section VALUES("CPS101","03","10:20","Room 312", "Stager");
INSERT INTO Section VALUES("CPS222","01","11:20","Room 312", "Stager");
INSERT INTO Section VALUES("MAT111","01","10:20","Room 202", "Stager");
INSERT INTO Section VALUES("PHY111","01","17:20","Room 232", "Physics Building");

INSERT INTO Teaching VALUES("es133@fandm.edu","PHY111","01");
INSERT INTO Teaching VALUES("zg567@fandm.edu","CPS101","01");
INSERT INTO Teaching VALUES("de312@fandm.edu","CPS101","02");
INSERT INTO Teaching VALUES("de312@fandm.edu","CPS102","01");
INSERT INTO Teaching VALUES("zx123@fandm.edu","CPS101","03");
INSERT INTO Teaching VALUES("zx123@fandm.edu","CPS222","01");

INSERT INTO Taking VALUES("st123@fandm.edu","CPS101","01","A");
INSERT INTO Taking VALUES("st124@fandm.edu","CPS101","01","A-");
INSERT INTO Taking VALUES("st125@fandm.edu","CPS101","01","B-");
INSERT INTO Taking VALUES("st126@fandm.edu","CPS101","02","C-");
INSERT INTO Taking VALUES("st127@fandm.edu","CPS101","02","D-");
INSERT INTO Taking VALUES("st123@fandm.edu","CPS102","01","A");
INSERT INTO Taking VALUES("st124@fandm.edu","CPS102","01","A-");
INSERT INTO Taking VALUES("st125@fandm.edu","PHY111","01","B-");

INSERT INTO Assignment VALUES("CPS101","01",1,"st123@fandm.edu",'2020-11-01',"A");
INSERT INTO Assignment VALUES("CPS101","01",1,"st124@fandm.edu",'2020-11-01',"B");
INSERT INTO Assignment VALUES("CPS101","01",1,"st125@fandm.edu",'2020-11-01',"A");
INSERT INTO Assignment VALUES("CPS101","01",1,"st126@fandm.edu",'2020-11-01',"A");
INSERT INTO Assignment VALUES("CPS101","01",2,"st123@fandm.edu","2020-12-01","-");
INSERT INTO Assignment VALUES("CPS101","01",2,"st124@fandm.edu","2020-12-01","-");
INSERT INTO Assignment VALUES("CPS101","01",2,"st125@fandm.edu","2020-12-01","-");
INSERT INTO Assignment VALUES("CPS101","01",2,"st126@fandm.edu","2020-12-01","-");
