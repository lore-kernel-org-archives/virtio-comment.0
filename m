Return-Path: <virtio-comment-return-4575-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5CAD49865FA
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Feb 2023 21:58:20 +0000 (UTC)
MIME-Version: 1.0
References: <CAJ3Dt_XZJX=f-WkbD_wESFLztFyKNW_3TUAPnG-H_SpL6H0YaQ@mail.gmail.com>
 <Yii/ToLoR5t9KFjr@stefanha-x1.localdomain> <CAJ3Dt_VTcT64n7bPiRkBBM=SyQWYF1wYYuQr2UnPtZZ-33P9FA@mail.gmail.com>
 <CAC9-NftTiN=g1myoXfqfqUGgvxf+_c_-4+p3zG2sEiXGdStgdw@mail.gmail.com> <Y/0aHrdDNcyTVdPL@fedora>
In-Reply-To: <Y/0aHrdDNcyTVdPL@fedora>
From: Gordon Stewart <gordon@bedrocksystems.com>
Date: Mon, 27 Feb 2023 16:58:03 -0500
Message-ID: <CAC9-NftNQ-6MVk6v7F48H3Nn_aKdMr8k8rTh_wHYQ95m-QEBrw@mail.gmail.com>
Subject: Re: Fwd: [virtio-comment] virtio-net : 5.1.6.2 descriptor-chains on transmitq
Content-Type: multipart/alternative; boundary="000000000000ac080d05f5b59383"
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--000000000000ac080d05f5b59383
Content-Type: text/plain; charset="UTF-8"

Thanks. Here's the issue:

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/165.

I request a vote by TC members that this fix be included in the next
version of the standard.

On Mon, Feb 27, 2023 at 4:01 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Mon, Feb 27, 2023 at 03:27:25PM -0500, Gordon Stewart wrote:
> > Hi Stefan,
> >
> > It took us a while to follow-up on this -- apologies.
> >
> > Here's a patch:
> >
> > From: Gordon Stewart <gordon@bedrocksystems.com>
> > Date: Mon, 27 Feb 2023 13:59:45 -0500
> > Subject: [PATCH] 5.1.6.2 Packet Transmission; clarify "output descriptor"
> >
> > ---
> >  device-types/net/description.tex | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> The next step is creating a GitHub Issue, please see
> https://github.com/oasis-tcs/virtio-spec/#use-of-github-issues.
>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>


-- 
Gordon Stewart
gordon@bedrocksystems.com

BedRock

Systems Inc
*UNBREAKABLE FOUNDATION* *FOR *
*FORMALLY SECURED COMPUTING*

--000000000000ac080d05f5b59383
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks. Here&#39;s the issue:=C2=A0<div><=
br></div><div>Fixes: <a href=3D"https://github.com/oasis-tcs/virtio-spec/is=
sues/165">https://github.com/oasis-tcs/virtio-spec/issues/165</a>.</div><di=
v><br></div><div>I request a vote by TC members that this fix be included i=
n the next version of the standard.=C2=A0</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 27, 2023 at 4:01=
 PM Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Mon, Feb 27, 2023 at 03:27:25PM -0500, Gordon Stewart wrote:<br>
&gt; Hi Stefan,<br>
&gt; <br>
&gt; It took us a while to follow-up on this -- apologies.<br>
&gt; <br>
&gt; Here&#39;s a patch:<br>
&gt; <br>
&gt; From: Gordon Stewart &lt;<a href=3D"mailto:gordon@bedrocksystems.com" =
target=3D"_blank">gordon@bedrocksystems.com</a>&gt;<br>
&gt; Date: Mon, 27 Feb 2023 13:59:45 -0500<br>
&gt; Subject: [PATCH] 5.1.6.2 Packet Transmission; clarify &quot;output des=
criptor&quot;<br>
&gt; <br>
&gt; ---<br>
&gt;=C2=A0 device-types/net/description.tex | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
The next step is creating a GitHub Issue, please see<br>
<a href=3D"https://github.com/oasis-tcs/virtio-spec/#use-of-github-issues" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/oasis-tcs/virtio-sp=
ec/#use-of-github-issues</a>.<br>
<br>
Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" tar=
get=3D"_blank">stefanha@redhat.com</a>&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><span>Gordon Stewart</span></div><d=
iv dir=3D"ltr"><span><a href=3D"mailto:gordon@bedrocksystems.com" target=3D=
"_blank">gordon@bedrocksystems.com</a><br></span></div><p class=3D"MsoNorma=
l" style=3D"text-align:start;word-spacing:0px">
<span style=3D"font-size:16pt;font-family:PRIMETIME;color:rgb(12,107,255)" =
lang=3D"EN-GB">BedRock</span><span style=3D"color:black"></span></p>
<p class=3D"MsoNormal" style=3D"text-align:start;word-spacing:0px">
<span style=3D"font-size:8pt;font-family:&quot;Open Sans&quot;,sans-serif;c=
olor:black" lang=3D"EN-GB">Systems Inc</span><b><span style=3D"font-family:=
&quot;Open Sans&quot;,sans-serif;color:rgb(255,147,0)" lang=3D"EN-GB"><br>
</span></b><b><span style=3D"font-size:10pt;font-family:&quot;Open Sans&quo=
t;,sans-serif;color:rgb(12,107,255)" lang=3D"EN-GB">UNBREAKABLE FOUNDATION<=
/span></b><span style=3D"color:black" lang=3D"EN-GB">
</span><b><span style=3D"font-size:10pt;font-family:&quot;Open Sans&quot;,s=
ans-serif;color:rgb(12,107,255)" lang=3D"EN-GB">FOR
</span></b></p>
<b><span style=3D"font-size:10pt;font-family:&quot;Open Sans&quot;,sans-ser=
if;color:rgb(0,107,255);text-transform:uppercase">FORMALLY SECURED COMPUTIN=
G</span></b></div></div></div></div></div></div></div></div></div>

--000000000000ac080d05f5b59383--

