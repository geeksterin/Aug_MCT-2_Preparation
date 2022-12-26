//Modify Matrix----------------------------------------
import java.io.*;
import java.util.*;

public class Solution {
    
    public static void modifyMatrixWithMinusOne(int[][] arr, int r, int c){
        //filling -1 in row
        for(int i=0; i<arr[0].length; i++){
            if(arr[r][i] !=1){
                arr[r][i]=-1;
            }
        }
        
         //filling -1 in column
        for(int i=0; i<arr.length; i++){
            if(arr[i][c] !=1){
                arr[i][c]=-1;
            }
        }
        
    }
    
    public static void modifyMatrix(int arr[][]){
        int n= arr.length;
        int m = arr[0].length;
        
        for(int i=0; i<n; i++){
            for(int j=0; j<m; j++){
                if(arr[i][j]==1){
                    modifyMatrixWithMinusOne(arr,i,j);
                }
            }
        }
        
        for(int i=0; i<n; i++){
            for(int j=0; j<m; j++){
                if(arr[i][j]==-1){
                   arr[i][j]=1;
                }
            }
        }
    
        for(int i=0; i<n; i++){
            for(int j=0; j<m; j++){
               System.out.print(arr[i][j]+" ");
            }
            System.out.println();
        }
    }

    public static void main(String[] args) {
       Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int m = sc.nextInt();
        int[][] arr = new int[n][m];
        for(int i=0; i<n; i++){
            for(int j=0; j<m; j++){
                arr[i][j]=sc.nextInt();
            }
        }
        
         modifyMatrix(arr);
        
    }
}



//Rotation check in Matrix------------------------------------
import java.io.*;
import java.util.*;

public class Solution {

    public static void main(String[] args) {
       Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[][] arr = new int[n][n];
        for(int i=0; i<n; i++){
            for(int j=0; j<n; j++){
                arr[i][j]=sc.nextInt();
            }
        }
        
        String str="";
        for(int i=0; i<n; i++){
            str+=arr[0][i];
        }
        str= str+ str;
        
        for(int i=0; i<n; i++){
            String curr="";
            for(int j=0; j<n; j++){
                curr+=arr[i][j];
            }
            if(str.indexOf(curr)==-1){
                System.out.print("NO");
                return;
            }
        }
        
        System.out.print("YES");
    }
}


//N Queens---------------------------------------------
import java.io.*;
import java.util.*;

public class Solution {
    
    public static String checkNQueen(int[][] arr, int r, int c){
        int n = arr.length;
        //North (upside)
        for(int i=r-1; i>=0; i--){
            if(arr[i][c]==1){
                return "Danger";
            }
        }
        
        //South (downwards)
        for(int i=r+1; i<n; i++){
            if(arr[i][c]==1){
                return "Danger";
            }
        }
        
        //East (Rightside of row)
        for(int i=c+1; i<n; i++){
            if(arr[r][i]==1){
                return "Danger";
            }
        }
        
        //West (Leftside of row)
        for(int i=c-1; i>=0; i--){
            if(arr[r][i]==1){
                return "Danger";
            }
        }
        
        //NorthEast (Right Upside)
        for(int i=r-1, j=c+1; j<n && i>=0; i--, j++){
            if(arr[i][j]==1){
                return "Danger";
            }
        }
        
        //NorthWest (Left Upside)
        for(int i=r-1, j=c-1; j>=0 && i>=0; i--, j--){
            if(arr[i][j]==1){
                return "Danger";
            }
        }
        
        //SouthEast (Right Downside)
        for(int i=r+1, j=c+1; j<n && i<n; i++, j++){
            if(arr[i][j]==1){
                return "Danger";
            }
        }
        
        //SouthWest (Left Downside)
        for(int i=r+1, j=c-1; j>=0 && i<n; i++, j--){
            if(arr[i][j]==1){
                return "Danger";
            }
        }
        return "N Queens";
    }

    public static void main(String[] args) {
       Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[][] arr = new int[n][n];
        for(int i=0; i<n; i++){
            for(int j=0; j<n; j++){
                arr[i][j]=sc.nextInt();
            }
        }
         for(int i=0; i<n; i++){
            for(int j=0; j<n; j++){
               if(arr[i][j]==1){
                   System.out.print(checkNQueen(arr, i, j));
                   return;
               }
            }
        }
        
        
        
    }
}


// Cross Word-----------------------------------------------
import java.io.*;
import java.util.*;

public class Solution {
    
    static boolean isWordPresent(char[][] arr,int r, int c, String word){
        int n = arr.length;
        String curr = "";
        
        //South (Downside)
        for(int i =r; i<n ;i++){
            curr = curr +arr[i][c];
            if(curr.equals(word)){
                return true;
            }
        }
        
        //East (Rightside)
        curr = "";
        for(int i =c; i<n ;i++){
            curr = curr +arr[r][i];
            if(curr.equals(word)){
                return true;
            }
        }
        
        //SouthEast (Right Downside)
        curr = "";
        for(int i =r+1, j=c; i<n && j<n ;i++, j++){
            curr = curr +arr[i][j];
            if(curr.equals(word)){
                return true;
            }
        }
        
        //SouthWest (Left Downside)
        curr = "";
        for(int i =r+1, j=c; i<n && j>=0 ;i++, j--){
            curr = curr +arr[i][j];
            if(curr.equals(word)){
                return true;
            }
        }
        return false;
        
    }
    
    
    
    static boolean crossWord(char[][] arr, String word){
        int n = arr.length;
        
        for(int i=0; i<n; i++){
            for(int j=0; j<n; j++){
                if(isWordPresent(arr,i, j, word)){
                    return true;
                }
            }
        }
        return false;
        
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        char[][] arr = new char[n][n];
        for(int i=0; i<n; i++){
            for(int j=0; j<n; j++){
                arr[i][j]=sc.next().charAt(0);
            }
        }
        
        String word = sc.next();
        boolean ans =  crossWord(arr, word);
        System.out.print(ans);
    }
}



//number of square matrix with all one---------------------------------------
import java.io.*;
import java.util.*;

public class Solution {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int m = sc.nextInt();
        int n = sc.nextInt();
        int[][] arr = new int[m][n];
        for(int i=0; i<m; i++){
            for(int j=0; j<n; j++){
                arr[i][j]=sc.nextInt();
            }
        }
        
         for(int i=1; i<m; i++){
            for(int j=1; j<n; j++){
                if(arr[i][j]==1){
                    int min = Math.min(arr[i-1][j], arr[i][j-1]);//2
                    arr[i][j]= Math.min(arr[i-1][j-1], min)+1;//
                }
            }
        }
        
        int count=0;
        for(int i=0; i<m; i++){
            for(int j=0; j<n; j++){
                count=count+arr[i][j];
            }
        }
           System.out.println(count);
        
// 0 1 1 1
// 1 1 2 2
// 0 1 2 3
        
    }
}
