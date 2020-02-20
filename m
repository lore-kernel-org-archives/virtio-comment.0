Return-Path: virtio-comment-return-1088-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 039E7985F65
	for <virtio-comment@lists.oasis-open.org>; Thu, 20 Feb 2020 20:06:50 +0000 (UTC)
Date: Thu, 20 Feb 2020 15:06:40 -0500 (EST)
From: Yuri Benditovich <ybendito@redhat.com>
Message-ID: <1218680489.7485583.1582229200015.JavaMail.zimbra@redhat.com>
In-Reply-To: <a97a13c4-f82d-a4bf-af0e-6a0bfbbea8e1@redhat.com>
References: <20200219075337.23191-1-yuri.benditovich@daynix.com> <20200219075337.23191-2-yuri.benditovich@daynix.com> <86420fd1-cbb4-0105-4114-ca2d6cb3b8ff@redhat.com> <20200219092244-mutt-send-email-mst@kernel.org> <623f76be-bf87-c473-350e-87fe53b41261@redhat.com> <893990295.7352578.1582184463424.JavaMail.zimbra@redhat.com> <a97a13c4-f82d-a4bf-af0e-6a0bfbbea8e1@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v4 1/1] virtio-net: Define per-packet
 hash reporting feature
Content-Type: multipart/alternative; 
	boundary="----=_Part_7485582_875957582.1582229200014"
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

------=_Part_7485582_875957582.1582229200014
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

----- Original Message -----

> From: "Jason Wang" <jasowang@redhat.com>
> To: "Yuri Benditovich" <ybendito@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>, "Yuri Benditovich"
> <yuri.benditovich@daynix.com>, virtio-comment@lists.oasis-open.org
> Sent: Thursday, February 20, 2020 10:11:51 AM
> Subject: Re: [virtio-comment] [PATCH v4 1/1] virtio-net: Define per-packe=
t
> hash reporting feature

> On 2020/2/20 =E4=B8=8B=E5=8D=883:41, Yuri Benditovich wrote:
> >
> >
> > -----------------------------------------------------------------------=
-
> >
> > *From: *"Jason Wang" <jasowang@redhat.com>
> > *To: *"Michael S. Tsirkin" <mst@redhat.com>
> > *Cc: *"Yuri Benditovich" <yuri.benditovich@daynix.com>,
> > virtio-comment@lists.oasis-open.org
> > *Sent: *Thursday, February 20, 2020 8:38:50 AM
> > *Subject: *Re: [virtio-comment] [PATCH v4 1/1] virtio-net: Define
> > per-packet hash reporting feature
> >
> >
> > On 2020/2/19 =E4=B8=8B=E5=8D=8810:23, Michael S. Tsirkin wrote:
> > > On Wed, Feb 19, 2020 at 08:27:10PM +0800, Jason Wang wrote:
> > >> On 2020/2/19 =E4=B8=8B=E5=8D=883:53, Yuri Benditovich wrote:
> > >>> The device MUST set
> > \field{rss_max_indirection_table_length} to at least 128, if it offers
> > >>> VIRTIO_NET_F_RSS.
> > >>> @@ -3195,6 +3180,8 @@ \subsection{Device
> > Operation}\label{sec:Device Types / Network Device / Device O
> > >>> le16 csum_start;
> > >>> le16 csum_offset;
> > >>> le16 num_buffers;
> > >>> + le32 hash_value; (Only if VIRTIO_NET_F_HASH_REPORT
> > negotiated)
> > >>> + le16 hash_type; (Only if VIRTIO_NET_F_HASH_REPORT
> > negotiated)
> > >>> };
> > >>> \end{lstlisting}
> > >> A question here:
> > >>
> > >> Consider we introduce VIRTIO_NET_F_FEATURE_INFORMATION in the
> > future:
> > >>
> > >> le32 hash_type; // VIRTIO_NET_F_HASH_REPORT
> > >> le32 feature_information; // VIRTIO_NET_F_FEATURE_INFORMATION
> > >>
> > >> What happens if HASH_REPORT is not negotiated, I believe we
> > expect a stable
> > >> ABI(offset) here for feature_information?
> > >>
> > >> Thanks
> > >>
> > > We'll have to decide at that point ... any better ideas?
> >
> >
> > Not sure but something that is self descriptive? (which could be an
> > overkill for fields that only need few bytes).
> >
> > The problem is that the driver typically wants to know the header size
> > from the beginning to configure SG table.

> Yes, so still the above example. Consider a driver only support
> VIRTIO_NET_F_FEATURE_INFORMATION, how to determine the size of the vnet
> header?

