using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Takhfifan
{
    public class functions
    {
        public static string GenerateRandomString(int length)
        {
            string allowedChar = "";
            allowedChar = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,";
            allowedChar += "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,";
            allowedChar += "1,2,3,4,5,6,7,8,9,0,!,@,#,$,%,&,?";
            char[] sep = { ',' };
            string[] arr = allowedChar.Split(sep);
            string passwordString = "";
            string temp = "";
            var rand = new Random();
            for(var i =0; i < length; i++)
            {
                temp = arr[rand.Next(0, arr.Length)];
                passwordString += temp;
            }

            return passwordString;
        }
    }
}