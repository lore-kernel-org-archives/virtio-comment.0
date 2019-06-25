Return-Path: virtio-comment-return-764-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 15F05985A41
	for <virtio-comment@lists.oasis-open.org>; Tue, 25 Jun 2019 08:29:36 +0000 (UTC)
References: <20190625073336.7813-1-ybettan@redhat.com>
 <20190625075234.GA12603@stefanha-x1.localdomain>
From: Yoni Bettan <ybettan@redhat.com>
Message-ID: <bf58a65d-296e-a3f5-c09b-28cf294feec2@redhat.com>
Date: Tue, 25 Jun 2019 11:29:28 +0300
MIME-Version: 1.0
In-Reply-To: <20190625075234.GA12603@stefanha-x1.localdomain>
Content-Type: multipart/alternative;
 boundary="------------E962E02E0AFEF319216DDA5A"
Content-Language: en-US
Subject: Re: [virtio-comment] [PATCH V2] Added building instruction to
 README.md.
To: Stefan Hajnoczi <stefanha@redhat.com>, mst@redhat.com
Cc: virtio-comment@lists.oasis-open.org, ehabkost@redhat.com, ailan@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

--------------E962E02E0AFEF319216DDA5A
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


On 6/25/19 10:52 AM, Stefan Hajnoczi wrote:
> On Tue, Jun 25, 2019 at 10:33:36AM +0300, Yoni Bettan wrote:
>> Signed-off-by: Yoni Bettan <ybettan@redhat.com>
>> ---
>>   README.md | 34 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/README.md b/README.md
>> index 3de0c1e..fc33c9f 100644
>> --- a/README.md
>> +++ b/README.md
>> @@ -29,6 +29,40 @@
>>   <div>
>>   
>>   <h3>Further Description of this Repository</h3>
>> +<h4>Building Instructions</h4>
>> +<p>In order to build the spec you will need <a href="https://www.tug.org/texlive/">Tex-Live</a>.
>> +Installing it can be done via:<br>
>> +Fedora:
>> +<code>
>> +sudo dnf install texlive-scheme-full
>> +</code><br>
>> +Ubuntu:
>> +<code>
>> +sudo apt-get install texlive-full
>> +</code><br></p>
>> +<p>The building proccess is done with
>> +<code>
>> +./makeall.sh
>> +</code>
>> +and it contains 3 main parts:
>> +<code>
>> +makezip.sh
>> +</code>,
>> +<code>
>> +makehtml.sh
>> +</code>,
>> +<code>
>> +makepdf.sh
>> +</code>.
>> +Using
>> +<code>
>> +./makehtml.sh
>> +</code>
>> +should be enought if you just want to test your changes since
>> +<code>
>> +makepdf.sh
>> +</code>
>> +may required some font packages.</p>
> Thanks for adding instructions.  I have hit latex errors in the past
> that only happened with makepdf.sh, so ideally everyone should use
> makeall.sh.


Did you mean ideally everyone should use makehtml.sh ?

>
> The font requirement is a real pain.  Can we switch to widely available
> free fonts?
>
> Stefan

--------------E962E02E0AFEF319216DDA5A
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/25/19 10:52 AM, Stefan Hajnoczi
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190625075234.GA12603@stefanha-x1.localdomain">
      <pre class="moz-quote-pre" wrap="">On Tue, Jun 25, 2019 at 10:33:36AM +0300, Yoni Bettan wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Yoni Bettan <a class="moz-txt-link-rfc2396E" href="mailto:ybettan@redhat.com">&lt;ybettan@redhat.com&gt;</a>
---
 README.md | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/README.md b/README.md
index 3de0c1e..fc33c9f 100644
--- a/README.md
+++ b/README.md
@@ -29,6 +29,40 @@
 &lt;div&gt;
 
 &lt;h3&gt;Further Description of this Repository&lt;/h3&gt;
+&lt;h4&gt;Building Instructions&lt;/h4&gt;
+&lt;p&gt;In order to build the spec you will need &lt;a href=<a class="moz-txt-link-rfc2396E" href="https://www.tug.org/texlive/">"https://www.tug.org/texlive/"</a>&gt;Tex-Live&lt;/a&gt;.
+Installing it can be done via:&lt;br&gt;
+Fedora:
+&lt;code&gt;
+sudo dnf install texlive-scheme-full
+&lt;/code&gt;&lt;br&gt;
+Ubuntu:
+&lt;code&gt;
+sudo apt-get install texlive-full
+&lt;/code&gt;&lt;br&gt;&lt;/p&gt;
+&lt;p&gt;The building proccess is done with
+&lt;code&gt;
+./makeall.sh
+&lt;/code&gt;
+and it contains 3 main parts:
+&lt;code&gt;
+makezip.sh
+&lt;/code&gt;,
+&lt;code&gt;
+makehtml.sh
+&lt;/code&gt;,
+&lt;code&gt;
+makepdf.sh
+&lt;/code&gt;.
+Using
+&lt;code&gt;
+./makehtml.sh
+&lt;/code&gt;
+should be enought if you just want to test your changes since
+&lt;code&gt;
+makepdf.sh
+&lt;/code&gt;
+may required some font packages.&lt;/p&gt;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thanks for adding instructions.  I have hit latex errors in the past
that only happened with makepdf.sh, so ideally everyone should use
makeall.sh.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Did you mean ideally everyone should use <font color="#ff0000">makehtml.sh
        ?<br>
      </font></p>
    <blockquote type="cite"
      cite="mid:20190625075234.GA12603@stefanha-x1.localdomain">
      <pre class="moz-quote-pre" wrap="">

The font requirement is a real pain.  Can we switch to widely available
free fonts?

Stefan
</pre>
    </blockquote>
  </body>
</html>

--------------E962E02E0AFEF319216DDA5A--