> Stable offset is simpler but may waste space.

> > So any self-descriptive layout seems good but in practice not so
> > usable, IMO.

> I think then it can calculate the header length based on the feature
> negotiated.

> hdr_len =3D sizeof(vnet_hdr) + VIRTIO_NET_F_HASH_REPORT ? 4 : 0 +
> VIRTIO_NET_F_FEAUTER_INFORMATION ? 4 : 0

Also possible.=20
We'll need to define it as soon as we define in the spec the second feature=
 affecting packet size.=20
There is also another point raised by Michael some time ago: different pack=
et layouts for TX and RX.=20

> Thanks

> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.

> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.

> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/

------=_Part_7485582_875957582.1582229200014
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: courier new,courier,monaco,monospace=
,sans-serif; font-size: 12pt; color: #000000"><div><br></div><div><br></div=
><hr id=3D"zwchr"><blockquote style=3D"border-left:2px solid #1010FF;margin=
-left:5px;padding-left:5px;color:#000;font-weight:normal;font-style:normal;=
text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;=
"><b>From: </b>"Jason Wang" &lt;jasowang@redhat.com&gt;<br><b>To: </b>"Yuri=
 Benditovich" &lt;ybendito@redhat.com&gt;<br><b>Cc: </b>"Michael S. Tsirkin=
" &lt;mst@redhat.com&gt;, "Yuri Benditovich" &lt;yuri.benditovich@daynix.co=
m&gt;, virtio-comment@lists.oasis-open.org<br><b>Sent: </b>Thursday, Februa=
ry 20, 2020 10:11:51 AM<br><b>Subject: </b>Re: [virtio-comment] [PATCH v4 1=
/1] virtio-net: Define per-packet hash reporting feature<br><div><br></div>=
<br>On 2020/2/20 =E4=B8=8B=E5=8D=883:41, Yuri Benditovich wrote:<br>&gt;<br=
>&gt;<br>&gt; -------------------------------------------------------------=
-----------<br>&gt;<br>&gt; &nbsp; &nbsp; *From: *"Jason Wang" &lt;jasowang=
@redhat.com&gt;<br>&gt; &nbsp; &nbsp; *To: *"Michael S. Tsirkin" &lt;mst@re=
dhat.com&gt;<br>&gt; &nbsp; &nbsp; *Cc: *"Yuri Benditovich" &lt;yuri.bendit=
ovich@daynix.com&gt;,<br>&gt; &nbsp; &nbsp; virtio-comment@lists.oasis-open=
.org<br>&gt; &nbsp; &nbsp; *Sent: *Thursday, February 20, 2020 8:38:50 AM<b=
r>&gt; &nbsp; &nbsp; *Subject: *Re: [virtio-comment] [PATCH v4 1/1] virtio-=
net: Define<br>&gt; &nbsp; &nbsp; per-packet hash reporting feature<br>&gt;=
<br>&gt;<br>&gt; &nbsp; &nbsp; On 2020/2/19 =E4=B8=8B=E5=8D=8810:23, Michae=
l S. Tsirkin wrote:<br>&gt; &nbsp; &nbsp; &gt; On Wed, Feb 19, 2020 at 08:2=
7:10PM +0800, Jason Wang wrote:<br>&gt; &nbsp; &nbsp; &gt;&gt; On 2020/2/19=
 =E4=B8=8B=E5=8D=883:53, Yuri Benditovich wrote:<br>&gt; &nbsp; &nbsp; &gt;=
&gt;&gt; &nbsp; &nbsp;The device MUST set<br>&gt; &nbsp; &nbsp; \field{rss_=
max_indirection_table_length} to at least 128, if it offers<br>&gt; &nbsp; =
&nbsp; &gt;&gt;&gt; &nbsp; &nbsp;VIRTIO_NET_F_RSS.<br>&gt; &nbsp; &nbsp; &g=
t;&gt;&gt; @@ -3195,6 +3180,8 @@ \subsection{Device<br>&gt; &nbsp; &nbsp; O=
peration}\label{sec:Device Types / Network Device / Device O<br>&gt; &nbsp;=
 &nbsp; &gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;le16 csum_sta=
rt;<br>&gt; &nbsp; &nbsp; &gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;le16 csum_offset;<br>&gt; &nbsp; &nbsp; &gt;&gt;&gt; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;le16 num_buffers;<br>&gt; &nbsp; &nbsp; &gt;&gt;&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp;le32 hash_value; (Only if VIRTIO_NET_F_HASH_=
REPORT<br>&gt; &nbsp; &nbsp; negotiated)<br>&gt; &nbsp; &nbsp; &gt;&gt;&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp;le16 hash_type; &nbsp;(Only if VIRTIO_NET_F_H=
ASH_REPORT<br>&gt; &nbsp; &nbsp; negotiated)<br>&gt; &nbsp; &nbsp; &gt;&gt;=
&gt; &nbsp; &nbsp;};<br>&gt; &nbsp; &nbsp; &gt;&gt;&gt; &nbsp; &nbsp;\end{l=
stlisting}<br>&gt; &nbsp; &nbsp; &gt;&gt; A question here:<br>&gt; &nbsp; &=
nbsp; &gt;&gt;<br>&gt; &nbsp; &nbsp; &gt;&gt; Consider we introduce VIRTIO_=
NET_F_FEATURE_INFORMATION in the<br>&gt; &nbsp; &nbsp; future:<br>&gt; &nbs=
p; &nbsp; &gt;&gt;<br>&gt; &nbsp; &nbsp; &gt;&gt; le32 hash_type; // VIRTIO=
_NET_F_HASH_REPORT<br>&gt; &nbsp; &nbsp; &gt;&gt; le32 feature_information;=
 // VIRTIO_NET_F_FEATURE_INFORMATION<br>&gt; &nbsp; &nbsp; &gt;&gt;<br>&gt;=
 &nbsp; &nbsp; &gt;&gt; What happens if HASH_REPORT is not negotiated, I be=
lieve we<br>&gt; &nbsp; &nbsp; expect a stable<br>&gt; &nbsp; &nbsp; &gt;&g=
t; ABI(offset) here for feature_information?<br>&gt; &nbsp; &nbsp; &gt;&gt;=
<br>&gt; &nbsp; &nbsp; &gt;&gt; Thanks<br>&gt; &nbsp; &nbsp; &gt;&gt;<br>&g=
t; &nbsp; &nbsp; &gt; We'll have to decide at that point ... any better ide=
as?<br>&gt;<br>&gt;<br>&gt; &nbsp; &nbsp; Not sure but something that is se=
lf descriptive? (which could be an<br>&gt; &nbsp; &nbsp; overkill for field=
s that only need few bytes).<br>&gt;<br>&gt; The problem is that the driver=
 typically wants to know the header size <br>&gt; from the beginning to con=
figure SG table.<br><div><br></div><br>Yes, so still the above example. Con=
sider a driver only support <br>VIRTIO_NET_F_FEATURE_INFORMATION, how to de=
termine the size of the vnet <br>header?<br><div><br></div>Stable offset is=
 simpler but may waste space.<br><div><br></div><br>&gt; So any self-descri=
ptive layout seems good but in practice not so <br>&gt; usable, IMO.<br><di=
v><br></div><br>I think then it can calculate the header length based on th=
e feature <br>negotiated.<br><div><br></div>hdr_len =3D sizeof(vnet_hdr) + =
VIRTIO_NET_F_HASH_REPORT ? 4 : 0 + <br>VIRTIO_NET_F_FEAUTER_INFORMATION ? 4=
 : 0<br></blockquote><div>Also possible.</div><div> We'll need to define it=
 as soon as we define in the spec the second feature affecting packet size.=
<br></div><div>There is also another point raised by Michael some time ago:=
 different packet layouts for TX and RX.<br></div><div><br></div><blockquot=
e style=3D"border-left:2px solid #1010FF;margin-left:5px;padding-left:5px;c=
olor:#000;font-weight:normal;font-style:normal;text-decoration:none;font-fa=
mily:Helvetica,Arial,sans-serif;font-size:12pt;">Thanks<br><div><br></div><=
br>This publicly archived list offers a means to provide input to the
<br>OASIS Virtual I/O Device (VIRTIO) TC.
<br><br>In order to verify user consent to the Feedback License terms and
<br>to minimize spam in the list archive, subscription is required
<br>before posting.
<br><br>Subscribe: virtio-comment-subscribe@lists.oasis-open.org
<br>Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
<br>List help: virtio-comment-help@lists.oasis-open.org
<br>List archive: https://lists.oasis-open.org/archives/virtio-comment/
<br>Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.p=
df
<br>List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing=
-lists
<br>Committee: https://www.oasis-open.org/committees/virtio/
<br>Join OASIS: https://www.oasis-open.org/join/<br><div><br></div></blockq=
uote><div><br></div></div></body></html>
------=_Part_7485582_875957582.1582229200014--

